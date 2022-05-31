FROM ubuntu:22.04
    # SETING TIMEZONE
ENV TZ=America/Sao_paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $tz > /etc/timezone


    # UPDATING AND INSTALLING NECESSARY PACKAGES
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl unzip wget git clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev openjdk-8-jdk
# RUN apt-get install -y xz-utils zip libglu1-mesa


RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer


    # INSTALLING ANDROID SDK TOOLS
RUN mkdir -p Android/Sdk
ENV ANDROID_SDK_ROOT=/home/developer/Android/Sdk
RUN mkdir -p .android && touch .android/repositories.cfg

RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/Sdk/tools
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"


    # INSTALLING FLUTTER SDK
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH "$PATH:/home/developer/flutter/bin"

RUN /home/developer/Android/Sdk/tools/bin/sdkmanager --install "cmdline-tools;latest"

RUN flutter doctor




COPY pubspec.yaml pubspec.lock owen_wilson.iml analysis_options.yaml .flutter-plugins .flutter-plugins-dependencies ./app/

COPY ios ./app/
COPY android ./app/

COPY lib ./app/
COPY test ./app/

COPY . ./app/




EXPOSE 3000
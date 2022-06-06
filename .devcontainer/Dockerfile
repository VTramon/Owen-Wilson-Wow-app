FROM ubuntu:18.04

    # SETING TIMEZONE
ENV TZ=America/Sao_paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $tz > /etc/timezone


    # UPDATING AND INSTALLING NECESSARY PACKAGES
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl unzip wget git clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev openjdk-8-jdk xz-utils zip libglu1-mesa
# RUN apt-get install npm

# node version 16.15.1
RUN wget -O node.tar.xz https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
RUN tar -xvf node.tar.xz
ENV PATH "$PATH:/node-v16.15.1-linux-x64/bin"




# RUN npm install -g firebase-tools



# RUN useradd -ms /bin/bash developer
USER root
RUN mkdir -p /workspace/app
WORKDIR /workspace


    # INSTALLING ANDROID SDK TOOLS
RUN mkdir -p Android/Sdk
ENV ANDROID_SDK_ROOT=/workspace/Android/Sdk
RUN mkdir -p .android && touch .android/repositories.cfg

RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/Sdk/tools
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/workspace/Android/sdk/platform-tools"


    # INSTALLING FLUTTER SDK
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH "$PATH:/workspace/flutter/bin"

RUN /workspace/Android/Sdk/tools/bin/sdkmanager --install "cmdline-tools;latest"

# RUN flutter doctor

RUN npm install -g firebase-tools
RUN dart pub global activate flutterfire_cli
ENV PATH "$PATH":"/workspace/.pub-cache/bin"




# COPY pubspec.* ./workspace/

# COPY owen_wilson.iml analysis_options.yaml .flutter-plugins .flutter-plugins-dependencies ./workspace/

# COPY ios ./workspace/
# COPY android ./workspace/

# COPY lib ./workspace/
# COPY test ./workspace/

# COPY . ./workspace/


# RUN cd /home/developer/workspace && flutter clean . && flutter pub get .


# EXPOSE 3000
# RUN apt-get install -y nodejs
# RUN node -v
# RUN npm -v
# RUN npm install firebase-tools

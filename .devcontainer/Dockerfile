FROM ubuntu:18.04

    # SETING TIMEZONE
ENV TZ=America/Sao_paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $tz > /etc/timezone


    # UPDATING AND INSTALLING NECESSARY PACKAGES
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl unzip wget git clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev openjdk-8-jdk xz-utils zip libglu1-mesa

RUN wget -O node.tar.xz https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
RUN tar -xvf node.tar.xz
ENV PATH "$PATH:/node-v16.15.1-linux-x64/bin"



RUN useradd -ms /bin/bash developer
# USER root
# RUN usermod -G root developer
WORKDIR /home/developer
RUN mkdir /app


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


# installing firebase-tools and flutterfire_cli

RUN npm install --location=global firebase-tools
RUN flutter pub global activate flutterfire_cli
ENV PATH "$PATH:$HOME/.pub-cache/bin"

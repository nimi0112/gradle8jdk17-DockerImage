# Base image
FROM --platform=linux/amd64 openjdk:17-slim

# Environment variables
ENV ANDROID_SDK_TOOLS 9477386
ENV ANDROID_SDK_URL https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip
ENV ANDROID_BUILD_TOOLS_VERSION 33.0.0
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_VERSION 33
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/bin

# Change user to root for necessary permissions
USER root

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip curl bash git && \
    mkdir "$ANDROID_HOME" .android && \
    cd "$ANDROID_HOME" && \
    curl -o sdk.zip $ANDROID_SDK_URL && \
    unzip sdk.zip && \
    rm sdk.zip && \
    yes | sdkmanager --licenses --sdk_root=$ANDROID_HOME && \
    sdkmanager --update --sdk_root=$ANDROID_HOME && \
    sdkmanager --sdk_root=$ANDROID_HOME "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools" \
    "extras;android;m2repository" \
    "extras;google;m2repository" && \
# Install ktlint
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.42.1/ktlint && \
    chmod a+x ktlint && \
    mv ktlint /usr/local/bin/ && \
# Install Gradle 8.0
    curl -sLO https://services.gradle.org/distributions/gradle-8.0-bin.zip && \
    unzip -d /opt gradle-8.0-bin.zip && \
    ln -s /opt/gradle-8.0/bin/gradle /usr/bin/gradle && \
# Clean up
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean

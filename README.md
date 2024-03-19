# Dockerized Android Development Environment

## Introduction
This Dockerfile provides a pre-configured environment for Android development within a Docker container  with openjdk:17-slim base image. 
Gradle: 8
JDK: 17

I could not find an image with the configurations I needed, so I made one. 
Enjoy :tada: :tada:

Docker hub link: https://hub.docker.com/r/nimish0112/gradle8jdk17

## Here are the software components installed by the provided Dockerfile:

- openjdk:17-slim base image
- unzip
- curl
- bash
- git
- Android SDK tools
- Android Build Tools
- Android platform
- Android platform tools
- Android Support Repository
- Google Maven Repository
- ktlint (Kotlin code linter): 1.2.1
- Gradle 8.0

## The Dockerfile performs the following steps:

1. Sets up a base image using OpenJDK 17.
2. Defines environment variables related to Android SDK and tools.
3. Changes the user to root for necessary permissions.
4. Installs required packages such as unzip, curl, bash, and git.
5. Downloads and installs Android SDK tools, including SDK Manager.
6. Accepts the Android SDK licenses.
7. Updates the Android SDK and installs specific components like build tools, platforms, and platform tools.
8. Installs ktlint for Kotlin code linting v1.2.1.
9. Installs Gradle 8.0 for building Android projects.
10. Cleans up unnecessary files and packages to reduce image size.

## Usage
1. **Pull the Docker image:**
   ```bash
   docker pull nimish0112/gradle8jdk17
   ```
2. **Run a container:**
   ```bash
   docker run -it --rm nimish0112/gradle8jdk17
    ```
### Environment Variables

- `ANDROID_SDK_TOOLS`: Version of Android SDK tools to install.
- `ANDROID_BUILD_TOOLS_VERSION`: Version of Android Build Tools to install.
- `ANDROID_HOME`: Path where Android SDK will be installed.
## Cleaning Up
```bash
docker image prune -a
```

## Contributing
Contributions are welcome! Open an issue or submit a pull request.

## License

[MIT License](LICENSE)

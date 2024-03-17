# Dockerized Android Development Environment

## Introduction
This Dockerfile provides a pre-configured environment for Android development within a Docker container  with 
Gradle: 8
JDK: 17

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

### Installed Packages

- unzip, curl, bash, git
- Android SDK tools, Build Tools, platform, platform tools
- Android Support Repository, Google Maven Repository

### Additional Tools

- ktlint: Kotlin code linter
- Gradle 8.0

## Cleaning Up

```bash
docker image prune -a
```

## Contributing
Contributions are welcome! Open an issue or submit a pull request.

## License

[MIT License](LICENSE)

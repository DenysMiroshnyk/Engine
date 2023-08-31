# Use an appropriate Windows base image
FROM mcr.microsoft.com/windows:20H2

# Switch to PowerShell shell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install chocolatey package manager
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install required tools
RUN choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'
RUN choco install -y conan --version 1.58.0
RUN choco install -y vulkan-sdk

# # Set the working directory inside the container
# WORKDIR C:\app

# # Create build directory
# RUN mkdir build

# # Set up the build environment
# WORKDIR C:\app\build

# # Run CMake to configure the project
# RUN cmake .. -G "Visual Studio 16 2019"

# # Build the project
# RUN msbuild /p:Configuration=Release /m /p:Platform=x64

# # Create bin directory and copy the built executable
# WORKDIR C:\app
# RUN mkdir bin

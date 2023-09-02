FROM debian:11

# Install essential tools and dependencies
RUN apt-get update && \
    apt-get install -y \
    clang \
    cmake \
    git \
    python3-pip

# Install Vulkan SDK
RUN apt-get install -y \
    vulkan-tools \
    libvulkan-dev

# Install Conan
RUN pip3 install conan==1.58.0

# Set the working directory
WORKDIR /workspace
from conans import ConanFile, CMake

class Engine(ConanFile):
    generators = "cmake"
    requires = [
        "glfw/3.3.7",
        "catch2/2.13.8",
        "docopt.cpp/0.6.2",
        "fmt/6.2.0",
        "spdlog/1.5.0",
        "vulkan-headers/1.3.250.0",
        "glm/cci.20230113"
    ]

    settings = "os", "compiler", "build_type", "arch"

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

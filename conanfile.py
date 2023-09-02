from conans import ConanFile, CMake

class MyProject(ConanFile):
    generators = "cmake"
    requires = [
        "glfw/3.3.7",
        "catch2/2.13.8",
        "docopt.cpp/0.6.2",
        "fmt/6.2.0",
        "spdlog/1.5.0",
        "vulkan-headers/1.3.211.0"
    ]

    imports = {
        "bin/*.dll": "bin",     # Copies all dll files from packages bin folder to my local "bin" folder
        "lib/*.dylib*": "bin"    # Copies all dylib files from packages lib folder to my local "bin" folder
    }

    settings = "os", "compiler", "build_type", "arch"

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
    
    def configure(self):
        self.conf["tools.system.package_manager:mode"] = "install"

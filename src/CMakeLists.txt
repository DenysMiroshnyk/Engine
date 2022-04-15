add_executable(Engine main.cpp)

target_link_libraries(
  Engine
  PRIVATE project_options
          project_warnings
          CONAN_PKG::glfw)
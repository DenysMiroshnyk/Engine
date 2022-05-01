add_executable(Engine main.cpp "pch.h")

option(ENABLE_PCH "Enable Precompiled Headers" ON)
if(ENABLE_PCH)
  target_precompile_headers(
    PRIVATE pch.h
    project_options
    )
endif()

target_link_libraries(
  Engine
  PRIVATE project_options
          project_warnings
          CONAN_PKG::glfw)
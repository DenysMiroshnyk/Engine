add_executable(Engine main.cpp "pch.h")

target_precompile_headers(
    Engine
    PRIVATE pch.h
)

target_link_libraries(
    Engine
    PRIVATE project_options
            project_warnings
            CONAN_PKG::glfw
)
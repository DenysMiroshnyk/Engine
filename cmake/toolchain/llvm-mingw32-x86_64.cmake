# Toolchain for mingw32 clang16 compiler. Architecture: x86_64

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_CROSSCOMPILING TRUE)
SET(CMAKE_C_COMPILER     "x86_64-w64-mingw32-clang")
SET(CMAKE_CXX_COMPILER   "x86_64-w64-mingw32-clang++")
SET(CMAKE_RC_COMPILER    "x86_64-w64-mingw32-windres")
SET(CMAKE_RANLIB         "x86_64-w64-mingw32-ranlib")

# List of DLLs to copy
set(DLLsToCopy
    "/usr/local/llvm-mingw-20230614-ucrt-ubuntu-20.04-x86_64/x86_64-w64-mingw32/bin/libc++.dll"
    "/usr/local/llvm-mingw-20230614-ucrt-ubuntu-20.04-x86_64/x86_64-w64-mingw32/bin/libunwind.dll"
)

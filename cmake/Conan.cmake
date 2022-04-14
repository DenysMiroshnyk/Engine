macro(run_conan)
  # Download automatically, you can also just copy the conan.cmake file
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake")
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  find_program(CONAN_CMD conan)
  if(CONAN_CMD)
    message(STATUS "Conan executable found! No need to install")
  else()
    # Check for conan in .venv
    set(VENV_DIR ${PROJECT_SOURCE_DIR}/.venv)
    find_program(CONAN_CMD conan
      PATHS ${VENV_DIR}/Scripts
    )
    if(NOT CONAN_CMD)
      message(STATUS "Conan executable not found!\n--- Installing Conan package manager")
      find_package(Python3 COMPONENTS Interpreter REQUIRED)
      find_program(PIPENV pipenv REQUIRED)
      file(MAKE_DIRECTORY ${VENV_DIR})
      execute_process(
        COMMAND ${PIPENV} install --dev
        WORKING_DIRECTORY
        ${CMAKE_CURRENT_SOURCE_DIR}
        RESULT_VARIABLE PIPENV_SUBMOD_RESULT
      )
      if(NOT PIPENV_SUBMOD_RESULT EQUAL "0")
        message(FATAL_ERROR "pipenv install -q -v --dev -e . failed with ${PIPENV_SUBMOD_RESULT}")
      else()
        set(CONAN_CMD ${VENV_DIR}/Scripts/conan.exe)
      endif()
    else()
      message(STATUS "Conan found in virtual env")
    endif()
  endif()
  
  conan_add_remote(
    CONAN_COMMAND CONAN_CMD
    NAME bincrafters
    URL https://api.bintray.com/conan/bincrafters/public-conan
  )
  conan_cmake_settings(settings)

  conan_cmake_install(
    CONAN_COMMAND ${CONAN_CMD}
    CONANFILE .
    OUTPUT_FOLDER ${PROJECT_SOURCE_DIR}/includes
    INSTALL_FOLDER ${PROJECT_SOURCE_DIR}/external
    BUILD missing
    SETTINGS ${settings}
  )

endmacro()

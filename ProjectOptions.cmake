include(cmake/SystemLink.cmake)
include(cmake/LibFuzzer.cmake)
include(CMakeDependentOption)
include(CheckCXXCompilerFlag)


include(CheckCXXSourceCompiles)


macro(cisc187_supports_sanitizers)
  if((CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" OR CMAKE_CXX_COMPILER_ID MATCHES ".*GNU.*") AND NOT WIN32)

    message(STATUS "Sanity checking UndefinedBehaviorSanitizer, it should be supported on this platform")
    set(TEST_PROGRAM "int main() { return 0; }")

    # Check if UndefinedBehaviorSanitizer works at link time
    set(CMAKE_REQUIRED_FLAGS "-fsanitize=undefined")
    set(CMAKE_REQUIRED_LINK_OPTIONS "-fsanitize=undefined")
    check_cxx_source_compiles("${TEST_PROGRAM}" HAS_UBSAN_LINK_SUPPORT)

    if(HAS_UBSAN_LINK_SUPPORT)
      message(STATUS "UndefinedBehaviorSanitizer is supported at both compile and link time.")
      set(SUPPORTS_UBSAN ON)
    else()
      message(WARNING "UndefinedBehaviorSanitizer is NOT supported at link time.")
      set(SUPPORTS_UBSAN OFF)
    endif()
  else()
    set(SUPPORTS_UBSAN OFF)
  endif()

  if((CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" OR CMAKE_CXX_COMPILER_ID MATCHES ".*GNU.*") AND WIN32)
    set(SUPPORTS_ASAN OFF)
  else()
    if (NOT WIN32)
      message(STATUS "Sanity checking AddressSanitizer, it should be supported on this platform")
      set(TEST_PROGRAM "int main() { return 0; }")

      # Check if AddressSanitizer works at link time
      set(CMAKE_REQUIRED_FLAGS "-fsanitize=address")
      set(CMAKE_REQUIRED_LINK_OPTIONS "-fsanitize=address")
      check_cxx_source_compiles("${TEST_PROGRAM}" HAS_ASAN_LINK_SUPPORT)

      if(HAS_ASAN_LINK_SUPPORT)
        message(STATUS "AddressSanitizer is supported at both compile and link time.")
        set(SUPPORTS_ASAN ON)
      else()
        message(WARNING "AddressSanitizer is NOT supported at link time.")
        set(SUPPORTS_ASAN OFF)
      endif()
    else()
      set(SUPPORTS_ASAN ON)
    endif()
  endif()
endmacro()

macro(cisc187_setup_options)
  option(cisc187_ENABLE_HARDENING "Enable hardening" ON)
  option(cisc187_ENABLE_COVERAGE "Enable coverage reporting" OFF)
  cmake_dependent_option(
    cisc187_ENABLE_GLOBAL_HARDENING
    "Attempt to push hardening options to built dependencies"
    ON
    cisc187_ENABLE_HARDENING
    OFF)

  cisc187_supports_sanitizers()

  if(NOT PROJECT_IS_TOP_LEVEL OR cisc187_PACKAGING_MAINTAINER_MODE)
    option(cisc187_ENABLE_IPO "Enable IPO/LTO" OFF)
    option(cisc187_WARNINGS_AS_ERRORS "Treat Warnings As Errors" OFF)
    option(cisc187_ENABLE_USER_LINKER "Enable user-selected linker" OFF)
    option(cisc187_ENABLE_SANITIZER_ADDRESS "Enable address sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_LEAK "Enable leak sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_UNDEFINED "Enable undefined sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_THREAD "Enable thread sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_MEMORY "Enable memory sanitizer" OFF)
    option(cisc187_ENABLE_UNITY_BUILD "Enable unity builds" OFF)
    option(cisc187_ENABLE_CLANG_TIDY "Enable clang-tidy" OFF)
    option(cisc187_ENABLE_CPPCHECK "Enable cpp-check analysis" OFF)
    option(cisc187_ENABLE_PCH "Enable precompiled headers" OFF)
    option(cisc187_ENABLE_CACHE "Enable ccache" OFF)
  else()
    option(cisc187_ENABLE_IPO "Enable IPO/LTO" ON)
    option(cisc187_WARNINGS_AS_ERRORS "Treat Warnings As Errors" ON)
    option(cisc187_ENABLE_USER_LINKER "Enable user-selected linker" OFF)
    option(cisc187_ENABLE_SANITIZER_ADDRESS "Enable address sanitizer" ${SUPPORTS_ASAN})
    option(cisc187_ENABLE_SANITIZER_LEAK "Enable leak sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_UNDEFINED "Enable undefined sanitizer" ${SUPPORTS_UBSAN})
    option(cisc187_ENABLE_SANITIZER_THREAD "Enable thread sanitizer" OFF)
    option(cisc187_ENABLE_SANITIZER_MEMORY "Enable memory sanitizer" OFF)
    option(cisc187_ENABLE_UNITY_BUILD "Enable unity builds" OFF)
    option(cisc187_ENABLE_CLANG_TIDY "Enable clang-tidy" ON)
    option(cisc187_ENABLE_CPPCHECK "Enable cpp-check analysis" ON)
    option(cisc187_ENABLE_PCH "Enable precompiled headers" OFF)
    option(cisc187_ENABLE_CACHE "Enable ccache" ON)
  endif()

  if(NOT PROJECT_IS_TOP_LEVEL)
    mark_as_advanced(
      cisc187_ENABLE_IPO
      cisc187_WARNINGS_AS_ERRORS
      cisc187_ENABLE_USER_LINKER
      cisc187_ENABLE_SANITIZER_ADDRESS
      cisc187_ENABLE_SANITIZER_LEAK
      cisc187_ENABLE_SANITIZER_UNDEFINED
      cisc187_ENABLE_SANITIZER_THREAD
      cisc187_ENABLE_SANITIZER_MEMORY
      cisc187_ENABLE_UNITY_BUILD
      cisc187_ENABLE_CLANG_TIDY
      cisc187_ENABLE_CPPCHECK
      cisc187_ENABLE_COVERAGE
      cisc187_ENABLE_PCH
      cisc187_ENABLE_CACHE)
  endif()

  cisc187_check_libfuzzer_support(LIBFUZZER_SUPPORTED)
  if(LIBFUZZER_SUPPORTED AND (cisc187_ENABLE_SANITIZER_ADDRESS OR cisc187_ENABLE_SANITIZER_THREAD OR cisc187_ENABLE_SANITIZER_UNDEFINED))
    set(DEFAULT_FUZZER ON)
  else()
    set(DEFAULT_FUZZER OFF)
  endif()

  option(cisc187_BUILD_FUZZ_TESTS "Enable fuzz testing executable" ${DEFAULT_FUZZER})

endmacro()

macro(cisc187_global_options)
  if(cisc187_ENABLE_IPO)
    include(cmake/InterproceduralOptimization.cmake)
    cisc187_enable_ipo()
  endif()

  cisc187_supports_sanitizers()

  if(cisc187_ENABLE_HARDENING AND cisc187_ENABLE_GLOBAL_HARDENING)
    include(cmake/Hardening.cmake)
    if(NOT SUPPORTS_UBSAN 
       OR cisc187_ENABLE_SANITIZER_UNDEFINED
       OR cisc187_ENABLE_SANITIZER_ADDRESS
       OR cisc187_ENABLE_SANITIZER_THREAD
       OR cisc187_ENABLE_SANITIZER_LEAK)
      set(ENABLE_UBSAN_MINIMAL_RUNTIME FALSE)
    else()
      set(ENABLE_UBSAN_MINIMAL_RUNTIME TRUE)
    endif()
    message("${cisc187_ENABLE_HARDENING} ${ENABLE_UBSAN_MINIMAL_RUNTIME} ${cisc187_ENABLE_SANITIZER_UNDEFINED}")
    cisc187_enable_hardening(cisc187_options ON ${ENABLE_UBSAN_MINIMAL_RUNTIME})
  endif()
endmacro()

macro(cisc187_local_options)
  if(PROJECT_IS_TOP_LEVEL)
    include(cmake/StandardProjectSettings.cmake)
  endif()

  add_library(cisc187_warnings INTERFACE)
  add_library(cisc187_options INTERFACE)

  include(cmake/CompilerWarnings.cmake)
  cisc187_set_project_warnings(
    cisc187_warnings
    ${cisc187_WARNINGS_AS_ERRORS}
    ""
    ""
    ""
    "")

  if(cisc187_ENABLE_USER_LINKER)
    include(cmake/Linker.cmake)
    cisc187_configure_linker(cisc187_options)
  endif()

  include(cmake/Sanitizers.cmake)
  cisc187_enable_sanitizers(
    cisc187_options
    ${cisc187_ENABLE_SANITIZER_ADDRESS}
    ${cisc187_ENABLE_SANITIZER_LEAK}
    ${cisc187_ENABLE_SANITIZER_UNDEFINED}
    ${cisc187_ENABLE_SANITIZER_THREAD}
    ${cisc187_ENABLE_SANITIZER_MEMORY})

  set_target_properties(cisc187_options PROPERTIES UNITY_BUILD ${cisc187_ENABLE_UNITY_BUILD})

  if(cisc187_ENABLE_PCH)
    target_precompile_headers(
      cisc187_options
      INTERFACE
      <vector>
      <string>
      <utility>)
  endif()

  if(cisc187_ENABLE_CACHE)
    include(cmake/Cache.cmake)
    cisc187_enable_cache()
  endif()

  include(cmake/StaticAnalyzers.cmake)
  if(cisc187_ENABLE_CLANG_TIDY)
    cisc187_enable_clang_tidy(cisc187_options ${cisc187_WARNINGS_AS_ERRORS})
  endif()

  if(cisc187_ENABLE_CPPCHECK)
    cisc187_enable_cppcheck(${cisc187_WARNINGS_AS_ERRORS} "" # override cppcheck options
    )
  endif()

  if(cisc187_ENABLE_COVERAGE)
    include(cmake/Tests.cmake)
    cisc187_enable_coverage(cisc187_options)
  endif()

  if(cisc187_WARNINGS_AS_ERRORS)
    check_cxx_compiler_flag("-Wl,--fatal-warnings" LINKER_FATAL_WARNINGS)
    if(LINKER_FATAL_WARNINGS)
      # This is not working consistently, so disabling for now
      # target_link_options(cisc187_options INTERFACE -Wl,--fatal-warnings)
    endif()
  endif()

  if(cisc187_ENABLE_HARDENING AND NOT cisc187_ENABLE_GLOBAL_HARDENING)
    include(cmake/Hardening.cmake)
    if(NOT SUPPORTS_UBSAN 
       OR cisc187_ENABLE_SANITIZER_UNDEFINED
       OR cisc187_ENABLE_SANITIZER_ADDRESS
       OR cisc187_ENABLE_SANITIZER_THREAD
       OR cisc187_ENABLE_SANITIZER_LEAK)
      set(ENABLE_UBSAN_MINIMAL_RUNTIME FALSE)
    else()
      set(ENABLE_UBSAN_MINIMAL_RUNTIME TRUE)
    endif()
    cisc187_enable_hardening(cisc187_options OFF ${ENABLE_UBSAN_MINIMAL_RUNTIME})
  endif()

endmacro()

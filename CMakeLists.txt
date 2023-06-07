cmake_minimum_required(VERSION 3.5)
project(RapidFuzzCrystalWrapper)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(rapidfuzz
  GIT_REPOSITORY https://github.com/maxbachmann/rapidfuzz-cpp.git
  GIT_TAG main)
FetchContent_MakeAvailable(rapidfuzz)

add_library(RapidFuzzCrystalWrapper STATIC src/rapidfuzz_wrap.cpp)
target_link_libraries(RapidFuzzCrystalWrapper PRIVATE rapidfuzz::rapidfuzz)

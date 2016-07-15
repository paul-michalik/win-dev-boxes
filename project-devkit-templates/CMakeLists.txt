cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project([project-name])

find_package(Boost 1.61 EXACT REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

set(SOURCES
    src/[project-name].cpp)
set(HEADERS
    [project-name].h)
add_library([project-name] SHARED ${SOURCES})

enable_testing()
find_package(Boost 1.61 EXACT COMPONENTS unit_test_framework REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

add_executable([project-name]_tests tests/[project-name]_tests.cpp)
target_link_libraries([project-name]_tests ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY})

add_test(NAME [project-name]_tests COMMAND [project-name]_tests)
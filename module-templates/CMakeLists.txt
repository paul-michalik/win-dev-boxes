cmake_minimum_required(VERSION 3.4 FATAL_ERROR) 
 
set(Sources 
    src/[module-name].cpp) 
set(Headers
    [module-name].h) 
add_library([module-name] ${Headers} ${Sources})  

add_executable([module-name]_tests tests/[module-name]_tests.cpp)

target_link_libraries([module-name]_tests [module-name]
    ${Boost_FILESYSTEM_LIBRARY}
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY})

add_test(NAME [module-name]_tests COMMAND $<TARGET_FILE:[module-name]_tests>)
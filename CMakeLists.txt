cmake_minimum_required(VERSION 3.19)
project(apdbctl C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Find hidapi library
find_package(PkgConfig REQUIRED)
pkg_check_modules(HIDAPI REQUIRED hidapi-hidraw)

# Add executable
add_executable(apdbctl
    src/main.c
)

# Link against hidapi
target_link_libraries(apdbctl ${HIDAPI_LIBRARIES})
target_include_directories(apdbctl PRIVATE ${HIDAPI_INCLUDE_DIRS})
target_compile_options(apdbctl PRIVATE ${HIDAPI_CFLAGS_OTHER})

# Installation
install(TARGETS apdbctl DESTINATION bin)

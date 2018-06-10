cmake_minimum_required(VERSION 3.0)

find_package(Qt5 REQUIRED COMPONENTS Gui Qml Test QuickTest)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

enable_testing()

add_subdirectory(src)
add_subdirectory(autotests)

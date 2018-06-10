

add_definitions(-DQUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
add_executable(KolorFillUtilsTest kolorfillutilstest.cpp)
target_link_libraries(KolorFillUtilsTest Qt5::Test Qt5::QuickTest Qt5::Qml)

add_test(KolorFillUtilsTest KolorFillUtilsTest)




add_definitions(-DQUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
add_executable(KolorFillUtilsTest kolorfillutilstest.cpp)
target_link_libraries(KolorFillUtilsTest Qt::Test Qt::QuickTest Qt::Qml)

add_test(NAME KolorFillUtilsTest COMMAND KolorFillUtilsTest)


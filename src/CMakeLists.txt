qt5_add_resources(kolorfill_SRCS resources.qrc)
add_executable(kolorfill main.cpp ${kolorfill_SRCS})
target_link_libraries(kolorfill Qt5::Qml Qt5::Gui)


add_executable(kolorfill main.cpp highscore.cpp resources.qrc)
target_link_libraries(kolorfill Qt5::Qml Qt5::Gui)

install(TARGETS kolorfill DESTINATION ${KDE_INSTALL_BINDIR})
install(FILES kolorfill.desktop DESTINATION ${KDE_INSTALL_APPDIR})

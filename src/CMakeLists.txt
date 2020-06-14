include(ECMPoQmTools)

ecm_create_qm_loader(kolorfill_QM_LOADER kolorfill_qt)

add_executable(kolorfill main.cpp highscore.cpp resources.qrc ${kolorfill_QM_LOADER})
target_link_libraries(kolorfill Qt5::Qml Qt5::Gui)

install(TARGETS kolorfill DESTINATION ${KDE_INSTALL_BINDIR})
install(FILES kolorfill.desktop DESTINATION ${KDE_INSTALL_APPDIR})

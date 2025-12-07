include(ECMPoQmTools)

ecm_create_qm_loader(kolorfill_QM_LOADER kolorfill_qt)

add_executable(kolorfill main.cpp highscore.cpp resources.qrc ${kolorfill_QM_LOADER})
target_link_libraries(kolorfill Qt::Qml Qt::Gui)

install(TARGETS kolorfill DESTINATION ${KDE_INSTALL_BINDIR})
install(FILES org.kde.kolorfill.desktop DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.kde.kolorfill.metainfo.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
install(FILES org.kde.kolorfill.svg DESTINATION ${KDE_INSTALL_FULL_ICONDIR}/hicolor/scalable/apps)

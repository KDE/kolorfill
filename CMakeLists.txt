cmake_minimum_required(VERSION 3.0)

project(kolorfill)

find_package(ECM REQUIRED)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

find_package(Qt${QT_MAJOR_VERSION} REQUIRED COMPONENTS Gui Qml Test QuickTest)

enable_testing()

add_subdirectory(src)
add_subdirectory(autotests)
# Subdirectories
ecm_install_po_files_as_qm(poqm)

install(FILES kolorfill.png DESTINATION ${KDE_INSTALL_FULL_ICONDIR}/hicolor/scalable/apps)

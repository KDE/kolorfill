cmake_minimum_required(VERSION 3.5)

project(kolorfill)

find_package(ECM 6.0.0 REQUIRED)
set(KDE_COMPILERSETTINGS_LEVEL "5.82.0")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

find_package(Qt6 REQUIRED COMPONENTS Gui Qml Test QuickTest)

enable_testing()

add_subdirectory(src)
add_subdirectory(autotests)
# Subdirectories
ecm_install_po_files_as_qm(poqm)

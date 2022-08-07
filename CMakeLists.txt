cmake_minimum_required(VERSION 3.0)

project(kolorfill)

find_package(Qt5 REQUIRED COMPONENTS Gui Qml Test QuickTest)

find_package(ECM REQUIRED)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

enable_testing()

add_subdirectory(src)
add_subdirectory(autotests)
# Subdirectories
if (IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/po")
    ecm_install_po_files_as_qm(po)
endif()

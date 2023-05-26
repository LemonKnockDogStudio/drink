cmake_minimum_required(VERSION 3.16)

project(DrinkDispenser VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appDrinkDispenser
    main.cpp
    systemcontroller.h
    systemcontroller.cpp
)
qt_add_qml_module(appDrinkDispenser
    URI DrinkDispenser
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(appDrinkDispenser PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDrinkDispenser PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)

# Resources:
set(qml_resource_files
    "Main.qml"
    "HotColdSelectionPage.qml"
    "DrinkTypePage.qml"
    "DrinkSizeSelectionPage.qml"
    "DispensingScreen.qml"
    "FinishScreen.qml"
    "images/coffee-beans.png"
    "images/coffee-cup.png"
    "images/cold.png"
    "images/drop.png"
    "images/hot.png"
    "images/previousCold.png"
    "images/previousHot.png"
    "images/resetCold.png"
    "images/resetHot.png"
    "images/snowflake.png"
    "images/soda.png"
    "images/softdrinks.png"
    "images/tea.png"
    "images/tickCold.png"
    "images/tickHot.png"
    "images/wifi.png"
)

qt6_add_resources(appDrinkDispenser "qml"
    PREFIX
        "/"
    FILES
        ${qml_resource_files}
)

install(TARGETS appDrinkDispenser
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

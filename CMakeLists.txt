cmake_minimum_required(VERSION 3.16)

project(Button VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Sql Network)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appButton
    main.cpp
    login.cpp
    login.h
    sqlMod.cpp
    sqlMod.h
    supabase.cpp
    supabase.h
)

qt_add_qml_module(appButton
    URI Button
    QML_FILES
        Main.qml
        Home.qml
        login.qml
    RESOURCES
        "socc1.jpg"
        "logo.png"
        "goalLink.db"
        "heart.png"
        "redheart.png"
)

set_target_properties(appButton PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appButton
    PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Sql
        Qt6::Network
)

include(GNUInstallDirs)

install(TARGETS appButton
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

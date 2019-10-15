# Generated from qtgraphicaleffects.pro.

cmake_minimum_required(VERSION 3.15.0)

project(QtGraphicalEffects # special case
    VERSION 6.0.0
    DESCRIPTION "Qt Graphical Effects" # special case
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
)

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Quick) # special case

if(NOT TARGET Qt::Quick)
    message(NOTICE "Skipping the build as the condition \"TARGET Qt::Quick\" is not met.")
    return()
endif()
if(NOT QT_FEATURE_opengl) # special case
    message(NOTICE "Skipping the build as the condition \"QT_FEATURE_opengl\" is not met.") # special case
    return()
endif()
qt_build_repo()

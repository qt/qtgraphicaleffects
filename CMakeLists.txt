# Generated from qtgraphicaleffects.pro.

cmake_minimum_required(VERSION 3.15.0)

include(.cmake.conf)
project(QtGraphicalEffects # special case
    VERSION "${QT_REPO_MODULE_VERSION}"
    DESCRIPTION "Qt Graphical Effects" # special case
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
)

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Core) # special case
find_package(Qt6 ${PROJECT_VERSION} QUIET CONFIG OPTIONAL_COMPONENTS Quick)

if(NOT TARGET Qt::Quick)
    message(NOTICE "Skipping the build as the condition \"TARGET Qt::Quick\" is not met.")
    return()
endif()
qt_build_repo()

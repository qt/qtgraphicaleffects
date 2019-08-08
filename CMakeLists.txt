cmake_minimum_required(VERSION 3.15.0)

project(QtGraphicalEffects
    VERSION 6.0.0
    DESCRIPTION "Qt Graphical Effects"
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
)

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Quick)
qt_build_repo()

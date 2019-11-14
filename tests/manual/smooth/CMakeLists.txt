# Generated from smooth.pro.

#####################################################################
## smooth Binary:
#####################################################################

qt_add_manual_test(smooth
    GUI
    SOURCES
        main.cpp
    DEFINES
        QT_DEPRECATED_WARNINGS
    PUBLIC_LIBRARIES
        Qt::Gui
        Qt::Quick
)

# Resources:
set(resources_resource_files
    "CellContainer.qml"
    "SourceImage.qml"
    "main.qml"
    "star.png"
)

qt_add_resource(smooth "resources"
    PREFIX
        "/"
    FILES
        ${resources_resource_files}
)


#### Keys ignored in scope 1:.:.:smooth.pro:<TRUE>:
# QML_DESIGNER_IMPORT_PATH = <EMPTY>
# QML_IMPORT_PATH = <EMPTY>

## Scopes:
#####################################################################

#### Keys ignored in scope 2:.:.:smooth.pro:QNX:
# target.path = "/tmp/$${TARGET}/bin"

#### Keys ignored in scope 4:.:.:smooth.pro:UNIX AND NOT ANDROID:
# target.path = "/opt/$${TARGET}/bin"

#### Keys ignored in scope 5:.:.:smooth.pro:NOT target.path_ISEMPTY:
# INSTALLS = "target"

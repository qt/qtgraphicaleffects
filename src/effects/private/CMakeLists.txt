# Generated from private.pro.

#####################################################################
## qtgraphicaleffectsprivate Plugin:
#####################################################################

qt_add_qml_module(qtgraphicaleffectsprivate
    URI "QtGraphicalEffects.private"
    VERSION "${CMAKE_PROJECT_VERSION}"
    CLASSNAME QtGraphicalEffectsPrivatePlugin
    SOURCES
        plugin.cpp
        qgfxsourceproxy.cpp qgfxsourceproxy_p.h
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::CorePrivate
        Qt::Gui
        Qt::GuiPrivate
        Qt::Qml
        Qt::QmlPrivate
        Qt::Quick
        Qt::QuickPrivate
)

#### Keys ignored in scope 1:.:.:private.pro:<TRUE>:
# CXX_MODULE = "qml"
# QML_FILES = "FastGlow.qml"
# QML_IMPORT_VERSION = "$$QT_VERSION"
# TARGETPATH = "QtGraphicalEffects/private"

## Scopes:
#####################################################################

set(qml_files
    "FastGlow.qml"
)
set_source_files_properties(FastGlow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)

qt6_target_qml_files(qtgraphicaleffectsprivate
    FILES
        ${qml_files}
)

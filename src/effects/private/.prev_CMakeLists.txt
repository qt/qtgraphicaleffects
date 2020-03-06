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
        qgfxshaderbuilder.cpp qgfxshaderbuilder_p.h
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
# QML_FILES = "DropShadowBase.qml" "FastGlow.qml" "FastInnerShadow.qml" "FastMaskedBlur.qml" "GaussianDirectionalBlur.qml" "GaussianGlow.qml" "GaussianInnerShadow.qml" "GaussianMaskedBlur.qml"
# QML_IMPORT_VERSION = "$$QT_VERSION"
# TARGETPATH = "QtGraphicalEffects/private"

## Scopes:
#####################################################################

set(qml_files
    "DropShadowBase.qml"
    "FastGlow.qml"
    "FastInnerShadow.qml"
    "FastMaskedBlur.qml"
    "GaussianDirectionalBlur.qml"
    "GaussianGlow.qml"
    "GaussianInnerShadow.qml"
    "GaussianMaskedBlur.qml"
)
set_source_files_properties(DropShadowBase.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(FastGlow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(FastInnerShadow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(FastMaskedBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(GaussianDirectionalBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(GaussianGlow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(GaussianInnerShadow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(GaussianMaskedBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)

qt6_target_qml_files(qtgraphicaleffectsprivate
    FILES
        ${qml_files}
)

# Generated from effects.pro.

#####################################################################
## qtgraphicaleffectsplugin Plugin:
#####################################################################

qt_internal_add_qml_module(qtgraphicaleffectsplugin
    URI "QtGraphicalEffects"
    VERSION "1.${CMAKE_PROJECT_VERSION_MINOR}"
    DESIGNER_SUPPORTED
    CLASSNAME QtGraphicalEffectsPlugin
    DEPENDENCIES
        QtGraphicalEffects/private/1.0
        QtQuick.Window/2.1
    SOURCES
        plugin.cpp
    PUBLIC_LIBRARIES
        Qt::Qml
        Qt::Quick
)

# Resources:
set(qtgraphicaleffectsshaders_resource_files
    "shaders_ng/brightnesscontrast.frag.qsb"
    "shaders_ng/colorize.frag.qsb"
    "shaders_ng/coloroverlay.frag.qsb"
    "shaders_ng/conicalgradient_mask.frag.qsb"
    "shaders_ng/conicalgradient_nomask.frag.qsb"
    "shaders_ng/desaturate.frag.qsb"
    "shaders_ng/displace.frag.qsb"
    "shaders_ng/fastblur.frag.qsb"
    "shaders_ng/fastblur_internal.frag.qsb"
    "shaders_ng/fastblur_internal.vert.qsb"
    "shaders_ng/fastglow.frag.qsb"
    "shaders_ng/gammaadjust.frag.qsb"
    "shaders_ng/huesaturation.frag.qsb"
    "shaders_ng/leveladjust.frag.qsb"
    "shaders_ng/lineargradient.vert.qsb"
    "shaders_ng/lineargradient_mask.frag.qsb"
    "shaders_ng/lineargradient_nomask.frag.qsb"
    "shaders_ng/opacitymask.frag.qsb"
    "shaders_ng/opacitymask_invert.frag.qsb"
    "shaders_ng/radialgradient.vert.qsb"
    "shaders_ng/radialgradient_mask.frag.qsb"
    "shaders_ng/radialgradient_nomask.frag.qsb"
    "shaders_ng/rectangularglow.frag.qsb"
    "shaders_ng/thresholdmask.frag.qsb"
)

qt_internal_add_resource(qtgraphicaleffectsplugin "qtgraphicaleffectsshaders"
    PREFIX
        "/qt-project.org/imports/QtGraphicalEffects"
    FILES
        ${qtgraphicaleffectsshaders_resource_files}
)


#### Keys ignored in scope 2:.:.:effects_plugin.pro:<TRUE>:
# CXX_MODULE = "qml"
# IMPORT_VERSION = "1.$$QT_MINOR_VERSION"
# QML_FILES = "BrightnessContrast.qml" "ColorOverlay.qml" "Colorize.qml" "ConicalGradient.qml" "Desaturate.qml" "Displace.qml" "DropShadow.qml" "FastBlur.qml" "GammaAdjust.qml" "Glow.qml" "HueSaturation.qml" "LevelAdjust.qml" "LinearGradient.qml" "OpacityMask.qml" "RadialGradient.qml" "RectangularGlow.qml" "ThresholdMask.qml"
# TARGETPATH = "QtGraphicalEffects"

set(qml_files
    "BrightnessContrast.qml"
    "ColorOverlay.qml"
    "Colorize.qml"
    "ConicalGradient.qml"
    "Desaturate.qml"
    "Displace.qml"
    "DropShadow.qml"
    "FastBlur.qml"
    "GammaAdjust.qml"
    "Glow.qml"
    "HueSaturation.qml"
    "LevelAdjust.qml"
    "LinearGradient.qml"
    "OpacityMask.qml"
    "RadialGradient.qml"
    "RectangularGlow.qml"
    "ThresholdMask.qml"
)
set_source_files_properties(BrightnessContrast.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(ColorOverlay.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(Colorize.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(ConicalGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(Desaturate.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(Displace.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(DropShadow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(FastBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(GammaAdjust.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(Glow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(HueSaturation.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(LevelAdjust.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(LinearGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(OpacityMask.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(RadialGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(RectangularGlow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)
set_source_files_properties(ThresholdMask.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
)

qt6_target_qml_files(qtgraphicaleffectsplugin
    FILES
        ${qml_files}
)
qt_internal_add_docs(qtgraphicaleffectsplugin
    doc/qtgraphicaleffects.qdocconf
)

add_subdirectory(private)

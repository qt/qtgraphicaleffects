# Generated from effects.pro.

#####################################################################
## qtgraphicaleffectsplugin Plugin:
#####################################################################

add_qml_module(qtgraphicaleffectsplugin
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
    "shaders/+glslcore/brightnesscontrast.frag"
    "shaders/+glslcore/colorize.frag"
    "shaders/+glslcore/coloroverlay.frag"
    "shaders/+glslcore/conicalgradient_mask.frag"
    "shaders/+glslcore/conicalgradient_nomask.frag"
    "shaders/+glslcore/desaturate.frag"
    "shaders/+glslcore/displace.frag"
    "shaders/+glslcore/fastblur.frag"
    "shaders/+glslcore/fastblur_internal.frag"
    "shaders/+glslcore/fastblur_internal.vert"
    "shaders/+glslcore/fastglow.frag"
    "shaders/+glslcore/fastinnershadow.frag"
    "shaders/+glslcore/fastinnershadow_level0.frag"
    "shaders/+glslcore/fastmaskedblur.frag"
    "shaders/+glslcore/gammaadjust.frag"
    "shaders/+glslcore/gaussianinnershadow.frag"
    "shaders/+glslcore/gaussianinnershadow_shadow.frag"
    "shaders/+glslcore/huesaturation.frag"
    "shaders/+glslcore/leveladjust.frag"
    "shaders/+glslcore/lineargradient.vert"
    "shaders/+glslcore/lineargradient_mask.frag"
    "shaders/+glslcore/lineargradient_nomask.frag"
    "shaders/+glslcore/opacitymask.frag"
    "shaders/+glslcore/opacitymask_invert.frag"
    "shaders/+glslcore/radialgradient.vert"
    "shaders/+glslcore/radialgradient_mask.frag"
    "shaders/+glslcore/radialgradient_nomask.frag"
    "shaders/+glslcore/rectangularglow.frag"
    "shaders/+glslcore/recursiveblur.frag"
    "shaders/+glslcore/recursiveblur.vert"
    "shaders/+glslcore/thresholdmask.frag"
    "shaders/brightnesscontrast.frag"
    "shaders/colorize.frag"
    "shaders/coloroverlay.frag"
    "shaders/conicalgradient_mask.frag"
    "shaders/conicalgradient_nomask.frag"
    "shaders/desaturate.frag"
    "shaders/displace.frag"
    "shaders/fastblur.frag"
    "shaders/fastblur_internal.frag"
    "shaders/fastblur_internal.vert"
    "shaders/fastglow.frag"
    "shaders/fastinnershadow.frag"
    "shaders/fastinnershadow_level0.frag"
    "shaders/fastmaskedblur.frag"
    "shaders/gammaadjust.frag"
    "shaders/gaussianinnershadow.frag"
    "shaders/gaussianinnershadow_shadow.frag"
    "shaders/huesaturation.frag"
    "shaders/leveladjust.frag"
    "shaders/lineargradient.vert"
    "shaders/lineargradient_mask.frag"
    "shaders/lineargradient_nomask.frag"
    "shaders/opacitymask.frag"
    "shaders/opacitymask_invert.frag"
    "shaders/radialgradient.vert"
    "shaders/radialgradient_mask.frag"
    "shaders/radialgradient_nomask.frag"
    "shaders/rectangularglow.frag"
    "shaders/recursiveblur.frag"
    "shaders/recursiveblur.vert"
    "shaders/thresholdmask.frag"
)

add_qt_resource(qtgraphicaleffectsplugin "qtgraphicaleffectsshaders"
    PREFIX
        "/qt-project.org/imports/QtGraphicalEffects"
    FILES
        ${qtgraphicaleffectsshaders_resource_files}
)


#### Keys ignored in scope 2:.:.:effects_plugin.pro:<TRUE>:
# CXX_MODULE = "qml"
# IMPORT_VERSION = "1.$$QT_MINOR_VERSION"
# QML_FILES = "Blend.qml" "BrightnessContrast.qml" "ColorOverlay.qml" "Colorize.qml" "ConicalGradient.qml" "Desaturate.qml" "DirectionalBlur.qml" "Displace.qml" "DropShadow.qml" "FastBlur.qml" "GammaAdjust.qml" "GaussianBlur.qml" "Glow.qml" "HueSaturation.qml" "InnerShadow.qml" "LevelAdjust.qml" "LinearGradient.qml" "MaskedBlur.qml" "OpacityMask.qml" "RadialBlur.qml" "RadialGradient.qml" "RectangularGlow.qml" "RecursiveBlur.qml" "ThresholdMask.qml" "ZoomBlur.qml"
# TARGETPATH = "QtGraphicalEffects"
# _LOADED = "qml_plugin"

set(qml_files
    "Blend.qml"
    "BrightnessContrast.qml"
    "ColorOverlay.qml"
    "Colorize.qml"
    "ConicalGradient.qml"
    "Desaturate.qml"
    "DirectionalBlur.qml"
    "Displace.qml"
    "DropShadow.qml"
    "FastBlur.qml"
    "GammaAdjust.qml"
    "GaussianBlur.qml"
    "Glow.qml"
    "HueSaturation.qml"
    "InnerShadow.qml"
    "LevelAdjust.qml"
    "LinearGradient.qml"
    "MaskedBlur.qml"
    "OpacityMask.qml"
    "RadialBlur.qml"
    "RadialGradient.qml"
    "RectangularGlow.qml"
    "RecursiveBlur.qml"
    "ThresholdMask.qml"
    "ZoomBlur.qml"
)
set_source_files_properties(Blend.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(BrightnessContrast.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(ColorOverlay.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(Colorize.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(ConicalGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(Desaturate.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(DirectionalBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(Displace.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(DropShadow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(FastBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(GammaAdjust.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(GaussianBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(Glow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(HueSaturation.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(InnerShadow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(LevelAdjust.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(LinearGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(MaskedBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(OpacityMask.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(RadialBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(RadialGradient.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(RectangularGlow.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(RecursiveBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(ThresholdMask.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)
set_source_files_properties(ZoomBlur.qml PROPERTIES
    QT_QML_SOURCE_VERSION "1.0"
    QT_QML_SOURCE_INSTALL TRUE
)

qt6_target_qml_files(qtgraphicaleffectsplugin
    FILES
        ${qml_files}
)
add_qt_docs(qtgraphicaleffectsplugin
    doc/qtgraphicaleffects.qdocconf
)

add_subdirectory(private)

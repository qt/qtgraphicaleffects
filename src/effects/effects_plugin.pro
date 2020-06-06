CXX_MODULE = qml
TARGET = qtgraphicaleffectsplugin
TARGETPATH = QtGraphicalEffects
QT += quick qml
IMPORT_VERSION = 1.$$QT_MINOR_VERSION
QML_FILES = \
    BrightnessContrast.qml \
    ColorOverlay.qml \
    Colorize.qml \
    ConicalGradient.qml \
    Desaturate.qml \
    Displace.qml \
    DropShadow.qml \
    FastBlur.qml \
    GammaAdjust.qml \
    Glow.qml \
    HueSaturation.qml \
    LevelAdjust.qml \
    LinearGradient.qml \
    OpacityMask.qml \
    RadialGradient.qml \
    RectangularGlow.qml \
    ThresholdMask.qml

# !static: CONFIG += qmlcache

RESOURCES += \
    qtgraphicaleffectsshaders.qrc

QMAKE_DOCS = $$PWD/doc/qtgraphicaleffects.qdocconf
SOURCES += plugin.cpp
load(qml_plugin)

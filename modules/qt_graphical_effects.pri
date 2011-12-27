QT.qtgraphicaleffects.VERSION = 1.0.0
QT.qtgraphicaleffects.MAJOR_VERSION = 1
QT.qtgraphicaleffects.MINOR_VERSION = 0
QT.qtgraphicaleffects.PATCH_VERSION = 0

QT.qtgraphicaleffects.name = QtGraphicalEffects
QT.qtgraphicaleffects.bins = $$QT_MODULE_BIN_BASE
QT.qtgraphicaleffects.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtGraphicalEffects
QT.qtgraphicaleffects.private_includes = $$QT_MODULE_INCLUDE_BASE/QtGraphicalEffects/$$QT.qtgraphicaleffects.VERSION
QT.qtgraphicaleffects.sources = $$QT_MODULE_BASE/src
QT.qtgraphicaleffects.libs = $$QT_MODULE_LIB_BASE
QT.qtgraphicaleffects.plugins = $$QT_MODULE_PLUGIN_BASE
QT.qtgraphicaleffects.imports = $$QT_MODULE_IMPORT_BASE
QT.qtgraphicaleffects.depends = core declarative

QT_CONFIG += qtgraphicaleffects

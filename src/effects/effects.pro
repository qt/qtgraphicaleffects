TEMPLATE = subdirs

TARGETPATH = "QtGraphicalEffects"

plugin.files += $$PWD/qmldir
plugin.files += $$PWD/*.qml
plugin.files += $$PWD/private
plugin.path =  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH
!isEmpty(DESTDIR): plugin.path = $$DESTDIR

OTHER_FILES = *.qml \
              qmldir

INSTALLS += plugin

MODULE = graphical_effects
MODULE_PRI = $$section(PWD, /, 0, -3)/modules/qt_graphical_effects.pri
MODULE_BASE_DIR = $$section(PWD, /, 0, -3)
MODULE_BASE_OUTDIR = $$section(OUT_PWD, /, 0, -3)
MODULE_PROFILE_DIR = $$MODULE_BASE_DIR
MODULE_QMAKE_OUTDIR = $$MODULE_BASE_OUTDIR
load(qt_module_fwdpri)
CONFIG += qt_no_install_library
load(qt_installs)

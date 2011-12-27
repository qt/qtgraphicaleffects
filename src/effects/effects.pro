TEMPLATE = subdirs

TARGETPATH = "QtGraphicalEffects"

plugin.files += $$PWD/qmldir
plugin.files += $$PWD/*.qml
plugin.path =  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH
!isEmpty(DESTDIR): plugin.path = $$DESTDIR

OTHER_FILES = *.qml \
              qmldir

INSTALLS += plugin

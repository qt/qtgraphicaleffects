TEMPLATE = lib
TARGETPATH = "QtGraphicalEffects"
CONFIG += plugin

plugin.files += $$PWD/qmldir
plugin.files += $$PWD/*.qml
plugin.files += $$PWD/private
plugin.path =  $$[QT_INSTALL_IMPORTS]/$$TARGETPATH
!isEmpty(DESTDIR): plugin.path = $$DESTDIR

OTHER_FILES = *.qml \
              qmldir

INSTALLS += plugin

QMLDESTDIR = $$[QT_INSTALL_IMPORTS]/$$TARGETPATH
!isEmpty(DESTDIR): QMLDESTDIR = $$DESTDIR

# Copy public qml files to build tree during make
QML_PUBLIC_FILES = *.qml \
                   qmldir 
                  
copyqmlpublic.input = QML_PUBLIC_FILES
copyqmlpublic.output = $$QMLDESTDIR/${QMAKE_FILE_IN_BASE}${QMAKE_FILE_EXT}
copyqmlpublic.commands = $$QMAKE_COPY ${QMAKE_FILE_IN} ${QMAKE_FILE_OUT}
copyqmlpublic.CONFIG += no_link no_clean
copyqmlpublic.variable_out = PRE_TARGETDEPS
QMAKE_EXTRA_COMPILERS += copyqmlpublic

# Copy private qml files to build tree during make
QML_PRIVATE_FILES = private/*.qml
copyqmlprivate.input = QML_PRIVATE_FILES
copyqmlprivate.output = $$QMLDESTDIR/private/${QMAKE_FILE_IN_BASE}${QMAKE_FILE_EXT}
copyqmlprivate.commands = $$QMAKE_COPY ${QMAKE_FILE_IN} ${QMAKE_FILE_OUT}
copyqmlprivate.CONFIG += no_link no_clean
copyqmlprivate.variable_out = PRE_TARGETDEPS
QMAKE_EXTRA_COMPILERS += copyqmlprivate


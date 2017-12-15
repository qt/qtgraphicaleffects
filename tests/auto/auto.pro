
CONFIG += testcase

QT += qml testlib quick

TARGET = tst_qtgraphicaleffects

SOURCES += tst_qtgraphicaleffects.cpp

# QTBUG-65211
boot2qt: {
    DEFINES += SKIP_INNERSHADOW_TEST
}

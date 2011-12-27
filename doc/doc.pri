OTHER_FILES += $$PWD/qtgraphicaleffects.qdocconf

docs_target.target = docs
docs_target.commands = qdoc3 $$PWD/qtgraphicaleffects.qdocconf

QMAKE_EXTRA_TARGETS = docs_target
QMAKE_CLEAN += "-r $$PWD/html"


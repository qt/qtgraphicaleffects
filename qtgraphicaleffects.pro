TEMPLATE = subdirs

module_qtgraphicaleffects_src.subdir = src
module_qtgraphicaleffects_src.target = module-qtgraphicaleffects-src

module_qtgraphicaleffects_tests.subdir = tests
module_qtgraphicaleffects_tests.target = module-qtgraphicaleffects-tests
module_qtgraphicaleffects_tests.depends = module_qtgraphicaleffects_src
module_qtgraphicaleffects_tests.CONFIG = no_default_install
!contains(QT_BUILD_PARTS,tests):module_qtgraphicaleffects_tests.CONFIG += no_default_target

SUBDIRS += module_qtgraphicaleffects_src \
           module_qtgraphicaleffects_tests

include(doc/doc.pri)

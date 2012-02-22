%modules = ( # path to module name map
    "QtGraphicalEffects" => "$basedir/src/effects",
);
%moduleheaders = ( # restrict the module headers to those found in relative path
);
%classnames = (
);
%mastercontent = (
);
%modulepris = (
    "QtGraphicalEffects" => "$basedir/modules/qt_graphical_effects.pri",
);
# Module dependencies.
# Every module that is required to build this module should have one entry.
# Each of the module version specifiers can take one of the following values:
#   - A specific Git revision.
#   - any git symbolic ref resolvable from the module's repository (e.g. "refs/heads/master" to track master branch)
#
%dependencies = (
        "qtbase" => "refs/heads/api_changes",
        "qtdeclarative" => "refs/heads/master",
        "qtjsbackend" => "refs/heads/master",
        "qtsvg" => "refs/heads/master",
        "qtxmlpatterns" => "refs/heads/master",
);

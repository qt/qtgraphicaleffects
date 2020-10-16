requires(qtHaveModule(quick))

qtHaveModule(quick) {
    QT_FOR_CONFIG += quick-private
    requires(qtConfig(quick-shadereffect))
}

load(qt_parts)

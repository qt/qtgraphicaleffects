/****************************************************************************
**
** Copyright (C) 2016 Jolla Ltd, author: <gunnar.sletta@jollamobile.com>
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Graphical Effects module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
****************************************************************************/

#ifndef QGFXSHADERBUILDER_P_H
#define QGFXSHADERBUILDER_P_H

#include <QtCore/QObject>
#include <QtCore/QVariantMap>

#include <QtQml/QJSValue>

QT_BEGIN_NAMESPACE

class QGfxShaderBuilder : public QObject
{
    Q_OBJECT

public:
    QGfxShaderBuilder();

    Q_INVOKABLE QVariantMap gaussianBlur(const QJSValue &parameters);

private:
    int m_maxBlurSamples = 0;
    bool m_coreProfile;
};

QT_END_NAMESPACE

#endif // QGFXSHADERBUILDER_P_H

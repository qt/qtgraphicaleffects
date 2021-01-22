/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Graphical Effects module.
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
****************************************************************************/

#ifndef ITEMCAPTURER_H
#define ITEMCAPTURER_H

#include <QtQuick>

class ItemCapturer : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(ItemCapturer)
    
public:
    ItemCapturer(QQuickItem *parent = 0);
    ~ItemCapturer();

    Q_INVOKABLE void grabItem(QQuickItem *item, QString filename);
    Q_INVOKABLE void document(QString s);

signals:
     void imageSaved();

};

QML_DECLARE_TYPE(ItemCapturer)

#endif // ITEMCAPTURER_H


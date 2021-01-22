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

#include "pngdumper.h"

#include <QtQml/qqml.h>
#include <QtQuick/QQuickWindow>

ItemCapturer::ItemCapturer(QQuickItem *parent):
    QQuickItem(parent)
{
}

ItemCapturer::~ItemCapturer()
{
}

void ItemCapturer::grabItem(QQuickItem *item, QString filename)
{
    QQuickWindow *w = window();
    QImage img = w->grabWindow();
    while (img.width() * img.height() == 0)
        img = w->grabWindow();
    QQuickItem *rootItem = w->contentItem();
    QRectF rectf = rootItem->mapRectFromItem(item, QRectF(0, 0, item->width(), item->height()));
    QDir pwd = QDir().dirName();
    pwd.mkdir("output");
    img = img.copy(rectf.toRect());
    img.save("output/" + filename);
    emit imageSaved();
}

void ItemCapturer::document(QString s)
{
    printf(s.toLatin1().data());
}

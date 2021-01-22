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

#include "pngdumper_plugin.h"
#include "pngdumper.h"

#include <QtQml/qqml.h>

void ItemcapturerPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<ItemCapturer>(uri, 1, 0, "ItemCapturer");

    // Auto-increment the import to stay in sync with ALL future QtQuick minor versions from 5.12 onward
    qmlRegisterModule(uri, 1, QT_VERSION_MINOR);
}


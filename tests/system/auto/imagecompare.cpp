/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Graphical Effects module.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "imagecompare.h"

ImageCompare::ImageCompare(QObject *parent) : QObject(parent){
}

bool ImageCompare::CompareImages(QImage actual, QImage expected){

    bool result = true;
    bool compareAlpha, compareRed, compareGreen, compareBlue;
    const int tolerance = 1;

    for(int y = 0; y < 300; y++){
        for(int x = 0; x < 300; x++){

            // Gets the color of the pixel in the given position.
            QRgb pixelActual = actual.pixel(x,y);
            QRgb pixelExpected = expected.pixel(x,y);

            // Compares separately the alpha, red, green and blue components of an ARGB value within the specified tolerance.
            compareAlpha = (abs(qAlpha(pixelActual) - qAlpha(pixelExpected)) <= tolerance);
            compareRed = (abs(qRed(pixelActual) - qRed(pixelExpected)) <= tolerance);
            compareGreen = (abs(qGreen(pixelActual) - qGreen(pixelExpected)) <= tolerance);
            compareBlue = (abs(qBlue(pixelActual) - qBlue(pixelExpected)) <= tolerance);

            result &= (compareAlpha && compareRed && compareGreen && compareBlue);
        }
    }
    return result;
}

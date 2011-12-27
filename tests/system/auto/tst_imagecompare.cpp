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

#include <QtCore/QString>
#include <QtCore/QDir>
#include <QtCore/QProcess>
#include <QStringList>
#include <QtGui/QImage>
#include <QDebug>
#include "imagecompare.h"
#include "tst_imagecompare.h"

QDir expectedDir("../../../doc/src/images");
QDir actualDir("./output");

void tst_imagecompare::initTestCase(){
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString qtDir = env.value("QTDIR");
    QStringList dumperpath;
    dumperpath << "../../../tools/pngdumper/pngdumper.qml";

    // Verifies that QTDIR environment variable is set
    QCOMPARE(qtDir == "", false);

    QProcess *myProcess = new QProcess();
    myProcess->start(qtDir + "/bin/qmlscene", dumperpath);
    myProcess->waitForFinished(300000);

    // Verifies does the output folder exist
    QCOMPARE(actualDir.exists(), true);

    // Verifies that the output folder includes dumped png images
    QStringList filters;
    filters << "*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();
    QCOMPARE(list.size() == 0, false);
}

void tst_imagecompare::blend_varMode(){
    QStringList filters;
    filters << "blend_mode*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::brightnessContrast_varBrightness(){
    QStringList filters;
    filters << "brightnesscontrast_brightness*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::brightnessContrast_varContrast(){
    QStringList filters;
    filters << "brightnesscontrast_contrast*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::colorize_varHue(){
    QStringList filters;
    filters << "colorize_hue*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::colorize_varSaturation(){
    QStringList filters;
    filters << "colorize_saturation*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;'
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::colorize_varLightness(){
    QStringList filters;
    filters << "colorize_lightness*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::colorOverlay_varColor(){
    QStringList filters;
    filters << "coloroverlay_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::conicalGradient_varAngle(){
    QStringList filters;
    filters << "conicalgradient_angle*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::conicalGradient_varHorizontalOffset(){
    QStringList filters;
    filters << "conicalgradient_horizontaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::conicalGradient_varVerticalOffset(){
    QStringList filters;
    filters << "conicalgradient_verticaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::conicalGradient_varGradient(){
    QStringList filters;
    filters << "conicalgradient_gradient*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::conicalGradient_varMaskSource(){
    QStringList filters;
    filters << "conicalgradient_masksource*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::desaturate_varDesaturation(){
    QStringList filters;
    filters << "desaturate_desaturation*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::displace_varDisplacement(){
    QStringList filters;
    filters << "displace_displacement*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::dropShadow_varRadius(){
    QStringList filters;
    filters << "dropshadow_radius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::dropShadow_varColor(){
    QStringList filters;
    filters << "dropshadow_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::dropShadow_varHorizontalOffset(){
    QStringList filters;
    filters << "dropshadow_horizontaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::dropShadow_varVerticalOffset(){
    QStringList filters;
    filters << "dropshadow_verticaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::dropShadow_varSpread(){
    QStringList filters;
    filters << "dropshadow_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastDropShadow_varColor(){
    QStringList filters;
    filters << "fastdropshadow_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}


void tst_imagecompare::fastDropShadow_varHorizontalOffset(){
    QStringList filters;
    filters << "fastdropshadow_horizontaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastDropShadow_varVerticalOffset(){
    QStringList filters;
    filters << "fastdropshadow_verticaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastDropShadow_varSpread(){
    QStringList filters;
    filters << "fastdropshadow_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::glow_varRadius(){
    QStringList filters;
    filters << "glow_radius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::glow_varColor(){
    QStringList filters;
    filters << "glow_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::glow_varSpread(){
    QStringList filters;
    filters << "glow_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastGlow_varBlur(){
    QStringList filters;
    filters << "fastglow_blur*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastGlow_varColor(){
    QStringList filters;
    filters << "fastglow_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastGlow_varSpread(){
    QStringList filters;
    filters << "fastglow_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastBlur_varBlur(){
    QStringList filters;
    filters << "fastblur_blur*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::fastBlur_varTransparentBorder(){
    QStringList filters;
    filters << "fastblur_transparentborder*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::gammaAdjust_varGamma(){
    QStringList filters;
    filters << "gammaadjust_gamma*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::gaussianBlur_varRadius(){
    QStringList filters;
    filters << "gaussianblur_radius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::gaussianBlur_varDeviation(){
    QStringList filters;
    filters << "gaussianblur_deviation*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::gaussianBlur_varTransparentBorder(){
    QStringList filters;
    filters << "gaussianblur_transparentborder*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::hueSaturation_varHue(){
    QStringList filters;
    filters << "huesaturation_hue*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::hueSaturation_varSaturation(){
    QStringList filters;
    filters << "huesaturation_saturation*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::hueSaturation_varLightness(){
    QStringList filters;
    filters << "huesaturation_lightness*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::linearGradient_varGradient(){
    QStringList filters;
    filters << "lineargradient_gradient*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::linearGradient_varStart(){
    QStringList filters;
    filters << "lineargradient_start*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::linearGradient_varEnd(){
    QStringList filters;
    filters << "lineargradient_end*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::linearGradient_varMaskSource(){
    QStringList filters;
    filters << "lineargradient_masksource*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::opacityMask_varMaskSource(){
    QStringList filters;
    filters << "opacitymask_masksource*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varHorizontalOffset(){
    QStringList filters;
    filters << "radialgradient_horizontaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varVerticalOffset(){
    QStringList filters;
    filters << "radialgradient_verticaloffset*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varHorizontalRadius(){
    QStringList filters;
    filters << "radialgradient_horizontalradius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varVerticalRadius(){
    QStringList filters;
    filters << "radialgradient_verticalradius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varGradient(){
    QStringList filters;
    filters << "radialgradient_gradient*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varAngle(){
    QStringList filters;
    filters << "radialgradient_angle*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::radialGradient_varMaskSource(){
    QStringList filters;
    filters << "radialgradient_masksource*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::rectangularGlow_varGlowRadius(){
    QStringList filters;
    filters << "rectangularglow_glowradius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::rectangularGlow_varSpread(){
    QStringList filters;
    filters << "rectangularglow_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::rectangularGlow_varColor(){
    QStringList filters;
    filters << "rectangularglow_color*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::rectangularGlow_varCornerRadius(){
    QStringList filters;
    filters << "rectangularglow_cornerradius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::recursiveBlur_varLoops(){
    QStringList filters;
    filters << "recursiveblur_loops*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::recursiveBlur_varRadius(){
    QStringList filters;
    filters << "recursiveblur_radius*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::recursiveBlur_varTransparentBorder(){
    QStringList filters;
    filters << "recursiveblur_transparentborder*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::thresholdMask_varSpread(){
    QStringList filters;
    filters << "thresholdmask_spread*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

void tst_imagecompare::thresholdMask_varThreshold(){
    QStringList filters;
    filters << "thresholdmask_threshold*.png";
    actualDir.setNameFilters(filters);
    QStringList list = actualDir.entryList();

    for (int i = 0; i < list.size(); ++i){
        QString filename = list.at(i).toLocal8Bit().constData();
        //qDebug() << "Testing shader image " + filename;
        QString actualFile = actualDir.absolutePath() + "/" + filename;
        QString expectedFile = expectedDir.absolutePath() + "/" + filename;

        QImage actual(actualFile);
        QImage expected(expectedFile);
        ImageCompare compare;
        QCOMPARE(compare.CompareImages(actual, expected), true);
    }
}

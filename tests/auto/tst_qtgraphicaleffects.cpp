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

#include <qtest.h>
#include <QtDeclarative>

class tst_qtgraphicaleffects : public QObject
{
    Q_OBJECT

private slots:
    void initTestCase();

    void blend();
    void brightnessContrast();
    void colorize();
    void colorOverlay();
    void conicalGradient();
    void desaturate();
    void directionalBlur();
    void displace();
    void dropShadow();
    void fastBlur();
    void gammaAdjust();
    void gaussianBlur();
    void glow();
    void hueSaturation();
    void innerShadow();
    void levelAdjust();
    void linearGradient();
    void maskedBlur();
    void opacityMask();
    void radialBlur();
    void radialGradient();
    void recursiveBlur();
    void rectangularGlow();
    void thresholdMask();
    void zoomBlur();

private: QDeclarativeEngine engine;
};

void tst_qtgraphicaleffects::initTestCase()
{
    engine.addImportPath("../../src");
}


void tst_qtgraphicaleffects::brightnessContrast()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "BrightnessContrast {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("brightness").toDouble(), 0.0);
    QCOMPARE(obj->property("contrast").toDouble(), 0.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::colorize()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "Colorize {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("hue").toDouble(), 0.0);
    QCOMPARE(obj->property("saturation").toDouble(), 1.0);
    QCOMPARE(obj->property("lightness").toDouble(), 0.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::fastBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "FastBlur {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::desaturate()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "Desaturate {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("desaturation").toDouble(), 0.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::hueSaturation()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "HueSaturation {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("hue").toDouble(), 0.0);
    QCOMPARE(obj->property("saturation").toDouble(), 0.0);
    QCOMPARE(obj->property("lightness").toDouble(), 0.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::opacityMask()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "OpacityMask {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "maskSource: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("maskSource").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::radialGradient()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "RadialGradient {"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("gradient").toInt(), 0);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("horizontalRadius").toDouble(), 50.0);
    QCOMPARE(obj->property("verticalRadius").toDouble(), 50.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("angle").toDouble(), 0.0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::linearGradient()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "LinearGradient {"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("gradient").toInt(), 0);
    QCOMPARE(obj->property("start").toPointF(), QPointF(0.0, 0.0));
    QCOMPARE(obj->property("end").toPointF(), QPointF(0.0, 50.0));
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::rectangularGlow()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "RectangularGlow {"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("spread").toDouble(), 0.0);
    QCOMPARE(obj->property("glowRadius").toDouble(), 0.0);
    QCOMPARE(obj->property("color").toString(), QString("#ffffff"));
    QCOMPARE(obj->property("cornerRadius").toDouble(), 0.0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::conicalGradient()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "ConicalGradient {"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("angle").toDouble(), 0.0);
    QCOMPARE(obj->property("gradient").toInt(), 0);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::colorOverlay()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "ColorOverlay {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("color").toString(), QString("#000000"));

    delete obj;
}

void tst_qtgraphicaleffects::gaussianBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "GaussianBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("samples").toInt(), 0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);

    double res = obj->property("deviation").toDouble();
    QVERIFY(res < 0.3000 + 0.0001);
    QVERIFY(res > 0.3000 - 0.0001);

    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::dropShadow()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "DropShadow {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("samples").toInt(), 0);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("color").toString(), QString("#000000"));
    QCOMPARE(obj->property("spread").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("fast").toBool(), false);

    delete obj;
}


void tst_qtgraphicaleffects::innerShadow()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "InnerShadow {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("samples").toInt(), 0);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("color").toString(), QString("#000000"));
    QCOMPARE(obj->property("spread").toDouble(), 0.0);
    QCOMPARE(obj->property("fast").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::gammaAdjust()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "GammaAdjust {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    //qDebug() << component.errorString();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("gamma").toDouble(), 1.0);
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::thresholdMask()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "ThresholdMask {"
            "width: 50; height: 50\n"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "maskSource: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("maskSource").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("threshold").toDouble(), 0.0);
    QCOMPARE(obj->property("spread").toDouble(), 0.0);

    delete obj;
}

void tst_qtgraphicaleffects::glow()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "Glow {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("samples").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("spread").toDouble(), 0.0);
    QCOMPARE(obj->property("color").toString(), QString("#ffffff"));
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("fast").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::blend()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "Blend {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "foregroundSource: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("foregroundSource").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("mode").toString(), QString("normal"));

    delete obj;
}

void tst_qtgraphicaleffects::displace()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "Displace {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "displacementSource: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("displacementSource").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("displacement").toDouble(), 0.0);

    delete obj;
}

void tst_qtgraphicaleffects::recursiveBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "RecursiveBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("loops").toInt(), 0);
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("progress").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::directionalBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "DirectionalBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("lenght").toInt(), 0);
    QCOMPARE(obj->property("samples").toDouble(), 0.0);
    QCOMPARE(obj->property("angle").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::radialBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "RadialBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("samples").toDouble(), 0.0);
    QCOMPARE(obj->property("angle").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);

    delete obj;
}

void tst_qtgraphicaleffects::zoomBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "ZoomBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("lenght").toInt(), 0);
    QCOMPARE(obj->property("samples").toDouble(), 0.0);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("horizontalOffset").toDouble(), 0.0);
    QCOMPARE(obj->property("verticalOffset").toDouble(), 0.0);

    delete obj;
}

void tst_qtgraphicaleffects::levelAdjust()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "LevelAdjust {"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("minimumInput").toString(), QString("#000000"));
    QCOMPARE(obj->property("maximumInput").toString(), QString("#ffffff"));
    QCOMPARE(obj->property("minimumOutput").toString(), QString("#000000"));
    QCOMPARE(obj->property("maximumOutput").toString(), QString("#ffffff"));
    QCOMPARE(obj->property("cached").toBool(), false);

    delete obj;
}

void tst_qtgraphicaleffects::maskedBlur()
{
    // Creation
    QString componentStr = "import QtQuick 2.0\n"
            "import QtGraphicalEffects 1.0\n"
            "MaskedBlur {"
            "source: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "maskSource: ShaderEffectSource {sourceItem: Rectangle {width: 100; height: 100}}"
            "width: 50; height: 50\n"
            "}";
    QDeclarativeComponent component(&engine);
    component.setData(componentStr.toLatin1(), QUrl::fromLocalFile(""));
    QObject *obj = component.create();
    QTest::qWait(100);
    QVERIFY(obj != 0);

    // Default values
    QCOMPARE(obj->property("source").toInt(), 0);
    QCOMPARE(obj->property("maskSource").toInt(), 0);
    QCOMPARE(obj->property("radius").toDouble(), 0.0);
    QCOMPARE(obj->property("samples").toInt(), 0);
    QCOMPARE(obj->property("cached").toBool(), false);
    QCOMPARE(obj->property("transparentBorder").toBool(), false);
    QCOMPARE(obj->property("fast").toBool(), false);

    delete obj;
}

QTEST_MAIN(tst_qtgraphicaleffects)

#include "tst_qtgraphicaleffects.moc"

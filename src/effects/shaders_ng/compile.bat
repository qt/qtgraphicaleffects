:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Copyright (C) 2020 The Qt Company Ltd.
:: Contact: https://www.qt.io/licensing/
::
:: This file is part of the QtQuick module of the Qt Toolkit.
::
:: $QT_BEGIN_LICENSE:LGPL$
:: Commercial License Usage
:: Licensees holding valid commercial Qt licenses may use this file in
:: accordance with the commercial license agreement provided with the
:: Software or, alternatively, in accordance with the terms contained in
:: a written agreement between you and The Qt Company. For licensing terms
:: and conditions see https://www.qt.io/terms-conditions. For further
:: information use the contact form at https://www.qt.io/contact-us.
::
:: GNU Lesser General Public License Usage
:: Alternatively, this file may be used under the terms of the GNU Lesser
:: General Public License version 3 as published by the Free Software
:: Foundation and appearing in the file LICENSE.LGPL3 included in the
:: packaging of this file. Please review the following information to
:: ensure the GNU Lesser General Public License version 3 requirements
:: will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
::
:: GNU General Public License Usage
:: Alternatively, this file may be used under the terms of the GNU
:: General Public License version 2.0 or (at your option) the GNU General
:: Public license version 3 or any later version approved by the KDE Free
:: Qt Foundation. The licenses are as published by the Free Software
:: Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
:: included in the packaging of this file. Please review the following
:: information to ensure the GNU General Public License requirements will
:: be met: https://www.gnu.org/licenses/gpl-2.0.html and
:: https://www.gnu.org/licenses/gpl-3.0.html.
::
:: $QT_END_LICENSE$
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: For HLSL we invoke fxc.exe (-c argument) and store the resulting intermediate format
:: instead of HLSL source, so this needs to be run on Windows from a developer command prompt.

qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o opacitymask.frag.qsb opacitymask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o opacitymask_invert.frag.qsb opacitymask_invert.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o fastblur.frag.qsb fastblur.frag
qsb -b --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o fastblur_internal.vert.qsb fastblur_internal.vert
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o fastblur_internal.frag.qsb fastblur_internal.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o fastglow.frag.qsb fastglow.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o colorize.frag.qsb colorize.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o brightnesscontrast.frag.qsb brightnesscontrast.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o coloroverlay.frag.qsb coloroverlay.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o desaturate.frag.qsb desaturate.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o displace.frag.qsb displace.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o gammaadjust.frag.qsb gammaadjust.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o huesaturation.frag.qsb huesaturation.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o rectangularglow.frag.qsb rectangularglow.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o thresholdmask.frag.qsb thresholdmask.frag
qsb -b --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o lineargradient.vert.qsb lineargradient.vert
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o lineargradient_nomask.frag.qsb lineargradient_nomask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o lineargradient_mask.frag.qsb lineargradient_mask.frag
qsb -b --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o radialgradient.vert.qsb radialgradient.vert
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o radialgradient_nomask.frag.qsb radialgradient_nomask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o radialgradient_mask.frag.qsb radialgradient_mask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o conicalgradient_nomask.frag.qsb conicalgradient_nomask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o conicalgradient_mask.frag.qsb conicalgradient_mask.frag
qsb --glsl "150,120,100 es" --hlsl 50 -c --msl 12 -o leveladjust.frag.qsb leveladjust.frag

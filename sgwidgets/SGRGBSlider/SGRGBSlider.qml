/*
Copyright 2014 ON Semiconductor.
All rights reserved. This software and/or documentation is licensed by ON Semiconductor under
limited terms and conditions. The terms and conditions pertaining to the software and/or documentation are available at
http://www.onsemi.com/site/pdf/ONSEMI_T&C.pdf (“ON Semiconductor Standard Terms and Conditions of Sale, Section 8 Software”).
Do not use this software and/or documentation unless you have carefully read and you agree to the limited terms and conditions.
By using this software and/or documentation, you agree to the limited terms and conditions.

GNU LESSER GENERAL PUBLIC LICENSE
Version 3, 29 June 2007
Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.
This version of the GNU Lesser General Public License incorporates
the terms and conditions of version 3 of the GNU General Public
License, supplemented by the additional permissions listed below.
0. Additional Definitions.
As used herein, "this License" refers to version 3 of the GNU Lesser
General Public License, and the "GNU GPL" refers to version 3 of the GNU
General Public License.
"The Library" refers to a covered work governed by this License,
other than an Application or a Combined Work as defined below.
An "Application" is any work that makes use of an interface provided
by the Library, but which is not otherwise based on the Library.
Defining a subclass of a class defined by the Library is deemed a mode
of using an interface provided by the Library.
A "Combined Work" is a work produced by combining or linking an
Application with the Library. The particular version of the Library
with which the Combined Work was made is also called the "Linked
Version".
The "Minimal Corresponding Source" for a Combined Work means the
Corresponding Source for the Combined Work, excluding any source code
for portions of the Combined Work that, considered in isolation, are
based on the Application, and not on the Linked Version.
The "Corresponding Application Code" for a Combined Work means the
object code and/or source code for the Application, including any data
and utility programs needed for reproducing the Combined Work from the
Application, but excluding the System Libraries of the Combined Work.
1. Exception to Section 3 of the GNU GPL.
You may convey a covered work under sections 3 and 4 of this License
without being bound by section 3 of the GNU GPL.
2. Conveying Modified Versions.
If you modify a copy of the Library, and, in your modifications, a
facility refers to a function or data to be supplied by an Application
that uses the facility (other than as an argument passed when the
facility is invoked), then you may convey a copy of the modified
version:
a) under this License, provided that you make a good faith effort to
ensure that, in the event an Application does not supply the
function or data, the facility still operates, and performs
whatever part of its purpose remains meaningful, or
b) under the GNU GPL, with none of the additional permissions of
this License applicable to that copy.
3. Object Code Incorporating Material from Library Header Files.
The object code form of an Application may incorporate material from
a header file that is part of the Library. You may convey such object
code under terms of your choice, provided that, if the incorporated
material is not limited to numerical parameters, data structure
layouts and accessors, or small macros, inline functions and templates
(ten or fewer lines in length), you do both of the following:
a) Give prominent notice with each copy of the object code that the
Library is used in it and that the Library and its use are
covered by this License.
b) Accompany the object code with a copy of the GNU GPL and this license
document.
4. Combined Works.
You may convey a Combined Work under terms of your choice that,
taken together, effectively do not restrict modification of the
portions of the Library contained in the Combined Work and reverse
engineering for debugging such modifications, if you also do each of
the following:
a) Give prominent notice with each copy of the Combined Work that
the Library is used in it and that the Library and its use are
covered by this License.
b) Accompany the Combined Work with a copy of the GNU GPL and this license
document.
c) For a Combined Work that displays copyright notices during
execution, include the copyright notice for the Library among
these notices, as well as a reference directing the user to the
copies of the GNU GPL and this license document.
d) Do one of the following:
0) Convey the Minimal Corresponding Source under the terms of this
License, and the Corresponding Application Code in a form
suitable for, and under terms that permit, the user to
recombine or relink the Application with a modified version of
the Linked Version to produce a modified Combined Work, in the
manner specified by section 6 of the GNU GPL for conveying
Corresponding Source.
1) Use a suitable shared library mechanism for linking with the
Library. A suitable mechanism is one that (a) uses at run time
a copy of the Library already present on the user's computer
system, and (b) will operate properly with a modified version
of the Library that is interface-compatible with the Linked
Version.
e) Provide Installation Information, but only if you would otherwise
be required to provide such information under section 6 of the
GNU GPL, and only to the extent that such information is
necessary to install and execute a modified version of the
Combined Work produced by recombining or relinking the
Application with a modified version of the Linked Version. (If
you use option 4d0, the Installation Information must accompany
the Minimal Corresponding Source and Corresponding Application
Code. If you use option 4d1, you must provide the Installation
Information in the manner specified by section 6 of the GNU GPL
for conveying Corresponding Source.)
5. Combined Libraries.
You may place library facilities that are a work based on the
Library side by side in a single library together with other library
facilities that are not Applications and are not covered by this
License, and convey such a combined library under terms of your
choice, if you do both of the following:
a) Accompany the combined library with a copy of the same work based
on the Library, uncombined with any other library facilities,
conveyed under the terms of this License.
b) Give prominent notice with the combined library that part of it
is a work based on the Library, and explaining where to find the
accompanying uncombined form of the same work.
6. Revised Versions of the GNU Lesser General Public License.
The Free Software Foundation may publish revised and/or new versions
of the GNU Lesser General Public License from time to time. Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.
Each version is given a distinguishing version number. If the
Library as you received it specifies that a certain numbered version
of the GNU Lesser General Public License "or any later version"
applies to it, you have the option of following the terms and
conditions either of that published version or of any later version
published by the Free Software Foundation. If the Library as you
received it does not specify a version number of the GNU Lesser
General Public License, you may choose any version of the GNU Lesser
General Public License ever published by the Free Software Foundation.
If the Library as you received it specifies that a proxy can decide
whether future versions of the GNU Lesser General Public License shall
apply, that proxy's public statement of acceptance of any version is
permanent authorization for you to choose that version for the
Library.
*/

import QtQuick 2.9
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0

Item {
    id: root

    property alias value: rgbSlider.value
    property var rgbArray: hToRgb(value)
    property string color: "red"
    property int color_value: 0
    property string label: ""
    property bool labelLeft: true
    property color textColor : "black"
    property real sliderHeight: 28
    property alias overrideLabelWidth: labelText.width

    implicitHeight: labelLeft ? Math.max(labelText.height, sliderHeight) : labelText.height + sliderHeight + rgbSlider.anchors.topMargin
    implicitWidth: 450

    Text {
        id: labelText
        text: root.label
        width: contentWidth
        height: root.label === "" ? 0 : root.labelLeft ? rgbSlider.height : contentHeight
        topPadding: root.label === "" ? 0 : root.labelLeft ? (rgbSlider.height-contentHeight)/2 : 0
        bottomPadding: topPadding
        color: root.textColor
    }

    Slider {
        id: rgbSlider
        padding: 0
        value: 0
        height: root.sliderHeight
        anchors {
            left: root.labelLeft ? labelText.right : labelText.left
            top: root.labelLeft ? labelText.top : labelText.bottom
            leftMargin: root.label === "" ? 0 : root.labelLeft ? 10 : 0
            topMargin: root.label === "" ? 0 : root.labelLeft ? 0 : 5
            right: root.right
        }
        live: false

        background: Rectangle {
            y: 4
            x: 5
            width: rgbSlider.width-10
            height: rgbSlider.height-8
            radius: 5
            layer.enabled: true
            layer.effect: LinearGradient {
                start: Qt.point(0, 0)
                end: Qt.point(width, 0)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.hsva(0.0,1,1,1) }
                    GradientStop { position: 0.3333; color: Qt.hsva(0.0,1,0,1) }
                    GradientStop { position: 0.3334; color: Qt.hsva(0.3333,1,1,1) }
                    GradientStop { position: 0.6667; color: Qt.hsva(0.3333,1,0,1) }
                    GradientStop { position: 0.6668; color: Qt.hsva(0.6667,1,1,1) }
                    GradientStop { position: 1.0; color: Qt.hsva(0.6667,1,0,1) }
                }
            }
        }

        handle: Item {
            id: handle
            x: rgbSlider.leftPadding + rgbSlider.visualPosition * (rgbSlider.availableWidth - width)
            y: 0
            width: 12
            height: sliderHeight

            Canvas {
                z:50
                visible: true
                implicitWidth: handle.width
                implicitHeight: handle.height
                contextType: "2d"

                onPaint: {
                    var context = getContext("2d")
                    context.reset();
                    context.lineWidth = 1
                    context.strokeStyle = "#888"
                    context.fillStyle = "#eee";

                    context.beginPath();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width, 7);
                    context.lineTo(width/2, 12);
                    context.lineTo(0, 7);
                    context.lineTo(0, 0);

                    context.moveTo(0, height);
                    context.lineTo(width, height);
                    context.lineTo(width, height-7);
                    context.lineTo(width/2, height-12);
                    context.lineTo(0, height-7);
                    context.closePath();
                    context.fill();
                    context.stroke();
                }
            }
        }
    }

    onValueChanged: {
        root.rgbArray = hToRgb(root.value)
        if (rgbArray[0] !== '0') {
            color = "red"
            color_value = rgbArray[0]
        } else if (rgbArray[1] !== '0') {
            color = "green"
            color_value = rgbArray[1]
        } else {
            color = "blue"
            color_value = rgbArray[2]
        }
   }

    // Dumbed down version of hsvToRgb function to match simpler RGB gradient slider
    function hToRgb(h){
        var r, g, b;

        var i = Math.floor(h * 3);
        var f = h * 3 - i;
        var q = 1 - f;
        if (i < 3){
            switch(i % 3){
                case 0: r = q; g = 0; b = 0; break;
                case 1: r = 0; g = q; b = 0; break;
                case 2: r = 0; g = 0; b = q; break;
            }
        } else {
            r = 0; g = 0; b = 0;
        }

        return [(r * 255).toFixed(0), (g * 255).toFixed(0), (b * 255).toFixed(0)];
    }

}

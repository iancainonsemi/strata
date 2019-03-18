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
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import "qrc:/views/usb-pd-multiport/views/advanced-partial-views"

Rectangle {
    id: root

    property real unpoppedWidth: parent.width
    property real unpoppedHeight: port.height + topBar.height
    property string title: "<b>Port " + portNumber + "</b>"
    property color overlaycolor: "tomato"
    property variant clickPos: "1,1" // @disable-check M311 // Ignore 'use string' (M311) QtCreator warning
    property bool firstPop: true
    property bool popped: false

    property alias portNumber: port.portNumber
    property alias portConnected: port.portConnected
    property alias portColor: port.portColor
    property alias enableAssuredPower: port.enableAssuredPower

    implicitWidth: unpoppedWidth
    implicitHeight: unpoppedHeight

    Rectangle {
        id: popout
        anchors {
            fill: parent
        }
        color: "#fff"
        border {
            width: 1
            color: "#ccc"
        }

        states: [
            State {
                name: "unpopped"
                ParentChange {
                    target: popout
                    parent: root
                }
            },
            State {
                name: "popped"
                ParentChange {
                    target: popout
                    parent: poppedWindow
                    x: 0
                    y: 0
                }
            }
        ]

        transitions: [
            Transition {
                id: popoutAnimation
                from: "*"
                to: "popped"
                NumberAnimation {
                    target: root
                    property: "height"
                    from: root.height
                    to: 0
                    duration: 200
                }
                NumberAnimation {
                    target: root
                    property: "width"
                    from: root.width
                    to: 0
                    duration: 200
                }
                onRunningChanged: {
                    if (popoutAnimation.running){
                        root.popped = true
                    } else {
                        root.height = 0
                    }
                }
            },
            Transition {
                id: popinAnimation
                from: "popped"
                to: "unpopped"
                NumberAnimation {
                    target: root
                    property: "height"
                    from: root.height
                    to: root.unpoppedHeight
                    duration: 200
                }
                NumberAnimation {
                    target: root
                    property: "width"
                    from: root.width
                    to: root.unpoppedWidth
                    duration: 200
                }
                onRunningChanged: {
                    if (popinAnimation.running){
                        root.popped = false
                    } else {
                        root.width = Qt.binding(function() { return root.unpoppedWidth})  // Rebind unpopped dims after animation - numberAnimation is a shallow reference that does not override a propertyChange in the state (probable bug)
                        root.height = Qt.binding(function() { return root.unpoppedHeight})
                    }
                }
            }
        ]

        Rectangle {
            id: topBar
            anchors {
                top: parent.top
                left: parent.left
            }
            width: parent.width
            height: popout.state === "popped" ? 32 : 0
            color: "#eee"
            border {
                width: 1
                color: "#ccc"
            }
            visible: popout.state === "popped"

            Text {
                id: title
                text: root.title
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 13
                }
            }

            MouseArea {
                enabled: popout.state === "popped"
                anchors {
                    fill: parent
                }

                onPressed: {
                    root.clickPos = Qt.point(mouse.x,mouse.y)
                }

                onPositionChanged: {
                    var delta = Qt.point(mouse.x-root.clickPos.x, mouse.y-root.clickPos.y)
                    popoutWindow.x += delta.x;
                    popoutWindow.y += delta.y;
                }
            }

            Rectangle {
                id: popper
                height: topBar.height
                width: height
                anchors {
                    verticalCenter: topBar.verticalCenter
                    right: topBar.right
                }
                color: "#eee"
                border {
                    width: 1
                    color: "#ccc"
                }

                Text {
                    id: popperIcon
                    rotation: popout.state === "unpopped" | popout.state === ""  ? 0 : 180
                    text: popout.state === "unpopped" | popout.state === ""  ? "\u0038" : "\u0037"
                    font {
                        pixelSize: 18
                        family: sgicons.name
                    }
                    anchors {
                        centerIn: parent
                    }
                    color: "#888"
                }

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        if (popout.state === "unpopped" | popout.state === "" ){
                            if (root.firstPop) {
                                popoutWindow.width = root.unpoppedWidth
                                //popoutWindow.height = root.unpoppedHeight
                                var globalPosition = mapToGlobal(mouse.x, mouse.y)
                                popoutWindow.x = globalPosition.x - popoutWindow.width / 2;
                                popoutWindow.y = globalPosition.y - topBar.height / 2;
                                root.firstPop = false
                            }
                            popout.state = "popped"
                            popoutWindow.visible = true
                        } else {
                            popout.state = "unpopped"
                            popoutWindow.visible = false
                        }
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        Rectangle {
            id: popoutContent
            color: popout.color
            anchors {
                top: topBar.bottom
                left: popout.left
                right: popout.right
                margins: 1
            }
            height: port.height

            Port {
                id: port
            }
        }
    }

    Window {
        id: popoutWindow
        visible: false
        flags: Qt.Tool | Qt.FramelessWindowHint
        height: port.height + topBar.height

        Rectangle {
            id: poppedWindow
            anchors {
                fill: parent
            }
            color: "white"
        }

        MouseArea {
            id: resize
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            width: 15
            height: 15
            enabled: popout.state === "popped"
            cursorShape: Qt.SizeFDiagCursor

            onPressed: {
                root.clickPos  = Qt.point(mouse.x,mouse.y)
            }

            onPositionChanged: {
                var delta = Qt.point(mouse.x-root.clickPos.x, mouse.y-root.clickPos.y)
                popoutWindow.width += delta.x;
                //popoutWindow.height += delta.y;
            }

            Text {
                id: resizeHint
                text: "\u0023"
                rotation: -45
                opacity: 0.15
                anchors {
                    right: parent.right
                    rightMargin: 4
                    bottom: parent.bottom
                }
                font {
                    pixelSize: 18
                    family: sgicons.name
                }
            }
        }
    }

    Rectangle {
        id: popper2
        height: 32
        width: 170
        z:20
        anchors {
            top: root.top
            right: root.right
        }
        color: "#eee"
        border {
            width: 1
            color: "#ccc"
        }
        visible: popout.state !== "popped"

        Text {
            id: popper2text
            text: "Open in new window"
            font {
//                pixelSize: 18
            }
            anchors {
                right: popper2Icon.left
                verticalCenter: parent.verticalCenter
                rightMargin: 12
            }
            color: "#888"
        }

        Text {
            id: popper2Icon
            rotation: popout.state === "unpopped" | popout.state === ""  ? 0 : 180
            text: popout.state === "unpopped" | popout.state === ""  ? "\u0038" : "\u0037"
            font {
                pixelSize: 18
                family: sgicons.name
            }
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: parent.height/2-width/2
            }
            color: "#888"
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                if (popout.state === "unpopped" | popout.state === "" ){
                    if (root.firstPop) {
                        popoutWindow.width = root.unpoppedWidth
                        //popoutWindow.height = root.unpoppedHeight
                        var globalPosition = mapToGlobal(mouse.x, mouse.y)
                        popoutWindow.x = globalPosition.x - popoutWindow.width / 2;
                        popoutWindow.y = globalPosition.y - topBar.height / 2;
                        root.firstPop = false
                    }
                    popout.state = "popped"
                    popoutWindow.visible = true
                } else {
                    popout.state = "unpopped"
                    popoutWindow.visible = false
                }
            }
            cursorShape: Qt.PointingHandCursor
        }
    }

    FontLoader {
        id: sgicons
        source: "fonts/sgicons.ttf"
    }
}

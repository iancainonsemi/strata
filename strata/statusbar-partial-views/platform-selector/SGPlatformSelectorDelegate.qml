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
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import Fonts 1.0
import QtQuick.Shapes 1.0
import "qrc:/js/platform_selection.js" as PlatformSelection

Item {
    id: root
    implicitWidth: 950
    implicitHeight: 160
    property bool isCurrentItem: false

    MouseArea{
        anchors{
            fill: parent
        }
        onClicked: {
            root.ListView.view.currentIndex = index
        }
    }

    Image {
        id: image
        sourceSize.height: 120
        fillMode: Image.PreserveAspectFit
        source: "images/platform-images/" + model.image
        anchors {
            verticalCenter: root.verticalCenter
            left: root.left
            leftMargin: 25
        }
        visible: model.image !== undefined

        Image {
            id: comingSoon
            sourceSize.height: image.sourceSize.height
            fillMode: Image.PreserveAspectFit
            source: "images/platform-images/comingSoon.png"
            visible: !model.available.documents && !model.available.control
        }
    }

    DropShadow {
        anchors {
            centerIn: image
        }
        width: image.width
        height: image.height
        horizontalOffset: 1
        verticalOffset: 3
        radius: 15.0
        samples: radius*2
        color: "#cc000000"
        source: image
        z: -1
        cached: true
    }

    Item {
        id: infoColumn
        anchors {
            left: image.right
            leftMargin: 20
            top: root.top
            topMargin: 20
            bottom: root.bottom
            bottomMargin: 20
        }
        width: 300

        Text {
            id: name
            text: model.verbose_name
            font {
                pixelSize: 18
                family: Fonts.franklinGothicBold
            }
            width: infoColumn.width
            anchors {
                horizontalCenter: infoColumn.horizontalCenter
                top: infoColumn.top
            }
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: info
            text: model.description
            anchors {
                horizontalCenter: infoColumn.horizontalCenter
                top: name.bottom
                topMargin: 10
                bottom: productId.top
                bottomMargin: 10
            }
            width: infoColumn.width
            font {
                pixelSize: 12
                family: Fonts.franklinGothicBook
            }
            wrapMode: Text.Wrap
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: productId
            text: model.on_part_number
            anchors {
                horizontalCenter: infoColumn.horizontalCenter
                bottom: infoColumn.bottom
            }
            width: infoColumn.width
            font {
                pixelSize: 12
                family: Fonts.franklinGothicBook
            }
            color: "#AAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Item {
        id: iconContainer
        anchors {
            verticalCenter: root.verticalCenter
            left: infoColumn.right
            leftMargin: 30
            right: buttonColumn.left
            rightMargin: 30
        }
        height: root.height - 20
        width: 240

        PathView  {
            id: iconPathview
            anchors {
                fill: iconContainer
            }
            clip: true
            model: icons
            pathItemCount: 3
            interactive: false
            preferredHighlightBegin: .5
            preferredHighlightEnd: .5
            property real delegateHeight: 120
            property real delegateWidth: 120
            delegate: Item {
                    id: delegate
                    z: PathView.delZ ? PathView.delZ : 1 // if/then due to random bug that assigns undefined occassionally
                    height: icon.height
                    width: icon.width
                    scale: PathView.delScale ? PathView.delScale : 0.5 // if/then due to random bug that assigns undefined occassionally

                    Image {
                        id: icon
                        height: iconPathview.delegateHeight
                        width: iconPathview.delegateWidth
                        source: "images/icons/" + model.icon + ".png"
                        opacity: delegate.PathView.delOpacity ? delegate.PathView.delOpacity : 0.7 // if/then due to random bug that assigns undefined occassionally
                    }

                    Rectangle {
                        height: icon.height*.966
                        width: icon.width*.966
                        anchors {
                            centerIn: parent
                        }
                        z:-1
                        radius: height/2
                        opacity: 1
                    }
                }

            path: pathIcon

            Path {
                id: pathIcon

                startX : -iconPathview.delegateWidth
                startY: (iconPathview.height * 0.5)

                PathAttribute {name : "delScale"; value: 0.5}
                PathAttribute {name : "delZ"; value: 0}
                PathAttribute {name : "delOpacity"; value: 0.7}

                PathLine {x : 0; y : iconPathview.height * 0.5}

                PathPercent {value : 0.1}
                PathAttribute {name : "delScale"; value : 0.5}
                PathAttribute {name : "delZ"; value :0}
                PathAttribute {name : "delOpacity"; value: 0.7}

                PathLine {x : iconPathview.width/3; y : iconPathview.height * 0.5}

                PathPercent {value : 0.4}
                PathAttribute {name : "delScale"; value: 1.0}
                PathAttribute {name : "delZ"; value: 1}
                PathAttribute {name : "delOpacity"; value: 1.0}

                PathLine {x : 2*iconPathview.width/3; y : iconPathview.height * 0.5}

                PathAttribute {name : "delScale"; value: 1.0}
                PathAttribute {name : "delZ"; value: 1}
                PathAttribute {name : "delOpacity"; value: 1.0}
                PathPercent {value : 0.6}

                PathLine {x : iconPathview.width; y : iconPathview.height * 0.5}

                PathAttribute {name : "delScale"; value: 0.5}
                PathAttribute {name : "delZ"; value: 0}
                PathAttribute {name : "delOpacity"; value: 0.7}
                PathPercent {value : 0.9}

                PathLine {x : iconPathview.width + iconPathview.delegateWidth; y : iconPathview.height * 0.5}
            }

            highlightMoveDuration: 200

            Timer {
                running: root.isCurrentItem
                interval: 1500
                onTriggered: {
                    iconPathview.decrementCurrentIndex()
                }
                repeat: true
            }
        }
    }

    Column {
        id: buttonColumn
        spacing: 20
        anchors {
            verticalCenter: root.verticalCenter
            right: root.right
            rightMargin: 25
        }
        width: 170

        Text {
            id: comingSoonWarn
            text: "This platform is coming soon!"
            visible: !model.available.documents && !model.available.control
            width: buttonColumn.width
            font.pixelSize: 16
            font.family: Fonts.franklinGothicBold
            opacity: enabled ? 1.0 : 0.3
            color: "#333"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Button {
            id: select
            text: model.connection === "connected" ? "Connect to Board" : "Browse Documentation"
            anchors {
                horizontalCenter: buttonColumn.horizontalCenter
            }
            visible: model.connection === "connected" ? model.available.control : model.available.documents

            contentItem: Text {
                text: select.text
                font.pixelSize: 12
                font.family: Fonts.franklinGothicBook
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: select.down ? "#666" : "#999"
            }

            onClicked: {
                PlatformSelection.selectPlatform(index)
            }
        }

        Button {
            id: order
            text: "Contact Sales"
            anchors {
                horizontalCenter: buttonColumn.horizontalCenter
            }
            visible: !(!model.available.documents && !model.available.control)

            contentItem: Text {
                text: order.text
                font.pixelSize: 12
                font.family: Fonts.franklinGothicBook
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: order.down ? "#666" : "#999"
            }

            onClicked: {
                orderPopup.open()
            }
        }
    }

    Rectangle {
        id: bottomDivider
        color: "#ddd"
        height: 1
        anchors {
            bottom: root.bottom
            horizontalCenter: root.horizontalCenter
        }
        width: parent.width - 20
    }
}

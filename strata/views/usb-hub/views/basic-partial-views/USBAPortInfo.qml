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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/views/usb-pd-multiport/sgwidgets"

Rectangle {
    id: root

    property bool portConnected: false
    property bool isUSBAPort: true     //used to hide information not available for USB-A ports
    property color portColor: "#30a2db"
    property int portNumber: 0
    property alias portName: portTitle.text
    property alias portSubtitle: portSubtitle.text

    property alias outputVoltage: outputVoltageBox.value
    property alias maxPower: maxPowerBox.value
    property alias inputPower: powerInBox.value
    property alias outputPower: powerOutBox.value
    property alias portTemperature: temperatureBox.value

    property int basicTitleBackgroundHeight: 50//(2*root.height)/16;
    property int advancedTitleBackgroundHeight: advancedDisplayPortPortHeight/4

    onPortConnectedChanged:{
        if (portConnected)
            hideStats.start()
         else
            showStats.start()
    }

    OpacityAnimator {
        id: hideStats
        target: connectionContainer
        from: 1
        to: 0
        duration: 1000
    }

    OpacityAnimator {
        id: showStats
        target: connectionContainer
        from: 0
        to: 1
        duration: 1000
    }



    signal showGraph()

    color: "lightgoldenrodyellow"
    radius: 5
    border.color: "black"
    width: 150

    function transitionToAdvancedView(){
        outputVoltageBox.anchors.topMargin = 3;
        maxPowerBox.anchors.topMargin = 3;
        powerInBox.anchors.topMargin = 3;
        powerOutBox.anchors.topMargin = 3;
        temperatureBox.anchors.topMargin = 3;
        portToAdvanced.start()
    }

    ParallelAnimation{
        id: portToAdvanced
        running: false

        PropertyAnimation{
            target:titleBackground
            property: "height"
            to:advancedTitleBackgroundHeight
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:powerInBox
            property: "height"
            to:-5
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:portSubtitle
            property: "opacity"
            to:0
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:chargingRectangle
            property: "opacity"
            to:1
            duration: tabTransitionTime
        }
    }

    function transitionToBasicView(){
        outputVoltageBox.anchors.topMargin = 8;
        maxPowerBox.anchors.topMargin = 8;
        powerInBox.anchors.topMargin = 8;
        powerOutBox.anchors.topMargin = 8;
        temperatureBox.anchors.topMargin = 8;
        portToBasic.start()
    }

    ParallelAnimation{
        id: portToBasic
        running: false

        PropertyAnimation{
            target:titleBackground
            property: "height"
            to:basicTitleBackgroundHeight
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:powerInBox
            property: "height"
            to:40
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:portSubtitle
            property: "opacity"
            to:1
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:chargingRectangle
            property: "opacity"
            to:0
            duration: tabTransitionTime
        }
    }

    Rectangle{
        id:titleBackground
        color:"lightgrey"
        anchors.top: root.top
        anchors.topMargin: 1
        anchors.left:root.left
        anchors.leftMargin: 1
        anchors.right: root.right
        anchors.rightMargin: 1
        height: 50//(2*root.height)/16
        radius:5
        z:1

        Rectangle{
            id:squareBottomBackground
            color:"lightgrey"
            anchors.top:titleBackground.top
            anchors.topMargin:(titleBackground.height)/2
            anchors.left:titleBackground.left
            anchors.right: titleBackground.right
            height: (titleBackground.height)/2
        }

        Text {
            id: portTitle
            text: "foo"
            anchors.horizontalCenter: titleBackground.horizontalCenter
            anchors.verticalCenter: titleBackground.verticalCenter
            font {
                pixelSize: 28
            }

            color: root.portConnected ? "black" : "#bbb"
        }
        Text {
            id: portSubtitle
            text: ""
            anchors.horizontalCenter: titleBackground.horizontalCenter
            anchors.top: portTitle.bottom
            anchors.topMargin: -5
            font {
                pixelSize: 12
            }

            color: "darkGrey"
        }
    }

    PortStatBox{
        id:outputVoltageBox
        anchors.left:root.left
        anchors.leftMargin: 10
        anchors.top: titleBackground.bottom
        anchors.topMargin: 8
        anchors.right: root.right
        anchors.rightMargin: 10
        height:40
        label: "VOLTAGE OUT"
        color:"transparent"
    }

    PortStatBox{
        id:maxPowerBox
        anchors.left:root.left
        anchors.leftMargin: 10
        anchors.top: outputVoltageBox.bottom
        anchors.topMargin: 8
        anchors.right: root.right
        anchors.rightMargin: 10
        height:40
        label: "MAXIMUM POWER"
        unit: "W"
        color:"transparent"
        icon: "../images/icon-max.svg"
    }

    PortStatBox{
        id:powerInBox
        anchors.left:root.left
        anchors.leftMargin: 10
        anchors.top: maxPowerBox.bottom
        anchors.topMargin: 8
        anchors.right: root.right
        anchors.rightMargin: 10
        height:40
        label: "POWER IN"
        unit:"W"
        color:"transparent"
        icon: "../images/icon-voltage.svg"
        visible: !isUSBAPort
    }

    PortStatBox{
        id:powerOutBox
        anchors.left:root.left
        anchors.leftMargin: 10
        anchors.top: powerInBox.bottom
        anchors.topMargin: 8
        anchors.right: root.right
        anchors.rightMargin: 10
        height:40
        label: "POWER OUT"
        unit:"W"
        color:"transparent"
        icon: "../images/icon-voltage.svg"
    }

    PortStatBox{
        id:temperatureBox
        anchors.left:root.left
        anchors.leftMargin: 10
        anchors.top: powerOutBox.bottom
        anchors.topMargin: 8
        anchors.right: root.right
        anchors.rightMargin: 10
        height:40
        label: "TEMPERATURE"
        unit:"°C"
        color:"transparent"
        icon: "../images/icon-temp.svg"
    }

    Rectangle{
        id:chargingRectangle
        anchors.left:root.left
        anchors.top: temperatureBox.bottom
        anchors.topMargin: 3
        anchors.right: root.right
        anchors.rightMargin: 10
        height:20
        opacity: 0
        color:"transparent"

        Text {
            id:chargingText
            text: "CHARGING"
            anchors.left:chargingRectangle.left
            anchors.leftMargin: 10
            anchors.verticalCenter: chargingRectangle.verticalCenter
        }

        RadioButton {
            id: chargingIndicator
            anchors.right:chargingRectangle.right
            anchors.rightMargin: 61
            anchors.verticalCenter: chargingRectangle.verticalCenter
            height:15
            autoExclusive : false
            indicator: Rectangle{
                implicitWidth: 15
                implicitHeight: 15
                x: chargingIndicator.x
                y: chargingIndicator.y
                radius: 7
                color: chargingIndicator.checked ? "green": "white"
                border.color: chargingIndicator.checked ? "black": "grey"
            }
        }
    }

    Rectangle {
        id: connectionContainer
        opacity: 1
        z:1

        anchors {
            top:titleBackground.bottom
            left:root.left
            leftMargin: 2
            right:root.right
            rightMargin: 2
            bottom:root.bottom
            bottomMargin: 2
        }

        Image {
            id: connectionIcon
            source: "../images/icon-usb-disconnected.svg"
            height: connectionContainer.height/4
            width: height * 0.6925
            anchors {
                centerIn: parent
                verticalCenterOffset: -connectionText.font.pixelSize / 2
            }
        }

        Text {
            id: connectionText
            color: "#ccc"
            text: "<b>Port Disconnected</b>"
            anchors {
                top: connectionIcon.bottom
                topMargin: 5
                horizontalCenter: connectionIcon.horizontalCenter
            }
            font {
                pixelSize: 14
            }
        }
    }
}
    /*
    Item {
        id: margins
        anchors {
            fill: parent
            topMargin: 15
            leftMargin: 15
            rightMargin: 0
            bottomMargin: 15
        }

        Item {
            id: statsContainer
            anchors {
                top: margins.top
                bottom: margins.bottom
                right: margins.right
                left: margins.left
            }

            Text {
                id: portTitle
                text: "<b>Port " + portNumber + "</b>"
                font {
                    pixelSize: 25
                }
                anchors {
                    verticalCenter: statsContainer.verticalCenter
                }
                color: root.portConnected ? "black" : "#bbb"
            }

            Button {
                id: showGraphs
                text: "Graphs"
                anchors {
                    bottom: statsContainer.bottom
                    horizontalCenter: portTitle.horizontalCenter
                }
                height: 20
                width: 60
                onClicked: root.showGraph()
            }

            Rectangle {
                id: divider
                width: 1
                height: statsContainer.height
                color: "#ddd"
                anchors {
                    left: portTitle.right
                    leftMargin: 10
                }
            }

            Item {
                id: stats
                anchors {
                    top: statsContainer.top
                    left: divider.right
                    leftMargin: 10
                    right: statsContainer.right
                    bottom: statsContainer.bottom
                }

                Item {
                    id: connectionContainer
                    visible: !root.portConnected

                    anchors {
                        centerIn: parent
                    }

                    Image {
                        id: connectionIcon
                        source: "../images/icon-usb-disconnected.svg"
                        height: stats.height * 0.666
                        width: height * 0.6925
                        anchors {
                            centerIn: parent
                            verticalCenterOffset: -connectionText.font.pixelSize / 2
                        }
                    }

                    Text {
                        id: connectionText
                        color: "#ccc"
                        text: "<b>Port Disconnected</b>"
                        anchors {
                            top: connectionIcon.bottom
                            topMargin: 5
                            horizontalCenter: connectionIcon.horizontalCenter
                        }
                        font {
                            pixelSize: 14
                        }
                    }
                }

                Column {
                    id: column1
                    visible: root.portConnected
                    anchors {
                        verticalCenter: stats.verticalCenter
                    }
                    width: stats.width/2-1
                    spacing: 3

                    PortStatBox {
                        id:advertisedVoltageBox
                        label: "PROFILE"
                        //value: "20"
                        icon: "../images/icon-voltage.svg"
                        portColor: root.portColor
                        unit: "V"
                        height: (root.height - 10)/4
                    }

                    PortStatBox {
                        id:maxPowerBox
                        label: "MAX CAPACITY"
                        //value: "100"
                        icon: "../images/icon-max.svg"
                        portColor: root.portColor
                        unit: "W"
                        height: (root.height - 10)/4
                    }

                    PortStatBox {
                        id:inputPowerBox
                        label: "POWER IN"
                        //value: "9"
                        icon: "../images/icon-voltage.svg"
                        portColor: root.portColor
                        unit: "W"
                        height: (root.height - 10)/4
                    }

                    PortStatBox {
                        id:outputPowerBox
                        label: "POWER OUT"
                        //value: "7.8"
                        icon: "../images/icon-voltage.svg"
                        portColor: root.portColor
                        unit: "W"
                        height: (root.height - 10)/4
                    }

                }

                Column {
                    id: column2
                    visible: root.portConnected
                    anchors {
                        left: column1.right
                        leftMargin: column1.spacing
                        verticalCenter: column1.verticalCenter
                    }
                    spacing: column1.spacing
                    width: stats.width/2 - 2

                    PortStatBox {
                        id:outputVoltageBox
                        label: "VOLTAGE OUT"
                        //value: "20.4"
                        icon: "../images/icon-voltage.svg"
                        portColor: root.portColor
                        unit: "V"
                        height: (root.height - 10)/4
                    }

                    PortStatBox {
                        id:portTemperatureBox
                        label: "TEMPERATURE"
                        //value: "36"
                        icon: "../images/icon-temp.svg"
                        portColor: root.portColor
                        unit: "°C"
                        height: (root.height - 10)/4
                    }

                    PortStatBox {
                        id:efficencyBox
                        label: "EFFICIENCY"
                        //value: "92"
                        icon: "../images/icon-efficiency.svg"
                        portColor: root.portColor
                        unit: "%"
                        height: (root.height - 10)/4
                    }
                }
            }
        }
    }
}
*/

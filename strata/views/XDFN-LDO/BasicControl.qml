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

﻿import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "qrc:/js/navigation_control.js" as NavigationControl
import "qrc:/views/XDFN-LDO/sgwidgets"
import "qrc:/js/help_layout_manager.js" as Help

Item {
    property bool state: false
    property string vinlable: ""
    property string labelTest: ""
    property string read_enable_state: platformInterface.initial_status.enable_status
    onRead_enable_stateChanged: {
        if(read_enable_state === "on") {
            platformInterface.enabled = true
        }
        else  {
            platformInterface.enabled = false
        }
    }

    property string read_vin_mon: platformInterface.initial_status.vin_mon_status
    onRead_vin_monChanged: {
        if(read_vin_mon === "good") {
            ledLight.status = "green"
            vinlable = "over"
            ledLight.label = "VIN Ready ("+ vinlable + " 2.25V)"
            enableSwitch.enabled  = true
            enableSwitch.opacity = 1.0
        }
        else {
            ledLight.status = "red"
            vinlable = "under"
            ledLight.label = "VIN Ready ("+ vinlable + " 2.25V)"
            enableSwitch.enabled  = false
            enableSwitch.opacity = 0.5
            platformInterface.enabled = false
        }
    }

    Component.onCompleted:  {
        multiplePlatform.check_class_id()
        platformInterface.read_initial_status.update()
        Help.registerTarget(tempGauge, "The center gauge shows the temperature of the board.", 4, "basicHelp")
        Help.registerTarget(enableSwitch, "This switch enables or disables the LDO output.", 5, "basicHelp")
        Help.registerTarget(ledLight, "The LED will light up green when input voltage is ready and greater than 2.25V. It will light up red when under 2.25V to warn the user that input voltage is not high enough.", 1, "basicHelp")
        Help.registerTarget(inputVoltage,"Input voltage is shown here in Volts.", 2 , "basicHelp")
        Help.registerTarget(inputCurrent,"Input current is shown here in milliamps.", 3 , "basicHelp")
        Help.registerTarget(ouputCurrent,"Output current is shown here in milliamps.", 7, "basicHelp")
        Help.registerTarget(outputVoltage,"Output voltage is shown here in Volts.", 6, "basicHelp")
    }

    FontLoader {
        id: icons
        source: "sgwidgets/fonts/sgicons.ttf"
    }

    Rectangle{
        anchors.fill: parent
        width : parent.width
        height: parent.height

        Rectangle {
            id: pageLable
            width: parent.width/2
            height: parent.height/ 12
            anchors {
                top: parent.top
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: pageText
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text:  multiplePlatform.partNumber /*"<b> NCV8163 </b>"*/
                font.pixelSize: (parent.width + parent.height)/ 30
                color: "black"
            }
            Text {
                id: pageText2
                anchors {
                    top: pageText.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                text: multiplePlatform.title /*"<b>Low Noise and High PSRR Linear Regulator</b>"*/
                font.pixelSize: (parent.width + parent.height)/ 30
                color: "black"

            }
        }
        Rectangle{
            width: parent.width
            height: parent.height - 100
            anchors{
                top: pageLable.bottom
                topMargin: 20
            }

            Rectangle {
                id:left
                width: parent.width/3
                height: (parent.height/2) + 100
                anchors {
                    top:parent.top
                    topMargin: 40
                    left: parent.left
                    leftMargin: 20
                }

                color: "transparent"
                border.color: "black"
                border.width: 5
                radius: 10

                Rectangle {
                    id: textContainer2
                    width: parent.width/5
                    height: parent.height/10

                    anchors {
                        top: parent.top
                        topMargin: 20
                        horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        id: containerLabel2
                        text: "Input"
                        anchors{
                            fill: parent
                            centerIn: parent
                        }
                        font.pixelSize: height
                        font.bold: true
                        fontSizeMode: Text.Fit
                    }

                }
                Rectangle {
                    id: line
                    height: 2
                    width: parent.width - 9

                    anchors {
                        top: textContainer2.bottom
                        topMargin: 2
                        left: parent.left
                        leftMargin: 5
                    }
                    border.color: "gray"
                    radius: 2
                }
                SGStatusLight {
                    id: ledLight
                    // Optional Configuration:
                    label: "VIN Ready (under 2.25V)" // Default: "" (if not entered, label will not appear)
                    anchors {
                        top : line.bottom
                        topMargin : 20
                        horizontalCenter: parent.horizontalCenter
                    }

                    lightSize: (parent.width + parent.height)/23
                    fontSize:  (parent.width + parent.height)/46

                    property string vinMonitor: platformInterface.status_vin_good.vingood
                    onVinMonitorChanged:  {
                        if(vinMonitor === "good") {
                            status = "green"
                            vinlable = "over"
                            label = "VIN Ready ("+ vinlable + " 2.25V)"
                            //Show enableSwitch if vin is "good"
                            enableSwitch.enabled  = true
                            enableSwitch.opacity = 1.0
                        }
                        else if(vinMonitor === "bad") {
                            status = "red"
                            vinlable = "under"
                            label = "VIN Ready ("+ vinlable + " 2.25V)"
                            //Hide enableSwitch if vin is "good"
                            enableSwitch.enabled  = false
                            enableSwitch.opacity = 0.5
                            platformInterface.enabled = false
                        }
                    }
                }


                Rectangle {
                    id: warningBox2
                    color: "red"
                    anchors {
                        top: ledLight.bottom
                        topMargin: 15
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width - 40
                    height: parent.height/10

                    Text {
                        id: warningText2
                        anchors {
                            centerIn: warningBox2
                        }
                        text: "<b>DO NOT exceed input voltage more than 5.5V</b>"
                        font.pixelSize: (parent.width + parent.height)/32
                        color: "white"
                    }

                    Text {
                        id: warningIconleft
                        anchors {
                            right: warningText2.left
                            verticalCenter: warningText2.verticalCenter
                            rightMargin: 5
                        }
                        text: "\ue80e"
                        font.family: icons.name
                        font.pixelSize: (parent.width + parent.height)/19
                        color: "white"
                    }

                    Text {
                        id: warningIconright
                        anchors {
                            left: warningText2.right
                            verticalCenter: warningText2.verticalCenter
                            leftMargin: 5
                        }
                        text: "\ue80e"
                        font.family: icons.name
                        font.pixelSize: (parent.width + parent.height)/19
                        color: "white"
                    }
                }

                SGLabelledInfoBox {
                    id: inputVoltage
                    label: "Input Voltage"
                    info: platformInterface.status_voltage_current.vin.toFixed(2)
                    unit: "V"
                    infoBoxWidth: parent.width/3
                    infoBoxHeight : parent.height/12
                    fontSize :  (parent.width + parent.height)/37
                    unitSize: (parent.width + parent.height)/35
                    anchors {
                        top : warningBox2.bottom
                        topMargin : 20
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset:  (width - inputCurrent.width)/2
                    }
                }

                SGLabelledInfoBox {
                    id: inputCurrent
                    label: "Input Current"
                    info: platformInterface.status_voltage_current.iin.toFixed(2)
                    unit: "mA"
                    infoBoxWidth: parent.width/3
                    infoBoxHeight :  parent.height/12
                    fontSize :   (parent.width + parent.height)/37
                    unitSize: (parent.width + parent.height)/35
                    anchors {
                        top : inputVoltage.bottom
                        topMargin : 20
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle {
                id: gauge
                width: parent.width/3.5
                height: (parent.height/2) + 100
                anchors{
                    left: left.right
                    top:parent.top
                    topMargin: 40
                }

                SGCircularGauge {
                    id: tempGauge
                    anchors {
                        fill : parent
                        horizontalCenter: gauge.horizontalCenter
                    }
                    width: parent.width
                    height: parent.height
                    gaugeFrontColor1: Qt.rgba(0,0.5,1,1)
                    gaugeFrontColor2: Qt.rgba(1,0,0,1)
                    minimumValue: -55
                    maximumValue: 125
                    tickmarkStepSize: 20
                    outerColor: "#999"
                    unitLabel: "°C"
                    gaugeTitle : "Board" +"\n" + "Temperature"
                    value: platformInterface.status_temperature_sensor.temperature
                    Behavior on value { NumberAnimation { duration: 300 } }
                }

            }

            Rectangle {
                id:right
                anchors {
                    top:parent.top
                    topMargin: 40
                    left: gauge.right
                    right: parent.right
                    rightMargin: 20
                }
                width: parent.width/3
                height: (parent.height/2) + 100
                color: "transparent"
                border.color: "black"
                border.width: 5
                radius: 10

                Rectangle {
                    id: textContainer
                    width: parent.width/4.5
                    height: parent.height/10
                    anchors {
                        top: parent.top
                        topMargin: 20
                        horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        id: containerLabel
                        text: "Output"
                        anchors{
                            fill: parent
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: 7
                        }
                        font.pixelSize: height
                        font.bold: true
                        fontSizeMode: Text.Fit
                    }
                }

                Rectangle {
                    id: line2
                    height: 2
                    width: parent.width - 9

                    anchors {
                        top: textContainer.bottom
                        topMargin: 2
                        left: parent.left
                        leftMargin: 5
                    }
                    border.color: "gray"
                    radius: 2
                }

                SGSwitch {
                    id: enableSwitch
                    anchors {
                        top: line2.bottom
                        topMargin :  20
                        horizontalCenter: parent.horizontalCenter
                    }


                    label : "Enable (EN)"
                    switchWidth: parent.width/8            // Default: 52 (change for long custom checkedLabels when labelsInside)
                    switchHeight: parent.height/20               // Default: 26
                    textColor: "black"              // Default: "black"
                    handleColor: "white"            // Default: "white"
                    grooveColor: "#ccc"             // Default: "#ccc"
                    grooveFillColor: "#0cf"         // Default: "#0cf"
                    fontSizeLabel: (parent.width + parent.height)/40
                    checked: platformInterface.enabled
                    onToggled: {
                        platformInterface.enabled = checked
                        if(checked){
                            platformInterface.set_enable.update("on")
                        }
                        else{
                            platformInterface.set_enable.update("off")
                        }
                    }
                }

                SGLabelledInfoBox {
                    id: outputVoltage
                    label: "Output Voltage"
                    info: platformInterface.status_voltage_current.vout.toFixed(2)
                    unit: "V"
                    infoBoxWidth: parent.width/3
                    infoBoxHeight : parent.height/12
                    fontSize :  (parent.width + parent.height)/37
                    unitSize: (parent.width + parent.height)/35

                    anchors {
                        top : enableSwitch.bottom
                        topMargin : 20
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset:  (width - ouputCurrent.width)/2
                    }
                }

                SGLabelledInfoBox {
                    id: ouputCurrent
                    label: "Output Current"
                    info: platformInterface.status_voltage_current.iout.toFixed(2)
                    unit: "mA"
                    infoBoxWidth: parent.width/3
                    infoBoxHeight :  parent.height/12
                    fontSize :   (parent.width + parent.height)/37
                    unitSize: (parent.width + parent.height)/35
                    anchors {
                        top : outputVoltage.bottom
                        topMargin : 20
                        horizontalCenter: parent.horizontalCenter
                    }

                }
            }

        }

    }
}

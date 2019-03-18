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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import "qrc:/views/usb-hub/sgwidgets"

Item {
    id: systemControls

    property bool debugLayout: false
    property real ratioCalc: systemControls.width / 1200

    width: parent.width / parent.height > initialAspectRatio ? parent.height * initialAspectRatio : parent.width
    height: parent.width / parent.height < initialAspectRatio ? parent.width / initialAspectRatio : parent.height

    anchors {
        fill: parent
    }
    Rectangle{
        id:background
        color: "#145A74"
        anchors.fill:systemControls
    }

    Column{
        id:controlColumn
        anchors.top: systemControls.top
        anchors.topMargin: 50
        anchors.left: systemControls.left
        anchors.leftMargin: systemControls.width/4
        anchors.right: systemControls.right
        anchors.rightMargin: systemControls.width/4
        anchors.bottom: systemControls.bottom
        anchors.bottomMargin: 50

        spacing: 25

        Rectangle{
            id:powerGroup
            color:"lightYellow"
            height:200
            width: controlColumn.width
            radius:5

            Text {
                id: powerLabel
                text: "Power Management"
                font {
                    pixelSize: 24
                }
                anchors {
                    top: powerGroup.top
                    topMargin: 15
                    left: powerGroup.left
                    leftMargin: 10
                }
            }

            Text{
                id: powerNegotiationLabel
                text: "Negotiation Scheme:"
                anchors {
                    left: powerGroup.left
                    leftMargin: 112
                    top: powerLabel.bottom
                    topMargin: 10
                }
            }
            ColumnLayout{
                id:powerNegotiationColumn
                anchors.left: powerNegotiationLabel.right
                anchors.leftMargin: 10
                anchors.top: powerNegotiationLabel.top
                anchors.topMargin: -5
                spacing: -5

                property var negotiationTypeChanged: platformInterface.power_negotiation.negotiation_type

                onNegotiationTypeChangedChanged:{
                    if (platformInterface.power_negotiation.negotiation_type === "dynamic"){
                        dynamicNegotiationButton.checked = true;
                        //fcfsNegotiationButton.checked = false;
                        //priorityNegotiationButton.checked = false;
                    }
                    else if (platformInterface.power_negotiation.negotiation_type === "first_come_first_served"){
                        //dynamicNegotiationButton.checked = false;
                        fcfsNegotiationButton.checked = true;
                        //priorityNegotiationButton.checked = false;
                    }
                    else if (platformInterface.power_negotiation.negotiation_type === "priority"){
                        //dynamicNegotiationButton.checked = false;
                        //fcfsNegotiationButton.checked = false;
                        priorityNegotiationButton.checked = true;
                    }


                }

                RadioButton {
                    id: dynamicNegotiationButton
                    text: "Dynamic"
                    checked: true
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: dynamicNegotiationButton.down ? "lightgrey" : "black"
                        color: dynamicNegotiationButton.checked ? "#145A74": "ivory"
                    }

                    onClicked: {
                        platformInterface.set_power_negotiation.update("dynamic");
                    }
                }
                RadioButton {
                    id: fcfsNegotiationButton
                    text: "First Come First Serve"
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: fcfsNegotiationButton.down ? "#17a81a" : "black"
                        color: fcfsNegotiationButton.checked ? "#145A74": "ivory"
                    }
                    onClicked: {
                        platformInterface.set_power_negotiation.update("first_come_first_served");
                    }
                }
                RadioButton {
                    id: priorityNegotiationButton
                    text: "Priority"
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: priorityNegotiationButton.down ? "#17a81a" : "black"
                        color: priorityNegotiationButton.checked ? "#145A74": "ivory"
                    }
                    onClicked: {
                        platformInterface.set_power_negotiation.update("priority");
                    }
                }
            }




            SGSlider {
                id: maximumBoardPower
                label: "Maximum Power:"
                width: 375
                anchors {
                    left: powerGroup.left
                    leftMargin: 135
                    top:powerNegotiationColumn.bottom
                    topMargin: 10
                }
                from: 30
                to: 200
                startLabel: "38W"
                endLabel: "100W"
                labelTopAligned: true
                    //value: platformInterface.input_under_voltage_notification.minimum_voltage
                onMoved: {
                    //platformInterface.set_minimum_input_voltage.update(value);
                }
            }

            SGSubmitInfoBox {
                id: maximumBoardPowerInput
                showButton: false
                anchors {
                    verticalCenter: maximumBoardPower.verticalCenter
                    verticalCenterOffset: -7
                    left: maximumBoardPower.right
                    leftMargin: 15
                }
                //input: inputFault.value.toFixed(0)
                //onApplied: platformInterface.set_minimum_input_voltage.update(input);   // slider will be updated via notification
            }
        }

        Rectangle{
            id:faultGroup
            color:"lightYellow"
            height:200
            width: parent.width
            radius: 5

            Text {
                id: faultLabel
                text: "Faults"
                font {
                    pixelSize: 24
                }
                anchors {
                    top: faultGroup.top
                    topMargin: 15
                    left: faultGroup.left
                    leftMargin: 10
                }
            }

            Text{
                id: faultProtectionLabel
                text: "Protection:"
                anchors {
                    left: faultGroup.left
                    leftMargin: 170
                    top: faultLabel.bottom
                    topMargin: 10
                }
            }
            ColumnLayout{
                id:faultProtectionColumn
                anchors.left: faultProtectionLabel.right
                anchors.leftMargin: 10
                anchors.top: faultProtectionLabel.top
                anchors.topMargin: -5
                spacing: -5

                RadioButton {
                    id: shutdownProtectionButton
                    text: "Shutdown"
                    checked: platformInterface.usb_pd_protection_action.action === "shutdown"
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: shutdownProtectionButton.down ? "lightgrey" : "black"
                        color: shutdownProtectionButton.checked ? "#145A74": "ivory"
                    }
                    onClicked: {
                        platformInterface.set_protection_action.update("shutdown");
                    }
                }
                RadioButton {
                    id: retryProtectinButton
                    text: "Retry"
                    checked: platformInterface.usb_pd_protection_action.action === "retry"
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: retryProtectinButton.down ? "lightgrey" : "black"
                        color: retryProtectinButton.checked ? "#145A74": "ivory"
                    }

                    onClicked: {
                        platformInterface.set_protection_action.update("retry");
                    }
                }
                RadioButton {
                    id: noProtectionButton
                    text: "None"
                    checked: platformInterface.usb_pd_protection_action.action === "nothing"
                    indicator: Rectangle{
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        border.color: noProtectionButton.down ? "lightgrey" : "black"
                        color: noProtectionButton.checked ? "#145A74": "ivory"
                    }

                    onClicked: {
                        platformInterface.set_protection_action.update("nothing");
                    }
                }
            }


            SGSlider {
                id: tempFault
                label: "Fault when temperature is above:"
                labelTopAligned: true
                width:480
                anchors {
                    left: faultGroup.left
                    leftMargin: 35
                    top: faultProtectionColumn.bottom
                    topMargin: 10

                }
                from: -20
                to: 125
                startLabel: "-20°C"
                endLabel: "125°C"
                value: platformInterface.set_maximum_temperature_notification.maximum_temperature
                onMoved: {
                    platformInterface.set_maximum_temperature.update(value);
                }
            }

            SGSubmitInfoBox {
                id: tempFaultInput
                showButton: false
                anchors {
                    verticalCenter: tempFault.verticalCenter
                    verticalCenterOffset: -7
                    left:tempFault.right
                    leftMargin: 10
                }
                value: tempFault.value.toFixed(0)
                onApplied: platformInterface.set_maximum_temperature.update(input); // slider will be updated via notification
            }
        }

        Rectangle{
            id:foldbackGroup
            color:"lightYellow"
            height:220
            width: parent.width
            radius:5

            Text {
                id: tempFoldbackLabel
                text: "Temperature Foldback"
                font {
                    pixelSize: 24
                }
                anchors {
                    top: foldbackGroup.top
                    topMargin: 15
                    left: foldbackGroup.left
                    leftMargin: 10
                }
            }

            Text{
                id: temperatureFoldbackActiveLabel
                text: "Active:"
                anchors {
                    left: foldbackGroup.left
                    leftMargin: 195
                    top: tempFoldbackLabel.bottom
                    topMargin: 10
                }
            }

            SGSwitch {
                id: tempFoldbackSwitch
                anchors {
                    left: temperatureFoldbackActiveLabel.right
                    leftMargin: 10
                    verticalCenter: temperatureFoldbackActiveLabel.verticalCenter
                }
                grooveFillColor: "#145A74"
                switchHeight: 20
                switchWidth: 46
                checked: platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled
                onToggled:{
                    console.log("sending temp foldback update command from tempFoldbackSwitch");
                    platformInterface.set_temperature_foldback.update(tempFoldbackSwitch.checked,
                                                                      platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature,
                                                                      platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power);
                }
            }

            SGSlider {
                id: foldbackTemp
                label: "When any port temperature is above:"
                labelTopAligned: true
                width:510
                anchors {
                    left: foldbackGroup.left
                    leftMargin: 10
                    top: temperatureFoldbackActiveLabel.bottom
                    topMargin: 10
                }
                from: 0
                to: 125
                startLabel: "0°C"
                endLabel: "125°C"
                value: platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature
                onMoved:{
                    console.log("sending temp foldback update command from foldbackTempSlider");
                    platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
                                                                      foldbackTemp.value,
                                                                      platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power)
                }

            }


            SGSubmitInfoBox {
                id: foldbackTempInput
                showButton: false
                anchors {
                    verticalCenter: foldbackTemp.verticalCenter
                    verticalCenterOffset: -7
                    left:foldbackTemp.right
                    leftMargin: 10
                }
//                input: foldbackTemp.value.toFixed(0)
//                platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
//                                                                  platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature,
//                                                                  limitOutput2.currentText)
            }

            SGSlider {
                id: foldbackTempLimit
                label: "Cut the port output power by:"
                labelTopAligned: true
                width:465
                anchors {
                    left: foldbackGroup.left
                    leftMargin: 55
                    top: foldbackTemp.bottom
                    topMargin: 10
                }
                from: 1
                to: 100
                startLabel: "0%"
                endLabel: "99%"

                property var currentFoldbackOuput: platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power

                onCurrentFoldbackOuputChanged: {
                    //limitOutput2.currentIndex = limitOutput2.comboBox.find( parseInt (platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power))
                }


                value: platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature
                onMoved:{
//                    console.log("sending temp foldback update command from foldbackTempSlider");
//                    platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
//                                                                      platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature,
//                                                                      limitOutput2.currentText);
                }

            }

            SGSubmitInfoBox {
                id: foldbackTempLimitInput
                showButton: false
                anchors {
                    verticalCenter: foldbackTempLimit.verticalCenter
                    verticalCenterOffset: -7
                    left:foldbackTempLimit.right
                    leftMargin: 10
                }
//                input: foldbackTemp.value.toFixed(0)
//                platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
//                                                                  platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature,
//                                                                  limitOutput2.currentText)
            }



            SGSlider {
                id: tempFoldbackHysteresis
                label: "End limiting on a decrease of:"
                labelTopAligned: true
                width:465
                anchors {
                    left: foldbackGroup.left
                    leftMargin: 55
                    top: foldbackTempLimit.bottom
                    topMargin: 10
                }
                from: 25
                to: 200
                startLabel: "1°C"
                endLabel: "10°C"
                value: platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature
                onMoved:{
                    //console.log("sending temp foldback update command from foldbackTempSlider");
                    //platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
                    //                                                  foldbackTemp.value,
                    //                                                  platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power)
                }

            }

            SGSubmitInfoBox {
                id: tempFoldbackHysteresisInput
                showButton: false
                anchors {
                    verticalCenter: tempFoldbackHysteresis.verticalCenter
                    verticalCenterOffset: -7
                    left:tempFoldbackHysteresis.right
                    leftMargin: 10
                }
                //input: foldbackTemp.value.toFixed(0)
                //onApplied: platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
                //                                                             input,
                //                                                             platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power)
            }
    }



    }


}

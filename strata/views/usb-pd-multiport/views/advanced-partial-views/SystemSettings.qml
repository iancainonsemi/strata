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
import QtQuick.Controls 2.3
import "qrc:/views/usb-pd-multiport/sgwidgets"

Item {
    id: root
    height: 350
    width: parent.width
    anchors {
        left: parent.left
    }

    Item {
        id: leftColumn
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width/2

        Item {
            id: margins1
            anchors {
                fill: parent
                margins: 15
            }

            Text {
                id: powerManagement
                text: "<b>Power Management</b>"
                font {
                    pixelSize: 16
                }
            }

            Button{
                //a rectangle to cover the max power slider when it's disabled, so we can still show a
                //tooltip explaining *why* its disabled.
                id:toolTipMask
                //color:"transparent"
                //border.color:"red"
                hoverEnabled: true
                z:1
                visible:!maximumBoardPower.enabled
                background: Rectangle{
                    color:"transparent"
                }

                anchors {
                    top: powerManagement.bottom
                    topMargin: 15
                    left: margins1.left
                    leftMargin: 55
                    right: maximumBoardPowerUnits.left
                    rightMargin: 5
                    bottom:maximumBoardPower.bottom
                }

                ToolTip{
                    id:maxPowerToolTip
                    visible:toolTipMask.hovered
                    text:"System Power can not be changed when devices are connected"
                    delay:500
                    timeout:2000

                    background: Rectangle {
                        color: "#eee"
                        radius: 2
                    }
                }
            }

            SGSlider {

                property bool port1connected:false
                property bool port2connected:false
                property bool port3connected:false
                property bool port4connected:false
                property bool deviceConnected:false
                property var deviceIsConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceIsDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                onDeviceIsConnectedChanged: {

                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port1connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port2connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port3connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port4connected = true;
                        }
                    }

                    //console.log("updating connection", port1connected, port2connected, port3connected, port4connected)
                    deviceConnected = port1connected || port2connected || port3connected || port4connected;

                }

                onDeviceIsDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port1connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port2connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port3connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port4connected = false;
                        }
                    }
                    //console.log("updating connection", port1connected, port2connected, port3connected, port4connected)
                    deviceConnected = port1connected || port2connected || port3connected || port4connected;
                }

                property var currentMaxPower: platformInterface.maximum_board_power.watts

                id: maximumBoardPower
                label: "Maximum System Power:"
                enabled: !deviceConnected ? true : false  //slider enabled if nothing is plugged in
                anchors {
                    top: powerManagement.bottom
                    topMargin: 15
                    left: margins1.left
                    leftMargin: 55
                    right: maximumBoardPowerInput.left
                    rightMargin: 10
                }
                from: 30
                to: 200//platformInterface.ac_power_supply_connection.power
                startLabel: "30W"
                endLabel: "200W"//platformInterface.ac_power_supply_connection.power+"W"
                labelTopAligned: true
                value: currentMaxPower

                onMoved: {
                    //the control will be disabled if there are devices plugged in
                    platformInterface.set_maximum_board_power.update(value);
                }
            }

            SGSubmitInfoBox {
                id: maximumBoardPowerInput
                showButton: false
                infoBoxWidth: 35
                enabled: maximumBoardPower.enabled
                minimumValue: 30
                maximumValue: 200//platformInterface.ac_power_supply_connection.power
                anchors {
                    verticalCenter: maximumBoardPower.verticalCenter
                    verticalCenterOffset: -7
                    right: maximumBoardPowerUnits.left
                    rightMargin: 5
                }
                onApplied: {
                    platformInterface.set_maximum_board_power.update(maximumBoardPowerInput.intValue);
                    }
                value: Math.round(platformInterface.maximum_board_power.watts)
            }

            Text{
                id: maximumBoardPowerUnits
                text: "W"
                color: maximumBoardPower.enabled ? "black" : "grey"
                anchors {
                    right: parent.right
                    verticalCenter: maximumBoardPowerInput.verticalCenter
                }
            }

            Text{
                id: powerNegotiationTitleText
                text: "Power Negotiation:"
                anchors {
                    top: maximumBoardPower.bottom
                    topMargin: 10
                    left: margins1.left
                    leftMargin: 92
                }
            }

            Text{
                id: powerNegotiationText
                text: "First come, first served"
                color:"dimgray"
                anchors {
                    top: maximumBoardPower.bottom
                    topMargin: 10
                    left: powerNegotiationTitleText.right
                    leftMargin: 10
                }
            }


            Button{
                //a rectangle to cover the max power popup when it's disabled, so we can still show a
                //tooltip explaining *why* its disabled.
                id:toolTipAssuredPowerMask
                hoverEnabled: true
                z:1
                visible:!maximumBoardPower.enabled
                background: Rectangle{
                    color:"transparent"
                }

                anchors {
                    left: assuredPortSwitch.left
                    top: assuredPortSwitch.top
                    bottom:assuredPortSwitch.bottom
                    right: assuredPortSwitch.right
                }

                ToolTip{
                    id:assuredPowerToolTip
                    visible:toolTipAssuredPowerMask.hovered
                    text:"Assured Power can not be changed when devices are connected"
                    delay:500
                    timeout:2000

                    background: Rectangle {
                        color: "#eee"
                        radius: 2
                    }
                }
            }

            Text{
                id: assuredPortText
                text: "Assure Port 1 power:"
                anchors {
                    top: powerNegotiationText.bottom
                    topMargin:15
                    left: margins1.left
                    leftMargin: 82
                }
            }

            SGSwitch {
                property bool port1connected:false
                property bool port2connected:false
                property bool port3connected:false
                property bool port4connected:false
                property bool deviceConnected:false
                property var deviceIsConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceIsDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                onDeviceIsConnectedChanged: {

                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port1connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port2connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port3connected = true;
                        }
                    }
                    else if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            port4connected = true;
                        }
                    }

                    //console.log("updating connection", port1connected, port2connected, port3connected, port4connected)
                    deviceConnected = port1connected || port2connected || port3connected || port4connected;

                }

                onDeviceIsDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port1connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port2connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port3connected = false;
                        }
                    }
                    else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            port4connected = false;
                        }
                    }
                    //console.log("updating connection", port1connected, port2connected, port3connected, port4connected)
                    deviceConnected = port1connected || port2connected || port3connected || port4connected;
                }

                id: assuredPortSwitch
                enabled: !deviceConnected
                anchors {
                    left: assuredPortText.right
                    leftMargin: 10
                    verticalCenter: assuredPortText.verticalCenter
                }
                checkedLabel: "On"
                uncheckedLabel: "Off"
                switchHeight: 20
                switchWidth: 46

                checked: platformInterface.assured_power_port.enabled
                onToggled: platformInterface.set_assured_power_port.update(checked, 1)  //we're only allowing port 1 to be assured

            }

            Button{
                //a rectangle to cover the assured power switch when it's disabled, so we can still show a
                //tooltip explaining *why* its disabled.
                id:maxAssuredPowerPopupToolTipMask
                hoverEnabled: true
                z:1
                visible:(assuredPortSwitch.checked)
                background: Rectangle{
                    color:"transparent"
                }

                anchors {
                    left: assuredMaxPowerOutput.left
                    top: assuredMaxPowerOutput.top
                    bottom:assuredMaxPowerOutput.bottom
                    right: assuredMaxPowerOutput.right
                }

                ToolTip{
                    id:maxAssuredPowerPopupToolTip
                    visible:maxAssuredPowerPopupToolTipMask.hovered
                    text: "Disabled while Assured Port 1 Power is on"
                    delay:500
                    timeout:2000

                    background: Rectangle {
                        color: "#eee"
                        radius: 2
                    }
                }
            }

            SGComboBox {
                id: assuredMaxPowerOutput
                label: "Maximum Assured Power:"
                model: ["15","27", "36", "45","60","100"]
                comboBoxHeight: 25
                comboBoxWidth: 60
                enabled: (!assuredPortSwitch.checked && assuredPortSwitch.enabled)
                textColor: enabled ? "black" : "grey"
                anchors {

                    top: assuredPortText.top
                    topMargin: 30
                    left: margins1.left
                    leftMargin: 53
                }

                //when changing the value
                onActivated: {
                    console.log("setting max power to ",parseInt(assuredMaxPowerOutput.comboBox.currentText));
                    platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                }

                //notification of a change from elsewhere
                property var currentMaximumPower: platformInterface.usb_pd_maximum_power.commanded_max_power
                onCurrentMaximumPowerChanged: {
                    if (platformInterface.usb_pd_maximum_power.port === 1){
                        assuredMaxPowerOutput.currentIndex = assuredMaxPowerOutput.comboBox.find( parseInt (platformInterface.usb_pd_maximum_power.commanded_max_power))
                    }
                }

                property var maxPower: platformInterface.maximum_board_power.watts
                onMaxPowerChanged: {
                    var previousIndex = assuredMaxPowerOutput.currentIndex;
                    console.log("current index is",previousIndex);
                    //there are 24W held in reserve for other ports, so don't offer anything more than
                    //maxPower-24 for the assured power options
                    if (maxPower < 27 + 24){
                        model= ["15"];
                        assuredMaxPowerOutput.currentIndex = 0;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                    else if (maxPower < 36 + 24){
                        model=["15","27"];
                        if (previousIndex >1)
                            assuredMaxPowerOutput.currentIndex = 1;
                          else
                            assuredMaxPowerOutput.currentIndex = previousIndex;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                    else if (maxPower < 45 + 24){
                        model=["15","27","36"];
                        if (previousIndex >2)
                            assuredMaxPowerOutput.currentIndex = 2;
                        else
                          assuredMaxPowerOutput.currentIndex = previousIndex;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                    else if (maxPower < 60 + 24){
                        model= ["15","27","36","45"];
                        if (previousIndex >3)
                            assuredMaxPowerOutput.currentIndex = 3;
                        else
                          assuredMaxPowerOutput.currentIndex = previousIndex;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                    else if (maxPower < 100 + 24){
                        model =["15","27","36","45","60"];
                        if (previousIndex >4)
                            assuredMaxPowerOutput.currentIndex = 4;
                        else
                          assuredMaxPowerOutput.currentIndex = previousIndex;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                    else{
                        model = ["15","27", "36", "45","60","100"];
                        assuredMaxPowerOutput.currentIndex = previousIndex;
                        platformInterface.set_usb_pd_maximum_power.update(1,parseInt(assuredMaxPowerOutput.comboBox.currentText))
                    }
                }

            }

            Text{
                id: assuredMaxPowerUnits
                text: "W"
                color: assuredMaxPowerOutput.enabled ? "black" : "grey"
                anchors {
                    left: assuredMaxPowerOutput.right
                    leftMargin: 5
                    verticalCenter: assuredMaxPowerOutput.verticalCenter
                }
            }



            SGSegmentedButtonStrip {
                id: sleepMode
                label: "Sleep Mode:"
                activeTextColor: "white"
                textColor: "#666"
                radius: 4
                buttonHeight: 25
                visible:false
                anchors {
                    top: assuredMaxPowerOutput.bottom
                    topMargin: 10
                    left: margins1.left
                    leftMargin: 132
                }



                segmentedButtons: GridLayout {
                    columnSpacing: 2

                    property var sleepMode: platformInterface.sleep_mode.mode

                    onSleepModeChanged:{
                        if (platformInterface.sleep_mode.mode === "off"){
                            manualSleepModeButton.checked = true;
                            automaticSleepModeButton.checked = false;
                        }
                        else if (platformInterface.sleep_mode.mode === "automatic"){
                            manualSleepModeButton.checked = false;
                            automaticSleepModeButton.checked = true;
                        }
                    }

                    SGSegmentedButton{
                        id:manualSleepModeButton
                        text: qsTr("Off")
                        checked: true  // Sets default checked button when exclusive

                        onClicked: {
                            platformInterface.set_sleep_mode.update("off");
                        }
                    }

                    SGSegmentedButton{
                        id:automaticSleepModeButton
                        text: qsTr("Automatic")
                        onClicked: {
                            platformInterface.set_sleep_mode.update("automatic");
                        }
                    }
                }
            }


            Text {
                id: faultHeader
                text: "<b>Faults</b>"
                font {
                    pixelSize: 16
                }
                anchors.top: sleepMode.bottom
                anchors.topMargin: 10
            }

            SGSegmentedButtonStrip {
                id: faultProtection
                anchors {
                    top: faultHeader.bottom
                    topMargin: 10
                    left: margins1.left
                    leftMargin: 109
                }
                label: "Fault Protection:"
                textColor: "#666"
                activeTextColor: "white"
                radius: 4
                buttonHeight: 25

                segmentedButtons: GridLayout {
                    columnSpacing: 2

                    SGSegmentedButton{
                        text: qsTr("Retry")
                        checked: platformInterface.usb_pd_protection_action.action === "retry"

                        onClicked: {
                            platformInterface.set_protection_action.update("retry");
                        }
                    }

                    SGSegmentedButton{
                        text: qsTr("None")
                        checked: platformInterface.usb_pd_protection_action.action === "nothing"

                        onClicked: {
                            platformInterface.set_protection_action.update("nothing");
                        }
                    }
                }
            }



            SGSlider {
                id: tempFault
                label: "Fault when temperature above:"
                anchors {
                    left: parent.left
                    leftMargin:20
                    top: faultProtection.bottom
                    topMargin: 10
                    right: tempFaultInput.left
                    rightMargin: 10
                }
                from: 0
                to: 135
                startLabel: "0°C"
                endLabel: "135°C"
                labelTopAligned: true
                value: platformInterface.set_maximum_temperature_notification.maximum_temperature
                onMoved: {
                    platformInterface.set_maximum_temperature.update(value);
                }
            }

            SGSubmitInfoBox {
                id: tempFaultInput
                showButton: false
                infoBoxWidth: 35
                minimumValue: 0
                maximumValue: 135
                anchors {
                    verticalCenter: tempFault.verticalCenter
                    verticalCenterOffset: -7
                    right: tempFaultUnits.left
                    rightMargin: 5
                }
                value: Math.round(platformInterface.set_maximum_temperature_notification.maximum_temperature)
                onApplied:{
                    //console.log("temp fault value onApplied");
                    var currentValue = parseFloat(value)
                    platformInterface.set_maximum_temperature.update(currentValue); // slider will be updated via notification
                }
            }

            Text{
                id: tempFaultUnits
                text: "°C"
                anchors {
                    right: parent.right
                    verticalCenter: tempFaultInput.verticalCenter
                }
            }
        }

        SGLayoutDivider {
            position: "right"
        }
    }

    Item {
        id: rightColumn
        anchors {
            left: leftColumn.right
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }


       Item {
            id: margins2
            anchors {
                fill: parent
                margins: 15
            }

            Text {
                id: tempFoldback
                text: "<b>Temperature Foldback</b>"
                font {
                    pixelSize: 16
                }
                anchors {
                    top: margins2.top
                    topMargin: 0
                }
            }

            Text{
                id: temperatureFoldbackStatus
                text: "Active:"
                anchors {
                    top: tempFoldback.bottom
                    topMargin:15
                    left: margins2.left
                    leftMargin: 120
                }
            }

            SGSwitch {
                id: tempFoldbackSwitch
                anchors {
                    left: temperatureFoldbackStatus.right
                    leftMargin: 10
                    verticalCenter: temperatureFoldbackStatus.verticalCenter
                }
                checkedLabel: "On"
                uncheckedLabel: "Off"
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
                label: "Limit above:"
                anchors {
                    left: parent.left
                    leftMargin: 87
                    top: temperatureFoldbackStatus.bottom
                    topMargin: 10
                    right: foldbackTempInput.left
                    rightMargin: 10
                }
                from: 0
                to: 100
                startLabel: "0°C"
                endLabel: "100°C"
                labelTopAligned: true
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
                infoBoxWidth: 35
                anchors {
                    verticalCenter: foldbackTemp.verticalCenter
                    verticalCenterOffset: -7
                    right: foldbackTempUnits.left
                    rightMargin: 5
                }
                value: Math.round(platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature)
                onApplied: platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
                                                                             parseFloat(value),
                                                                             platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power)
            }

            Text{
                id: foldbackTempUnits
                text: "°C"
                anchors {
                    right: parent.right
                    verticalCenter: foldbackTempInput.verticalCenter
                }
            }

            SGComboBox {
                id: limitOutput2
                label: "Reduce output power to:"
                model: ["25", "45","75","90"]
                comboBoxHeight: 25
                comboBoxWidth: 60
                anchors {
                    left: parent.left
                    leftMargin: 10
                    top: foldbackTemp.bottom
                    topMargin: 10
                }
                //when the value is changed by the user
                onActivated: {
                    console.log("sending temp foldback update command from limitOutputComboBox");
                    platformInterface.set_temperature_foldback.update(platformInterface.foldback_temperature_limiting_event.temperature_foldback_enabled,
                                                                                 platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature,
                                                                                 limitOutput2.currentText)
                }

                property var currentFoldbackOuput: platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power

                onCurrentFoldbackOuputChanged: {
                    limitOutput2.currentIndex = limitOutput2.comboBox.find( parseInt (platformInterface.foldback_temperature_limiting_event.foldback_maximum_temperature_power))
                }
            }

            Text{
                id:percentLabel
                text:"%"
                anchors{
                    left:limitOutput2.right
                    leftMargin: 5
                    verticalCenter: limitOutput2.verticalCenter
                }
            }
        }
    }
}

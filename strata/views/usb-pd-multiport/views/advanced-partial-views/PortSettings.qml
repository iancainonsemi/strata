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

    property bool assuredPortPowerEnabled: true

    Item {
        id: controlMargins
        anchors {
            fill: parent
            margins: 15
        }

        Text{
            id: assuredPortText
            text: "Assure Port power:"
            anchors {
                top:parent.top
                topMargin: 30
                left: parent.left
                leftMargin: 45
            }
        }

        Button{
            //a rectangle to cover the assured power switch when it's disabled, so we can still show a
            //tooltip explaining *why* its disabled.
            id:toolTipMask
            hoverEnabled: true
            z:1
            visible:!assuredPortSwitch.enabled
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
                id:maxPowerToolTip
                visible:toolTipMask.hovered
                //text:"Port Power can not be changed when devices are connected"
                text:{
                    if (portNumber === 1){
                        return "Assured Port Power can not be changed when devices are connected"
                    }
                    else {
                        return "Assured Port Power can not be changed for this port"
                    }
                }
                delay:500
                timeout:2000

                background: Rectangle {
                    color: "#eee"
                    radius: 2
                }
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
            anchors {
                left: assuredPortText.right
                leftMargin: 10
                verticalCenter: assuredPortText.verticalCenter
            }
            enabled: assuredPortPowerEnabled && !deviceConnected
            checkedLabel: "On"
            uncheckedLabel: "Off"
            switchHeight: 20
            switchWidth: 46

            checked: platformInterface.assured_power_port.enabled && (portNumber === 1)
            onToggled: platformInterface.set_assured_power_port.update(checked, portNumber)  //we're only allowing port 1 to be assured            
        }


        Button{
            //a rectangle to cover the assured power switch when it's disabled, so we can still show a
            //tooltip explaining *why* its disabled.
            id:powerPopupToolTipMask
            hoverEnabled: true
            z:1
            visible:(assuredPortSwitch.checked && portNumber === 1)
            background: Rectangle{
                color:"transparent"
            }

            anchors {
                left: maxPowerOutput.left
                top: maxPowerOutput.top
                bottom:maxPowerOutput.bottom
                right: maxPowerOutput.right
            }

            ToolTip{
                id:powerPopupToolTip
                visible:powerPopupToolTipMask.hovered
                text: "Maximum Port Power can not be changed while Assured Port Power is active"
                delay:500
                timeout:2000

                background: Rectangle {
                    color: "#eee"
                    radius: 2
                }
            }
        }

        SGComboBox {
            id: maxPowerOutput

            property variant maxPowerOptions: ["15","27", "36", "45","60","100"]
            property var maxPower: platformInterface.usb_pd_maximum_power

            //limit the options for power usage to be less than the max power allocated for this port
            onMaxPowerChanged:{
                if (platformInterface.usb_pd_maximum_power.port === portNumber){
                    //console.log("got a new commanded max power for port",platformInterface.usb_pd_maximum_power.port)
                    maxPowerOutput.currentIndex = maxPowerOutput.comboBox.find( parseInt (platformInterface.usb_pd_maximum_power.commanded_max_power))
                    //console.log("commanded max power set to index",maxPowerOutput.currentIndex);
                }
            }


            label: "Maximum Power Output:"
            model: maxPowerOptions
            enabled:{
                if (portNumber === 1 && assuredPortSwitch.checked)
                    return false;
                else
                    return true
            }
            textColor: enabled ? "black" : "grey"
            comboBoxHeight: 25
            comboBoxWidth: 60
            anchors {
                left: parent.left
                leftMargin: 10
                top: assuredPortSwitch.bottom
                topMargin: 15
            }

            //when changing the value
            onActivated: {
                console.log("setting max power to ",parseInt(maxPowerOutput.comboBox.currentText));
                platformInterface.set_usb_pd_maximum_power.update(portNumber,parseInt(maxPowerOutput.comboBox.currentText))
            }

            //notification of a change from elsewhere
            //NB this info comes from the periodic power notification, not from the usb_pd_maximum_power notificaiton
//            property var currentMaximumPower: platformInterface.usb_pd_maximum_power.commanded_max_power
//            onCurrentMaximumPowerChanged: {
//                if (platformInterface.usb_pd_maximum_power.port === portNumber){
//                    console.log("got a new commanded max power for port",platformInterface.usb_pd_maximum_power.port)
//                    maxPowerOutput.currentIndex = maxPowerOutput.comboBox.find( parseInt (platformInterface.usb_pd_maximum_power.commanded_max_power))
//                    console.log("set port power to index",maxPowerOutput.currentIndex)
//                }

//            }
        }

        Text{
            id: maxPowerUnits
            text: "W"
            color: maxPowerOutput.enabled ? "black" : "grey"
            anchors {
                left: maxPowerOutput.right
                leftMargin: 5
                verticalCenter: maxPowerOutput.verticalCenter
            }
        }



        SGSlider {
            id: currentLimit
            label: "Current limit:"
            value: {
                if (platformInterface.output_current_exceeds_maximum.port === portNumber){
                    return platformInterface.output_current_exceeds_maximum.current_limit;
                }
                else{
                    return currentLimit.value;
                }

            }
            labelTopAligned: true
            startLabel: "1A"
            endLabel: "6A"
            from: 1
            to: 6
            stepSize: 1
            anchors {
                left: parent.left
                leftMargin: 80
                top: maxPowerOutput.bottom
                topMargin: 10
                right: currentLimitInput.left
                rightMargin: 10
            }

            onMoved: platformInterface.request_over_current_protection.update(portNumber, value)

        }

        SGSubmitInfoBox {
            id: currentLimitInput
            showButton: false
            infoBoxWidth: 35
            minimumValue: 1
            maximumValue: 6
            anchors {
                verticalCenter: currentLimit.verticalCenter
                verticalCenterOffset: -7
                right: currentLimitInputUnits.left
                rightMargin: 5
            }

            value:{
               if (platformInterface.output_current_exceeds_maximum.port === portNumber){
                   return platformInterface.output_current_exceeds_maximum.current_limit.toFixed(0)
                }
                else{
                   return currentLimit.value;
                 }
            }
            onApplied: platformInterface.request_over_current_protection.update(portNumber, intValue)

        }

        Text{
            id: currentLimitInputUnits
            text: "A"
            anchors {
                right: parent.right
                verticalCenter: currentLimitInput.verticalCenter
            }
        }



        Text {
            id: cableCompensation
            text: "Cable Compensation:"
            font {
                pixelSize: 13
            }
            anchors {
                top: currentLimit.bottom
                topMargin: 15
                left:parent.left
                leftMargin: 30
            }
        }



        SGSegmentedButtonStrip {
            id: cableCompensationButtonStrip
            anchors {
                left: cableCompensation.right
                leftMargin: 10
                verticalCenter: cableCompensation.verticalCenter
            }
            textColor: "#666"
            activeTextColor: "white"
            radius: 4
            buttonHeight: 25
            hoverEnabled: false

            property var cableLoss: platformInterface.get_cable_loss_compensation

            onCableLossChanged: {
                if (platformInterface.get_cable_loss_compensation.port === portNumber){
                    console.log("cable compensation for port ",portNumber,"set to",platformInterface.get_cable_loss_compensation.bias_voltage*1000)
                    if (platformInterface.get_cable_loss_compensation.bias_voltage === 0){
                        cableCompensationButtonStrip.buttonList[0].children[0].checked = true;
                    }
                    else if (platformInterface.get_cable_loss_compensation.bias_voltage * 1000 == 100){
                        console.log("setting cable compensation for port",portNumber,"to 100");
                        cableCompensationButtonStrip.buttonList[0].children[1].checked = true;
                    }
                    else if (platformInterface.get_cable_loss_compensation.bias_voltage * 1000 == 200){
                        cableCompensationButtonStrip.buttonList[0].children[2].checked = true;
                    }
                }
            }

            segmentedButtons: GridLayout {
                id:cableCompensationGridLayout
                columnSpacing: 2

                SGSegmentedButton{
                    id: cableCompensationSetting1
                    text: qsTr("Off")
                    checkable: true

                    onClicked:{
                        platformInterface.set_cable_compensation.update(portNumber,
                                               1,
                                               0);
                    }
                }

                SGSegmentedButton{
                    id: cableCompensationSetting2
                    text: qsTr("100 mv/A")
                    checkable: true

                    onClicked:{
                        platformInterface.set_cable_compensation.update(portNumber,
                                               1,
                                               100/1000);
                    }
                }

                SGSegmentedButton{
                    id:cableCompensationSetting3
                    text: qsTr("200 mv/A")
                    checkable: true

                    onClicked:{
                        platformInterface.set_cable_compensation.update(portNumber,
                                               1,
                                               200/1000);
                    }
                }
            }
        }





        Text {
            id: advertisedVoltages
            text: "Advertised Profiles:"
            font {
                pixelSize: 13
            }
            anchors {
                top: cableCompensation.bottom
                topMargin: 30
                left:parent.left
                leftMargin: 40
            }
        }

        SGSegmentedButtonStrip {
            id: faultProtectionButtonStrip
            anchors {
                left: advertisedVoltages.right
                leftMargin: 10
                verticalCenter: advertisedVoltages.verticalCenter
            }
            textColor: "#666"
            activeTextColor: "white"
            radius: 4
            buttonHeight: 25
            hoverEnabled: false

            property var sourceCapabilities: platformInterface.usb_pd_advertised_voltages_notification.settings

            onSourceCapabilitiesChanged:{


                //the strip's first child is the Grid layout. The children of that layout are the buttons in
                //question. This makes accessing the buttons a little bit cumbersome since they're loaded dynamically.
                if (platformInterface.usb_pd_advertised_voltages_notification.port === portNumber){

                    //console.log("updating advertised voltages for port ",portNumber)
                    //disable all the possibilities
                    faultProtectionButtonStrip.buttonList[0].children[6].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[5].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[4].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[3].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[2].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[1].enabled = false;
                    faultProtectionButtonStrip.buttonList[0].children[0].enabled = false;

                    var numberOfSettings = platformInterface.usb_pd_advertised_voltages_notification.number_of_settings;
                    if (numberOfSettings >= 7){
                        faultProtectionButtonStrip.buttonList[0].children[6].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[6].text = platformInterface.usb_pd_advertised_voltages_notification.settings[6].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[6].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[6].text += platformInterface.usb_pd_advertised_voltages_notification.settings[6].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[6].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[6].text = "NA";
                    }

                    if (numberOfSettings >= 6){
                        faultProtectionButtonStrip.buttonList[0].children[5].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[5].text = platformInterface.usb_pd_advertised_voltages_notification.settings[5].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[5].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[5].text += platformInterface.usb_pd_advertised_voltages_notification.settings[5].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[5].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[5].text = "NA";
                    }

                    if (numberOfSettings >= 5){
                        faultProtectionButtonStrip.buttonList[0].children[4].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[4].text = platformInterface.usb_pd_advertised_voltages_notification.settings[4].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[4].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[4].text += platformInterface.usb_pd_advertised_voltages_notification.settings[4].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[4].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[4].text = "NA";
                    }

                    if (numberOfSettings >= 4){
                        faultProtectionButtonStrip.buttonList[0].children[3].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[3].text = platformInterface.usb_pd_advertised_voltages_notification.settings[3].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[3].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[3].text += platformInterface.usb_pd_advertised_voltages_notification.settings[3].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[3].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[3].text = "NA";
                    }

                    if (numberOfSettings >= 3){
                        faultProtectionButtonStrip.buttonList[0].children[2].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[2].text = platformInterface.usb_pd_advertised_voltages_notification.settings[2].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[2].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[2].text += platformInterface.usb_pd_advertised_voltages_notification.settings[2].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[2].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[2].text = "NA";
                    }

                    if (numberOfSettings >= 2){
                        faultProtectionButtonStrip.buttonList[0].children[1].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[1].text = platformInterface.usb_pd_advertised_voltages_notification.settings[1].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[1].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[1].text += platformInterface.usb_pd_advertised_voltages_notification.settings[1].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[1].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[1].text = "NA";
                    }

                    if (numberOfSettings >= 1){
                        faultProtectionButtonStrip.buttonList[0].children[0].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[0].text = platformInterface.usb_pd_advertised_voltages_notification.settings[0].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[0].text += "V, ";
                        faultProtectionButtonStrip.buttonList[0].children[0].text += platformInterface.usb_pd_advertised_voltages_notification.settings[0].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[0].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[1].text = "NA";
                    }

                }
            }

            segmentedButtons: GridLayout {
                id:advertisedVoltageGridLayout
                columnSpacing: 2

                SGSegmentedButton{
                    id: setting1
                    //text: qsTr("5V, 3A")
                    checkable: false
                }

                SGSegmentedButton{
                    id: setting2
                    //text: qsTr("7V, 3A")
                    checkable: false
                }

                SGSegmentedButton{
                    id:setting3
                    //text: qsTr("8V, 3A")
                    checkable: false
                }

                SGSegmentedButton{
                    id:setting4
                    //text: qsTr("9V, 3A")
                    //enabled: false
                    checkable: false
                }

                SGSegmentedButton{
                    id:setting5
                    //text: qsTr("12V, 3A")
                    //enabled: false
                    checkable: false
                }

                SGSegmentedButton{
                    id:setting6
                    //text: qsTr("15V, 3A")
                    //enabled: false
                    checkable: false
                }

                SGSegmentedButton{
                    id:setting7
                    //text: qsTr("20V, 3A")
                    //enabled: false
                    checkable: false
                }
            }
        }
    }
}

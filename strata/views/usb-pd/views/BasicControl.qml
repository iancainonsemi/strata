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
import "qrc:/views/usb-pd/sgwidgets"
import "qrc:/views/usb-pd/views/basic-partial-views"

Item {
    id: root

    property bool debugLayout: false
    property real ratioCalc: root.width / 1200
    property real initialAspectRatio: 1200/820

    width: parent.width / parent.height > initialAspectRatio ? parent.height * initialAspectRatio : parent.width
    height: parent.width / parent.height < initialAspectRatio ? parent.width / initialAspectRatio : parent.height

    Image {
        id: name
        anchors {
            fill: root
        }
        source: "./images/basic-twoPortBackground.png"
    }

    Component.onCompleted: {
        console.log("finished loading Basic Controls for usb-pd")
    }

    GraphDrawer {
        id: graphDrawer
        z: 10
    }

    PlugAnimation {
        id: port1Animation
        x: 918 * ratioCalc
        y: 161 * ratioCalc
    }


    PlugAnimation {
        id: port2Animation
        x: 918 * ratioCalc
        y: 543 * ratioCalc
    }


    Item {
        id: inputColumn
        width: 310 * ratioCalc
        height: root.height
        anchors {
            left: root.left
            leftMargin: 230 * ratioCalc
        }

        Rectangle {
            id: combinedPortStats
            color: "#eee"
            anchors {
                top: inputColumn.top
                topMargin: 37 * ratioCalc
                left: inputColumn.left
                right: inputColumn.right
            }
            height: 299 * ratioCalc

            Rectangle{
                id:combinedStatsBackgroundRect
                color:"#ddd"
                anchors.top:combinedPortStats.top
                anchors.left:combinedPortStats.left
                anchors.right:combinedPortStats.right
                height:combinedPortStats.height/6

                Text{
                    id:combinedStatsText
                    text:"COMBINED PORT STATISTICS"
                    font.pixelSize: 17
                    color: "#bbb"
                    anchors.centerIn: combinedStatsBackgroundRect
                }
            }




            PortStatBox {
                property var inputVoltage:platformInterface.request_usb_power_notification.input_voltage;
                property real portVoltage: 0

                onInputVoltageChanged: {
                    portVoltage = platformInterface.request_usb_power_notification.input_voltage;
                }

                id:combinedInputVoltageBox
                label: "INPUT VOLTAGE"
                value: {
                    if (portVoltage != 0)
                        (inputVoltage).toFixed(2)
                      else
                        "0.00"
                }
                valueSize: 32
                icon: "../images/icon-voltage.svg"
                unit: "V"
                anchors.top: combinedStatsBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: combinedPortStats.horizontalCenter
                height: combinedPortStats.height/5
                width: combinedPortStats.width/2
            }

            PortStatBox {
                id:combinedInputPowerBox

                property real inputVoltage: platformInterface.request_usb_power_notification.input_voltage;
                property real inputCurrent: platformInterface.request_usb_power_notification.input_current;
                property real port1Power:0;
                property real port2Power:0;

                onInputCurrentChanged:{
                    //console.log("port",platformInterface.request_usb_power_notification.port,"input Current=",inputCurrent);
                    if (platformInterface.request_usb_power_notification.port === 1){
                        //console.log("input voltage=",inputVoltage,"input Current=",inputCurrent, "input Power=",inputPower);
                        combinedInputPowerBox.port1Power = combinedInputPowerBox.inputVoltage * combinedInputPowerBox.inputCurrent;
                    }
                    else if (platformInterface.request_usb_power_notification.port === 2){
                        combinedInputPowerBox.port2Power = combinedInputPowerBox.inputVoltage * combinedInputPowerBox.inputCurrent;
                    }
                    //console.log("port1Power=",combinedInputPowerBox.port1Power,"port2Power=",combinedInputPowerBox.port2Power);
                }

                property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                 onDeviceDisconnectedChanged:{

                     if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                         if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                             combinedInputPowerBox.port1Power = 0;
                         }
                     }
                     else if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                         if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                             combinedInputPowerBox.port2Power = 0;
                         }
                     }
                }

                label: "INPUT POWER"
                value: (combinedInputPowerBox.port1Power + combinedInputPowerBox.port2Power).toFixed(2)
                valueSize: 32
                icon: "../images/icon-voltage.svg"
                unit: "W"
                anchors.top: combinedInputVoltageBox.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: combinedPortStats.horizontalCenter
                height: combinedPortStats.height/5
                width: combinedPortStats.width/2
                //visible: combinedPortStats.inputPowerConnected
            }
        }

        Rectangle {
            id: inputConversionStats
            color: combinedPortStats.color
            anchors {
                top: combinedPortStats.bottom
                topMargin: 20 * ratioCalc
                left: inputColumn.left
                right: inputColumn.right
            }
            height: 428 * ratioCalc

            property bool inputPowerConnected: true

            Rectangle{
                id:topBackgroundRect
                color:"#ddd"
                anchors.top:inputConversionStats.top
                anchors.left:inputConversionStats.left
                anchors.right:inputConversionStats.right
                height:inputConversionStats.height/6
            }

            Text{
                id:powerConverterText
                text:"SYSTEM POWER"
                font.pixelSize: 17
                color: "#bbb"
                anchors.top: inputConversionStats.top
                anchors.topMargin:10
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }

            Text{
                id:converterNameText
                text:"ON Semiconductor NCP4060A"
                visible: false //inputConversionStats.inputPowerConnected
                font.pixelSize: 20
                //color: "#bbb"
                anchors.top: powerConverterText.bottom
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }

            PortStatBox {
                id:maxPowerBox
                label: "MAX CAPACITY"
                value: "200"
                icon: "../images/icon-max.svg"
                //portColor: root.portColor
                valueSize: 64
                unit: "W"
                anchors.top: topBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
                height: inputConversionStats.height/4
                width: 2*inputConversionStats.width/3
                visible: inputConversionStats.inputPowerConnected
            }

            PortStatBox {
                id:voltageOutBox
                label: "VOLTAGE OUTPUT"
                value: "100"
                icon: "../images/icon-voltage.svg"
                //portColor: root.portColor
                valueSize: 32
                unit: "V"
                anchors.top: maxPowerBox.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
                height: inputConversionStats.height/8
                width: inputConversionStats.width/2
                visible: false//inputConversionStats.inputPowerConnected
            }

            Image{
                id:powerConverterIcon
                source:"./images/powerconverter.png"
                opacity:.5
                fillMode:Image.PreserveAspectFit
                anchors.top:voltageOutBox.bottom
                anchors.topMargin:40
                anchors.bottom:inputConversionStats.bottom
                anchors.bottomMargin:40
                anchors.left:inputConversionStats.left
                anchors.right: inputConversionStats.right
            }



        }

        SGLayoutDebug {
            visible: debugLayout
        }
    }

    Item {
        id: portColumn
        width: 330 * ratioCalc
        height: root.height
        anchors {
            left: inputColumn.right
            leftMargin: 20 * ratioCalc
        }

        PortInfo {
            id: portInfo1
            height: 364 * ratioCalc
            anchors {
                top: portColumn.top
                topMargin: 37 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portConnected: false
            portNumber: 1
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo1.advertisedVoltage;
                }
            }
            pdContract:{
                if (platformInterface.request_usb_power_notification.port === 1){
                   return (platformInterface.request_usb_power_notification.negotiated_current * platformInterface.request_usb_power_notification.negotiated_voltage);
                }
                else{
                    return portInfo1.pdContract;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return (platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current).toFixed(2);
                }
                else{
                    return portInfo1.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
                }
                else{
                    return portInfo1.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2);
                }
                else{
                    return portInfo1.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return (platformInterface.request_usb_power_notification.temperature).toFixed(1);
                }
                else{
                    return portInfo1.portTemperature;
                }
            }
//            efficency: {
//                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
//                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

//                if (platformInterface.request_usb_power_notification.port === 1){
//                    if (theInputPower == 0){    //division by 0 would normally give "nan"
//                        return "—"
//                    }
//                    else{
//                        return "—"
//                        //return Math.round((theOutputPower/theInputPower) * 100)/100
//                    }
//                }
//                else{
//                    return portInfo1.efficency;
//                }
//            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo1.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo1.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        PortInfo {
            id: portInfo2
            height: portInfo1.height
            anchors {
                top: portInfo1.bottom
                topMargin: 19 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 2
            portConnected: false
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo2.advertisedVoltage;
                }
            }
            pdContract:{
                if (platformInterface.request_usb_power_notification.port === 2){
                   return (platformInterface.request_usb_power_notification.negotiated_current * platformInterface.request_usb_power_notification.negotiated_voltage);
                }
                else{
                    return portInfo2.pdContract;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return (platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current).toFixed(2);
                }
                else{
                    return portInfo2.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
                }
                else{
                    return portInfo2.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2);
                }
                else{
                    return portInfo2.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return (platformInterface.request_usb_power_notification.temperature).toFixed(1);
                }
                else{
                    return portInfo2.portTemperature;
                }
            }
//            efficency: {
//                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
//                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current

//                if (platformInterface.request_usb_power_notification.port === 2){
//                    if (theInputPower == 0){    //division by 0 would normally give "nan"
//                        return "—"
//                    }
//                    else{
//                        return "—"
//                        //return Math.round((theOutputPower/theInputPower) *100)/100
//                    }
//                }
//                else{
//                    return portInfo2.efficency
//                }
//            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo2.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo2.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }


    }

    Item {
        id: deviceColumn
        width: 280 * ratioCalc
        height: root.height
        anchors {
            left: portColumn.right
            leftMargin: 160 * ratioCalc
        }

        Column {
            anchors {
                top: deviceColumn.top
                topMargin: 35 * ratioCalc
                right: deviceColumn.right
            }

            width: parent.width - (100 * ratioCalc)
            spacing: 20 * ratioCalc

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port1Animation.source = "images/USBCAnim.gif"
                                 port1Animation.currentFrame = 0
                                 port1Animation.playing = true
                                 port1Animation.pluggedIn = !port1Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port1Animation.source = "images/USBCAnimReverse.gif"
                                 port1Animation.currentFrame = 0
                                 port1Animation.playing = true
                                 port1Animation.pluggedIn = !port1Animation.pluggedIn
                             }
                         }
                    }

//                    onClicked: {
//                        if (!port1Animation.pluggedIn) {
//                            port1Animation.source = "images/cord.gif"
//                            port1Animation.currentFrame = 0
//                            port1Animation.playing = true
//                            port1Animation.pluggedIn = !port1Animation.pluggedIn
//                        } else {
//                            port1Animation.source = "images/cordReverse.gif"
//                            port1Animation.currentFrame = 0
//                            port1Animation.playing = true
//                            port1Animation.pluggedIn = !port1Animation.pluggedIn
//                        }
//                    }
                }
            }

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port2Animation.source = "images/USBCAnim.gif"
                                 port2Animation.currentFrame = 0
                                 port2Animation.playing = true
                                 port2Animation.pluggedIn = !port2Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                          //           "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port2Animation.source = "images/USBCAnimReverse.gif"
                                 port2Animation.currentFrame = 0
                                 port2Animation.playing = true
                                 port2Animation.pluggedIn = !port2Animation.pluggedIn
                             }
                         }
                    }
//                    onClicked: {
//                        if (!port2Animation.pluggedIn) {
//                            port2Animation.source = "images/cord.gif"
//                            port2Animation.currentFrame = 0
//                            port2Animation.playing = true
//                            port2Animation.pluggedIn = !port2Animation.pluggedIn
//                        } else {
//                            port2Animation.source = "images/cordReverse.gif"
//                            port2Animation.currentFrame = 0
//                            port2Animation.playing = true
//                            port2Animation.pluggedIn = !port2Animation.pluggedIn
//                        }
//                    }
                }
            }
}

    }
}

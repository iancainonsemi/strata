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
import "qrc:/views/usb-pd-multiport/sgwidgets"
import "qrc:/views/usb-pd-multiport/views/basic-partial-views"

Item {
    id: root

    property bool debugLayout: false
    property real ratioCalc: root.width / 1200
    property real initialAspectRatio: 1200/820

    width: parent.width / parent.height > initialAspectRatio ? parent.height * initialAspectRatio : parent.width
    height: parent.width / parent.height < initialAspectRatio ? parent.width / initialAspectRatio : parent.height

    Rectangle{
        color:"white"
        anchors {
            fill: root
        }
    }

    Image {
        id: name
        anchors {
            fill: root
        }
        source: "images/basic-background.png"
    }

    GraphDrawer {
        id: graphDrawer
        z: 10
    }

    PlugAnimation {
        id: port1Animation
        x: 917 * ratioCalc
        y: 63 * ratioCalc
    }

    PlugAnimation {
        id: port2Animation
        x: 917 * ratioCalc
        y: 255 * ratioCalc
    }

    PlugAnimation {
        id: port3Animation
        x: 917 * ratioCalc
        y: 447 * ratioCalc
    }

    PlugAnimation {
        id: port4Animation
        x: 917 * ratioCalc
        y: 639 * ratioCalc
    }

    Item {
        id: inputColumn
        width: 310 * ratioCalc
        height: root.height
        anchors {
            left: root.left
            //leftMargin: 80 * ratioCalc
            leftMargin: 230 * ratioCalc
        }

        Rectangle {
            id: combinedPortStats
            color: "#eee"
            anchors {
                top: inputColumn.top
                topMargin: 35 * ratioCalc
                left: inputColumn.left
                right: inputColumn.right
            }
            height: 300 * ratioCalc

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
                property real portVoltage : 0

                onInputVoltageChanged: {
                    portVoltage = platformInterface.request_usb_power_notification.input_voltage;
                }

                id:combinedInputVoltageBox
                label: "INPUT VOLTAGE"
                value: {
                    if (portVoltage != 0)
                        (portVoltage).toFixed(2)
                      else
                        "0.00"
                }
                valueSize: 24
                icon: "../images/icon-voltage.svg"
                unit: "V"
                anchors.top: combinedStatsBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: combinedPortStats.horizontalCenter
                height: combinedPortStats.height/5
                width: combinedPortStats.width/2
            }

            PortStatBox {

                property var inputVoltage: platformInterface.request_usb_power_notification.input_voltage;
                property var inputCurrent: platformInterface.request_usb_power_notification.input_current;
                property real inputPower: (inputVoltage * inputCurrent)+2;  //PTJ-1321 adding 2 watts compensation

                property real port1Power:0;
                property real port2Power:0;
                property real port3Power:0;
                property real port4Power:0;
                property real combinedPortPower: 0

                onInputPowerChanged: {
                    if (platformInterface.request_usb_power_notification.port ===1 &&
                        platformInterface.request_usb_power_notification.device !== "none")
                        port1Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===2 &&
                             platformInterface.request_usb_power_notification.device !== "none")
                        port2Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===3 &&
                             platformInterface.request_usb_power_notification.device !== "none")
                        port3Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===4 &&
                             platformInterface.request_usb_power_notification.device !== "none")
                        port4Power = inputPower;

                    //clear the last power value for the port if the port has just been disconnected
                    if (platformInterface.request_usb_power_notification.port ===1 &&
                        platformInterface.request_usb_power_notification.device === "none")
                        port1Power = 0;
                    else if (platformInterface.request_usb_power_notification.port ===2 &&
                             platformInterface.request_usb_power_notification.device === "none")
                        port2Power = 0;
                    else if (platformInterface.request_usb_power_notification.port ===3 &&
                             platformInterface.request_usb_power_notification.device === "none")
                        port3Power = 0;
                    else if (platformInterface.request_usb_power_notification.port ===4 &&
                             platformInterface.request_usb_power_notification.device === "none")
                        port4Power = 0;

                    combinedPortPower = port1Power + port2Power + port3Power + port4Power;
                }

                id:combinedInputPowerBox
                label: "INPUT POWER"
                value: (combinedPortPower).toFixed(2);
                valueSize: 24
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

            property bool inputPowerConnected:  platformInterface.ac_power_supply_connection.state === "connected"
            visible: inputPowerConnected

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
                text:"POWER CONVERTER"
                font.pixelSize: 17
                color: "#bbb"
                anchors.top: inputConversionStats.top
                anchors.topMargin:10
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }

            Text{
                id:converterNameText
                text:"200W LLC w/ PFC"
                visible: inputConversionStats.inputPowerConnected
                font.pixelSize: 20
                //color: "#bbb"
                anchors.top: powerConverterText.bottom
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }



            PortStatBox {
                id:voltageOutBox
                label: "VOLTAGE OUTPUT"
                value: "24"
                icon: "../images/icon-voltage.svg"
                //portColor: root.portColor
                valueSize: 24
                unit: "V"
                anchors.top: topBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter

                height: inputConversionStats.height/8
                width: inputConversionStats.width/2
                visible: inputConversionStats.inputPowerConnected
            }

            PortStatBox {
                id:maxPowerBox
                label: "MAX CAPACITY"
                value: "200"
                icon: "../images/icon-max.svg"
                //portColor: root.portColor
                valueSize: 24
                unit: "W"
                anchors.top: voltageOutBox.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
                height: inputConversionStats.height/8
                width: inputConversionStats.width/2
                visible: inputConversionStats.inputPowerConnected
            }

            Image{
                id:powerConverterIcon
                source:"./images/powerconverter.png"
                opacity:.5
                fillMode:Image.PreserveAspectFit
                anchors.top:maxPowerBox.bottom

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
            height: 172 * ratioCalc
            anchors {
                top: portColumn.top
                topMargin: 35 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portConnected: false
            portNumber: 1

            property int theRunningTotal: 0
            property int theEfficiencyCount: 0
            property int theEfficiencyAverage: 0

            property var periodicValues: platformInterface.request_usb_power_notification

            onPeriodicValuesChanged: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === 1){
                    //sum eight values of the efficency and average before displaying
                    var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    portInfo1.theRunningTotal += theEfficiency;
                    //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                    portInfo1.theEfficiencyCount++;

                    if (portInfo1.theEfficiencyCount == 8){
                        portInfo1.theEfficiencyAverage = portInfo1.theRunningTotal/8;
                        portInfo1.theEfficiencyCount = 0;
                        portInfo1.theRunningTotal = 0
                    }
                }

            }

            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo1.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                    var current = platformInterface.request_usb_power_notification.negotiated_current;
                    return Math.round(voltage*current *100)/100;
                }
                else if (!portInfo1.portConnected){
                    return "—"  //show a dash on disconnect, so cached value won't show on connect
                }
                else{
                    return portInfo1.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2); //PTJ-1321 adding 2 watts compensation
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
                    return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2)
                }
                else{
                    return portInfo1.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return (platformInterface.request_usb_power_notification.temperature).toFixed(1)
                }
                else{
                    return portInfo1.portTemperature;
                }
            }
            efficency: theEfficiencyAverage

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
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 2
            portConnected: false

            property int theRunningTotal: 0
            property int theEfficiencyCount: 0
            property int theEfficiencyAverage: 0

            property var periodicValues: platformInterface.request_usb_power_notification

            onPeriodicValuesChanged: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === 2){
                    //sum eight values of the efficency and average before displaying
                    var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    portInfo2.theRunningTotal += theEfficiency;
                    //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                    portInfo2.theEfficiencyCount++;

                    if (portInfo2.theEfficiencyCount == 8){
                        portInfo2.theEfficiencyAverage = portInfo2.theRunningTotal/8;
                        portInfo2.theEfficiencyCount = 0;
                        portInfo2.theRunningTotal = 0
                    }
                }

            }

            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo2.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                    var current = platformInterface.request_usb_power_notification.negotiated_current;
                    return Math.round(voltage*current *100)/100;
                }
                else if (!portInfo2.portConnected){
                    return "—"  //show a dash on disconnect, so cached value won't show on connect
                }
                else{
                    return portInfo2.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2);//PTJ-1321 adding 2 watts compensation
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
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                    return portInfo2.portTemperature;
                }
            }
            efficency: theEfficiencyAverage

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

        PortInfo {
            id: portInfo3
            height: portInfo1.height
            anchors {
                top: portInfo2.bottom
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 3
            portConnected: false

            property int theRunningTotal: 0
            property int theEfficiencyCount: 0
            property int theEfficiencyAverage: 0

            property var periodicValues: platformInterface.request_usb_power_notification

            onPeriodicValuesChanged: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === 3){
                    //sum eight values of the efficency and average before displaying
                    var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    portInfo3.theRunningTotal += theEfficiency;
                    //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                    portInfo3.theEfficiencyCount++;

                    if (portInfo3.theEfficiencyCount == 8){
                        portInfo3.theEfficiencyAverage = portInfo3.theRunningTotal/8;
                        portInfo3.theEfficiencyCount = 0;
                        portInfo3.theRunningTotal = 0
                    }
                }

            }
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo3.advertisedVoltage;
                }
                }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                    var current = platformInterface.request_usb_power_notification.negotiated_current;
                    return Math.round(voltage*current *100)/100;
                }
                else if (!portInfo3.portConnected){
                    return "—"  //show a dash on disconnect, so cached value won't show on connect
                }
                else{
                    return portInfo3.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2);//PTJ-1321 adding 2 watts compensation
                }
                else{
                    return portInfo3.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
                }
                else{
                    return portInfo3.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2);
                }
                else{
                    return portInfo3.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                    return portInfo3.portTemperature;
                }
            }
            efficency: theEfficiencyAverage

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo3.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo3.portConnected = false;
                     }
                 }
            }
            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        PortInfo {
            id: portInfo4
            height: portInfo1.height
            anchors {
                top: portInfo3.bottom
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 4
            portConnected: false

            property int theRunningTotal: 0
            property int theEfficiencyCount: 0
            property int theEfficiencyAverage: 0

            property var periodicValues: platformInterface.request_usb_power_notification

            onPeriodicValuesChanged: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === 4){
                    //sum eight values of the efficency and average before displaying
                    var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    portInfo4.theRunningTotal += theEfficiency;
                    //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                    portInfo4.theEfficiencyCount++;

                    if (portInfo4.theEfficiencyCount == 8){
                        portInfo4.theEfficiencyAverage = portInfo4.theRunningTotal/8;
                        portInfo4.theEfficiencyCount = 0;
                        portInfo4.theRunningTotal = 0
                    }
                }

            }

            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return platformInterface.request_usb_power_notification.negotiated_voltage;
                }
                else{
                   return portInfo4.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                    var current = platformInterface.request_usb_power_notification.negotiated_current;
                    return Math.round(voltage*current *100)/100;
                }
                else if (!portInfo4.portConnected){
                    return "—"  //show a dash on disconnect, so cached value won't show on connect
                }
                else{
                    return portInfo4.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2); //PTJ-1321 adding 2 watts compensation
                }
                else{
                   return portInfo4.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
                }
                else{
                   return portInfo4.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2);
                }
                else{
                   return portInfo4.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                   return portInfo4.portTemperature;
                }
            }
            efficency: theEfficiencyAverage

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo4.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo4.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        SGLayoutDebug {
            visible: debugLayout
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

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port3Animation.source = "images/USBCAnim.gif"
                                 port3Animation.currentFrame = 0
                                 port3Animation.playing = true
                                 port3Animation.pluggedIn = !port3Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                          //           "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port3Animation.source = "images/USBCAnimReverse.gif"
                                 port3Animation.currentFrame = 0
                                 port3Animation.playing = true
                                 port3Animation.pluggedIn = !port3Animation.pluggedIn
                             }
                         }
                    }
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

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port4Animation.source = "images/USBCAnim.gif"
                                 port4Animation.currentFrame = 0
                                 port4Animation.playing = true
                                 port4Animation.pluggedIn = !port4Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                         //            "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port4Animation.source = "images/USBCAnimReverse.gif"
                                 port4Animation.currentFrame = 0
                                 port4Animation.playing = true
                                 port4Animation.pluggedIn = !port4Animation.pluggedIn
                             }
                         }
                    }
                }
            }
        }

        SGLayoutDebug {
            visible: debugLayout
        }
    }
}

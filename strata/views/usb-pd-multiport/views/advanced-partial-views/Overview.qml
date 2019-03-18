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
import "qrc:/views/usb-pd-multiport/sgwidgets"

Item {
    id: root
    width: parent.width

    Item{
        id: leftColumn
        anchors {
            left: root.left
            top: root.top
            right: rightColumn.left
            bottom: root.bottom
        }

        Item {
            id: margins
            anchors {
                fill: parent
                margins: 15
            }

            SGCapacityBar {
                id: capacityBar
                width: margins.width
                labelLeft: false
                barWidth: margins.width
                maximumValue: 200//platformInterface.ac_power_supply_connection.power
                //showThreshold: true
                //thresholdValue: (.9 * platformInterface.ac_power_supply_connection.power)

                gaugeElements: Row {
                    id: container
                    property real totalValue: childrenRect.width // Necessary for over threshold detection signal

                    SGCapacityBarElement{
                        id: port1BarElement
                        color: Qt.lighter(miniInfo1.portColor)
                        value: {
                            if (platformInterface.request_usb_power_notification.port === 1){
                                if (platformInterface.request_usb_power_notification.device !== "none")
                                    return (platformInterface.request_usb_power_notification.negotiated_voltage * platformInterface.request_usb_power_notification.negotiated_current)
                                  else
                                    return 0
                            }
                            else{
                               return port1BarElement.value;
                            }
                        }
                        secondaryValue:{
                            if (platformInterface.request_usb_power_notification.port === 1){
                                if (platformInterface.request_usb_power_notification.device !== "none"){
                                    return (platformInterface.request_usb_power_notification.output_voltage *
                                            platformInterface.request_usb_power_notification.output_current)
                                }
                                else{
                                    return 0
                                }
                            }
                            else{
                                return port1BarElement.secondaryValue;
                            }
                        }
                    }

                    SGCapacityBarElement{
                        id: port2BarElement
                        color: miniInfo2.portColor
                        value: {
                            if (platformInterface.request_usb_power_notification.port === 2){
                                //console.log("port two max power =",platformInterface.request_usb_power_notification.maximum_power)
                                if (platformInterface.request_usb_power_notification.device !== "none")
                                    return (platformInterface.request_usb_power_notification.negotiated_voltage * platformInterface.request_usb_power_notification.negotiated_current)
                                  else
                                    return 0
                            }
                            else{
                               return port2BarElement.value;
                            }
                        }
                        secondaryValue:{
                            if (platformInterface.request_usb_power_notification.port === 2){
                                if (platformInterface.request_usb_power_notification.device !== "none"){
                                    return (platformInterface.request_usb_power_notification.output_voltage *
                                            platformInterface.request_usb_power_notification.output_current)
                                }
                                else{
                                    return 0
                                }
                            }
                            else{
                                return port2BarElement.secondaryValue;
                            }
                        }
                    }

                    SGCapacityBarElement{
                        id: port3BarElement
                        color: miniInfo3.portColor
                        value: {
                            if (platformInterface.request_usb_power_notification.port === 3){
                                if (platformInterface.request_usb_power_notification.device !== "none")
                                    return (platformInterface.request_usb_power_notification.negotiated_voltage * platformInterface.request_usb_power_notification.negotiated_current)
                                  else
                                    return 0
                            }
                            else{
                               return port3BarElement.value;
                            }
                        }
                        secondaryValue:{
                            if (platformInterface.request_usb_power_notification.port === 3){
                                if (platformInterface.request_usb_power_notification.device !== "none"){
                                    return (platformInterface.request_usb_power_notification.output_voltage *
                                            platformInterface.request_usb_power_notification.output_current)
                                }
                                else{
                                    return 0
                                }
                            }
                            else{
                                return port3BarElement.secondaryValue;
                            }
                        }
                    }

                    SGCapacityBarElement{
                        id: port4BarElement
                        color: miniInfo4.portColor
                        value: {
                            if (platformInterface.request_usb_power_notification.port === 4){
                                if (platformInterface.request_usb_power_notification.device !== "none")
                                    return (platformInterface.request_usb_power_notification.negotiated_voltage * platformInterface.request_usb_power_notification.negotiated_current)
                                  else
                                    return 0
                            }
                            else{
                               return port4BarElement.value;
                            }
                        }
                        secondaryValue:{
                            if (platformInterface.request_usb_power_notification.port === 4){
                                if (platformInterface.request_usb_power_notification.device !== "none"){
                                    return (platformInterface.request_usb_power_notification.output_voltage *
                                            platformInterface.request_usb_power_notification.output_current)
                                }
                                else{
                                    return 0
                                }
                            }
                            else{
                                return port4BarElement.secondaryValue;
                            }
                        }
                    }
                }
            }

            PortInfoMini {
                id: miniInfo1
                portNum: 1
                anchors {
                    top: capacityBar.bottom
                    topMargin: 10
                    left: margins.left
                    bottom: margins.bottom
                }
                width: margins.width / 4 - 15
                portColor: "#4eafe0"

                property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state
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
                        miniInfo1.theRunningTotal += theEfficiency;
                        //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                        miniInfo1.theEfficiencyCount++;

                        if (miniInfo1.theEfficiencyCount == 8){
                            miniInfo1.theEfficiencyAverage = miniInfo1.theRunningTotal/8;
                            miniInfo1.theEfficiencyCount = 0;
                            miniInfo1.theRunningTotal = 0

                            //console.log("publishing new efficency",miniInfo1.theEfficiencyAverage);
                            //return miniInfo1.theEfficiencyAverage
                        }
                    }

                }

                onDeviceConnectedChanged: {
                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            miniInfo1.portConnected = true;
                        }
                    }
                }

                onDeviceDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            miniInfo1.portConnected = false;
                        }

                    }
                }

                negotiatedVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 1){
                        return platformInterface.request_usb_power_notification.negotiated_voltage
                    }
                    else{
                        return miniInfo1.negotiatedVoltage;
                    }
                }
                maxPower:{
                    if (platformInterface.request_usb_power_notification.port === 1){
                        var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                        var current = platformInterface.request_usb_power_notification.negotiated_current;
                        return Math.round(voltage*current *100)/100;
                    }
                    else if (!miniInfo1.portConnected){
                       return "—"  //show a dash on disconnect, so cached value won't show on connect
                     }
                    else{
                        return miniInfo1.maxPower;
                    }
                }
                inputPower: {
                    if (platformInterface.request_usb_power_notification.port === 1){
                        return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2); //PTJ-1321 adding 2 watts compensation
                    }
                    else{
                        return miniInfo1.inputPower;
                    }
                }
                outputVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 1){
                        return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2)
                    }
                    else{
                        return miniInfo1.outputVoltage;
                    }
                }
                portTemperature:{
                    if (platformInterface.request_usb_power_notification.port === 1){
                        return (platformInterface.request_usb_power_notification.temperature).toFixed(1);
                    }
                    else{
                        return miniInfo1.portTemperature;
                    }
                }
                outputPower: {
                    if (platformInterface.request_usb_power_notification.port === 1){
                        return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2)
                    }
                    else{
                        return miniInfo1.outputPower;
                    }
                }
                portEfficency: {
                    return theEfficiencyAverage;
                }

            }

            PortInfoMini {
                id: miniInfo2
                portNum: 2
                anchors {
                    top: capacityBar.bottom
                    topMargin: 10
                    left: miniInfo1.right
                    leftMargin: 20
                    bottom: margins.bottom
                }
                width: margins.width / 4 - 15
                portColor: "#69db67"

                property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state
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
                        miniInfo2.theRunningTotal += theEfficiency;
                        //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                        miniInfo2.theEfficiencyCount++;

                        if (miniInfo2.theEfficiencyCount == 8){
                            miniInfo2.theEfficiencyAverage = miniInfo2.theRunningTotal/8;
                            miniInfo2.theEfficiencyCount = 0;
                            miniInfo2.theRunningTotal = 0
                        }
                    }

                }

                onDeviceConnectedChanged: {
                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            miniInfo2.portConnected = true;
                        }
                    }
                }

                onDeviceDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            miniInfo2.portConnected = false;
                        }

                    }
                }

                negotiatedVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 2){
                        return platformInterface.request_usb_power_notification.negotiated_voltage
                    }
                    else{
                        return miniInfo2.negotiatedVoltage;
                    }
                }
                maxPower:{
                    if (platformInterface.request_usb_power_notification.port === 2){
                        var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                        var current = platformInterface.request_usb_power_notification.negotiated_current;
                        return Math.round(voltage*current *100)/100;
                    }
                    else if (!miniInfo2.portConnected){
                       return "—"  //show a dash on disconnect, so cached value won't show on connect
                     }
                    else{
                        return miniInfo2.maxPower;
                    }
                }
                inputPower: {
                    if (platformInterface.request_usb_power_notification.port === 2){
                        return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2); //PTJ-1321 adding 2 watts compensation
                    }
                    else{
                        return miniInfo2.inputPower;
                    }
                }
                outputVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 2){
                        return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2)
                    }
                    else{
                        return miniInfo2.outputVoltage;
                    }
                }
                portTemperature:{
                    if (platformInterface.request_usb_power_notification.port === 2){
                        return Math.round(platformInterface.request_usb_power_notification.temperature * 10)/10;
                    }
                    else{
                        return miniInfo2.portTemperature;
                    }
                }
                outputPower: {
                    if (platformInterface.request_usb_power_notification.port === 2){
                        return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2)
                    }
                    else{
                        return miniInfo2.outputPower;
                    }
                }
                portEfficency: theEfficiencyAverage
            }

            PortInfoMini {
                id: miniInfo3
                portNum: 3
                anchors {
                    top: capacityBar.bottom
                    topMargin: 10
                    left: miniInfo2.right
                    leftMargin: 20
                    bottom: margins.bottom
                }
                width: margins.width / 4 - 15
                portColor: "#e09a69"

                property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state
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
                        miniInfo3.theRunningTotal += theEfficiency;
                        miniInfo3.theEfficiencyCount++;

                        if (miniInfo3.theEfficiencyCount == 8){
                            miniInfo3.theEfficiencyAverage = miniInfo3.theRunningTotal/8;
                            miniInfo3.theEfficiencyCount = 0;
                            miniInfo3.theRunningTotal = 0
                        }
                    }

                }

                onDeviceConnectedChanged: {
                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            miniInfo3.portConnected = true;
                        }
                    }
                }

                onDeviceDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            miniInfo3.portConnected = false;
                        }

                    }
                }

                negotiatedVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 3){
                        return platformInterface.request_usb_power_notification.negotiated_voltage
                    }
                    else{
                        return miniInfo3.negotiatedVoltage;
                    }
                }
                maxPower:{
                    if (platformInterface.request_usb_power_notification.port === 3){
                        var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                        var current = platformInterface.request_usb_power_notification.negotiated_current;
                        return Math.round(voltage*current *100)/100;
                    }
                    else if (!miniInfo3.portConnected){
                       return "—"  //show a dash on disconnect, so cached value won't show on connect
                     }
                    else{
                        return miniInfo3.maxPower;
                    }
                }
                inputPower: {
                    if (platformInterface.request_usb_power_notification.port === 3){
                        return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2)  //PTJ-1321 adding 2 watts compensation
                    }
                    else{
                        return miniInfo3.inputPower;
                    }
                }
                outputVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 3){
                        return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2)
                    }
                    else{
                        return miniInfo3.outputVoltage;
                    }
                }
                portTemperature:{
                    if (platformInterface.request_usb_power_notification.port === 3){
                        return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                    }
                    else{
                        return miniInfo3.portTemperature;
                    }
                }
                outputPower: {
                    if (platformInterface.request_usb_power_notification.port === 3){
                        return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2)
                    }
                    else{
                        return miniInfo3.outputPower;
                    }
                }
                portEfficency: theEfficiencyAverage
            }

            PortInfoMini {
                id: miniInfo4
                portNum: 4
                anchors {
                    top: capacityBar.bottom
                    topMargin: 10
                    left: miniInfo3.right
                    leftMargin: 20
                    bottom: margins.bottom
                }
                width: margins.width / 4 - 15
                portConnected: false
                portColor: "#2348cd"

                property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state
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
                        miniInfo4.theRunningTotal += theEfficiency;
                        miniInfo4.theEfficiencyCount++;

                        if (miniInfo4.theEfficiencyCount == 8){
                            miniInfo4.theEfficiencyAverage = miniInfo4.theRunningTotal/8;
                            miniInfo4.theEfficiencyCount = 0;
                            miniInfo4.theRunningTotal = 0
                        }
                    }
                }

                onDeviceConnectedChanged: {
                    if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                            miniInfo4.portConnected = true;
                        }
                    }
                }

                onDeviceDisconnectedChanged: {
                    if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                        if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                            miniInfo4.portConnected = false;
                        }

                    }
                }

                negotiatedVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 4){
                        return platformInterface.request_usb_power_notification.negotiated_voltage
                    }
                    else{
                        return miniInfo4.negotiatedVoltage;
                    }
                }
                maxPower:{
                    if (platformInterface.request_usb_power_notification.port === 4){
                        var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                        var current = platformInterface.request_usb_power_notification.negotiated_current;
                        return Math.round(voltage*current *100)/100;
                    }
                    else if (!miniInfo4.portConnected){
                       return "—"  //show a dash on disconnect, so cached value won't show on connect
                     }
                    else{
                        return miniInfo4.maxPower;
                    }
                }
                inputPower: {
                    if (platformInterface.request_usb_power_notification.port === 4){
                        return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2) ; //PTJ-1321 adding 2 watts compensation
                    }
                    else{
                        return miniInfo4.inputPower;
                    }
                }
                outputVoltage:{
                    if (platformInterface.request_usb_power_notification.port === 4){
                        return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2)
                    }
                    else{
                        return miniInfo4.outputVoltage;
                    }
                }
                portTemperature:{
                    if (platformInterface.request_usb_power_notification.port === 4){
                        return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                    }
                    else{
                        return miniInfo4.portTemperature;
                    }
                }
                outputPower: {
                    if (platformInterface.request_usb_power_notification.port === 4){
                        return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
                    }
                    else{
                        return miniInfo4.outputPower;
                    }
                }
                portEfficency: theEfficiencyAverage
            }
        }
    }

    Item{
        id: rightColumn
        anchors {
            right: root.right
            top: root.top
            bottom: root.bottom
        }
        width: root.width/3

        SGStatusListBox {
            id: currentFaults
            height: rightColumn.height/2
            width: rightColumn.width
            title: "Active Faults:"
            model: faultListModel

            property var underVoltageEvent: platformInterface.input_under_voltage_notification
            property var overTempEvent: platformInterface.over_temperature_notification
            property string stateMessage:""

            onUnderVoltageEventChanged: {
                if (underVoltageEvent.state === "below"){   //add input voltage message to list
                    stateMessage = "Input is below ";
                    stateMessage += platformInterface.input_under_voltage_notification.minimum_voltage;
                    stateMessage += " V";
                    //if there's already an input voltage fault in the list, remove it (there can only be one at a time)
                    for(var i = 0; i < faultListModel.count; ++i){
                        var theItem = faultListModel.get(i);
                        if (theItem.type === "voltage"){
                            faultListModel.remove(i);
                        }
                    }
                    faultListModel.append({"type":"voltage", "port":"0", "status":stateMessage});

                }
                else{                                       //remove input voltage message from list
                    for(var j = 0; j < faultListModel.count; ++j){
                        var theListItem = faultListModel.get(j);
                        if (theListItem.type === "voltage"){
                            faultListModel.remove(j);
                        }
                    }
                }
            }

            onOverTempEventChanged: {
                if (platformInterface.over_temperature_notification.state === "above"){   //add temp  message to list
                    stateMessage = platformInterface.over_temperature_notification.port
                    stateMessage += " temperature is above ";
                    stateMessage += platformInterface.over_temperature_notification.maximum_temperature;
                    stateMessage += " °C";
                    faultListModel.append({"type":"temperature", "port":platformInterface.over_temperature_notification.port, "status":stateMessage});
                }
                else{                                       //remove temp message for the correct port from list
                    for(var i = 0; i < faultListModel.count; ++i){
                        var theItem = faultListModel.get(i);
                        if (theItem.type === "temperature" && theItem.port === platformInterface.over_temperature_notification.port){
                            faultListModel.remove(i);
                        }
                    }
                }
            }

            ListModel{
                id:faultListModel
            }
        }



        SGOutputLogBox {
            id: faultHistory
            height: rightColumn.height/2
            anchors {
                top: currentFaults.bottom
            }
            width: rightColumn.width
            title: "Fault History:"

            property var underVoltageEvent: platformInterface.input_under_voltage_notification
            property var overTempEvent: platformInterface.over_temperature_notification
            property string stateMessage:""

            onUnderVoltageEventChanged: {
                if (underVoltageEvent.state === "below"){   //add input voltage message to list
                    stateMessage = "Input is below ";
                    stateMessage += platformInterface.input_under_voltage_notification.minimum_voltage;
                    stateMessage += " V";
                    faultHistory.input = stateMessage;

                }
                else{
//                    stateMessage = "Input voltage fault ended at ";
//                    stateMessage += platformInterface.input_under_voltage_notification.minimum_voltage;
//                    stateMessage += " V";
//                    faultHistory.input = stateMessage;
                }
            }

            onOverTempEventChanged: {
                console.log("over temp event received. state=",overTempEvent.state);
                if (overTempEvent.state === "above"){   //add temp  message to list
                    stateMessage = platformInterface.over_temperature_notification.port
                    stateMessage += " temperature is above ";
                    stateMessage += platformInterface.over_temperature_notification.maximum_temperature;
                    stateMessage += " °C";
                    faultHistory.input = stateMessage;
                    console.log("added over temp event to history")
                }
                else{
//                    stateMessage = platformInterface.over_temperature_notification.port
//                    stateMessage += " temperature went below ";
//                    stateMessage += platformInterface.over_temperature_notification.maximum_temperature;
//                    stateMessage += " °C";
//                    faultHistory.input = stateMessage;
                }


            }
        }
    }
}

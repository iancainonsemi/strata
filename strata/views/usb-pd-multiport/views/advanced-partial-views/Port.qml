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
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "qrc:/views/usb-pd-multiport/sgwidgets"

Item {
    id: root

    property bool debugLayout: true
    property int portNumber: 1
    property alias portConnected: portInfo.portConnected
    property alias portColor: portInfo.portColor
    property bool showGraphs: false
    property alias enableAssuredPower: portSettings.assuredPortPowerEnabled

    width: parent.width
    height: {
        if (graphSelector.nothingChecked || !portConnected){
            portSettings.height;
        }
        else if (!graphSelector.nothingChecked && portConnected){
           portSettings.height + portGraphs.height;
        }

    }

    PortInfo {
        id: portInfo
        anchors {
            left: parent.left
            top: root.top
            bottom: graphSelector.top
        }

        property int theRunningTotal: 0
        property int theEfficiencyCount: 0
        property int theEfficiencyAverage: 0

        property var periodicValues: platformInterface.request_usb_power_notification

        onPeriodicValuesChanged: {
            var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
            var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

            if (platformInterface.request_usb_power_notification.port === portNumber){
                //sum eight values of the efficency and average before displaying
                var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                portInfo.theRunningTotal += theEfficiency;
                //console.log("new efficiency value=",theEfficiency,"new total is",miniInfo1.theRunningTotal,miniInfo1.theEfficiencyCount);
                portInfo.theEfficiencyCount++;

                if (portInfo.theEfficiencyCount === 8){
                    portInfo.theEfficiencyAverage = portInfo.theRunningTotal/8;
                    portInfo.theEfficiencyCount = 0;
                    portInfo.theRunningTotal = 0

                    //console.log("publishing new efficency",miniInfo1.theEfficiencyAverage);
                    //return miniInfo1.theEfficiencyAverage
                }
            }

        }
        advertisedVoltage:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return platformInterface.request_usb_power_notification.negotiated_voltage
            }
            else{
                return portInfo.advertisedVoltage;
            }
        }
        maxPower:{
            //labeled "PD Contract" in the UI, this is the wattage agreed to by the platform and device
            if (platformInterface.request_usb_power_notification.port === portNumber){
                var voltage = platformInterface.request_usb_power_notification.negotiated_voltage;
                var current = platformInterface.request_usb_power_notification.negotiated_current;
                return Math.round(voltage*current *100)/100;
            }
            else{
                return portInfo.maxPower;
            }
        }
        inputPower:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return ((platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current)+2).toFixed(2); //PTJ-1321 adding 2 watts compensation
            }
            else{
                return portInfo.inputPower;
            }
        }
        outputPower:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return (platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current).toFixed(2);
            }
            else{
                return portInfo.outputPower;
            }
        }
        outputVoltage:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return (platformInterface.request_usb_power_notification.output_voltage).toFixed(2);
            }
            else{
                return portInfo.outputVoltage;
            }
        }
        portTemperature:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return (platformInterface.request_usb_power_notification.temperature).toFixed(1)
            }
            else{
                return portInfo.portTemperature;
            }
        }
        efficency: theEfficiencyAverage
    }

    SGSegmentedButtonStrip {
        id: graphSelector
        label: "<b>Show Graphs:</b>"
        labelLeft: false
        anchors {
            bottom: portSettings.bottom
            bottomMargin: 15
            horizontalCenter: portInfo.horizontalCenter
        }
        textColor: "#666"
        activeTextColor: "white"
        radius: 4
        buttonHeight: 25
        exclusive: false
        buttonImplicitWidth: 50
        enabled: root.portConnected
        property int howManyChecked: 0

        segmentedButtons: GridLayout {
            columnSpacing: 2
            rowSpacing: 2

            SGSegmentedButton{
                text: qsTr("Vout")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph1.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph1.visible = false
                        graphSelector.howManyChecked--
                    }
                }
            }

            SGSegmentedButton{
                text: qsTr("Iout")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph2.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph2.visible = false
                        graphSelector.howManyChecked--
                    }
                }
            }

            SGSegmentedButton{
                text: qsTr("Iin")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph3.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph3.visible = false
                        graphSelector.howManyChecked--
                    }
                }
            }

            SGSegmentedButton{
                text: qsTr("Pout")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph4.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph4.visible = false
                        graphSelector.howManyChecked--
                    }
                }
           }

            SGSegmentedButton{
                text: qsTr("Pin")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph5.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph5.visible = false
                        graphSelector.howManyChecked--
                    }
                }
            }

            SGSegmentedButton{
                text: qsTr("η")
                enabled: root.portConnected
                onCheckedChanged: {
                    if (checked) {
                        graph6.visible = true
                        graphSelector.howManyChecked++
                    } else {
                        graph6.visible = false
                        graphSelector.howManyChecked--
                    }
                }
            }
        }
    }


    PortSettings {
        id: portSettings
        anchors {
            left: portInfo.right
            top: portInfo.top
            right: root.right
        }
        height: 300

        SGLayoutDivider {
            position: "left"
        }
    }

    Row {
        id: portGraphs
        anchors {
            top: portSettings.bottom
            topMargin: 15
            left: root.left
            right: root.right
        }
        height:250

        SGGraph {
            id: graph1
            title: "Voltage Out"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "V"
            xAxisTitle: "1 sec/div"
            minYValue: 0                    // Default: 0
            maxYValue: 25                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    stream = platformInterface.request_usb_power_notification.output_voltage
                }
            }

            inputData: stream          // Set the graph's data source here
        }

        SGGraph {
            id: graph2
            title: "Current Out"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "A"
            xAxisTitle: "1 sec/div"

            minYValue: 0                    // Default: 0
            maxYValue: 5                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    stream = platformInterface.request_usb_power_notification.output_current
                }
            }

            inputData: stream          // Set the graph's data source here
        }

        SGGraph {
            id: graph3
            title: "Current In"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "A"
            xAxisTitle: "1 sec/div"

            minYValue: 0                    // Default: 0
            maxYValue: 5                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    stream = platformInterface.request_usb_power_notification.input_current
                }
            }

            inputData: stream          // Set the graph's data source here
        }

        SGGraph {
            id: graph4
            title: "Power Out"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "W"
            xAxisTitle: "1 sec/div"
            minYValue: 0                    // Default: 0
            maxYValue: 125                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    stream = platformInterface.request_usb_power_notification.output_voltage *
                            platformInterface.request_usb_power_notification.output_current;
                }
            }

            inputData: stream          // Set the graph's data source here
        }

        SGGraph {
            id: graph5
            title: "Power In"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "W"
            xAxisTitle: "1 sec/div"
            minYValue: 0                    // Default: 0
            maxYValue: 125                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    stream = platformInterface.request_usb_power_notification.input_voltage *
                            platformInterface.request_usb_power_notification.input_current;
                }
            }

            inputData: stream          // Set the graph's data source here
        }

        SGGraph {
            id: graph6
            title: "Efficiency"
            visible: false
            anchors {
                top: portGraphs.top
                bottom: portGraphs.bottom
                bottomMargin:0
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "Percent"
            xAxisTitle: "1 sec/div"

            minYValue: 70                    // Default: 0
            maxYValue: 100                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?

            property int theRunningTotal: 0
            property int theEfficiencyCount: 0
            property int theEfficiencyAverage: 0

            property var periodicValues: platformInterface.request_usb_power_notification.output_voltage

            onPeriodicValuesChanged: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current +2;//PTJ-1321 2 Watt compensation
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //sum eight values of the efficency and average before displaying
                    var theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    graph6.theRunningTotal += theEfficiency;
                    //console.log("input=",theInputPower,"output=",theOutputPower,"efficiency=",theEfficiency);
                    //console.log("new efficiency value=",theEfficiency,"new total is",graph6.theRunningTotal,graph6.theEfficiencyCount);
                    graph6.theEfficiencyCount++;

                    if (graph6.theEfficiencyCount === 8){
                        graph6.theEfficiencyAverage = graph6.theRunningTotal/8;
                        graph6.theEfficiencyCount = 0;
                        graph6.theRunningTotal = 0

                        //console.log("publishing new efficency",graph6.theEfficiencyAverage);
                    }

                    if (theInputPower == 0)
                        stream = 0;
                    else{
                        stream = theEfficiencyAverage;
                    }
                }
            }

            inputData: stream          // Set the graph's data source here
        }
    }
}

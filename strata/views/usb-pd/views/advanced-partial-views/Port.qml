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
import "../../sgwidgets"

Item {
    id: root

    property bool debugLayout: true
    property int portNumber: 1
    property alias portConnected: portInfo.portConnected
    property alias portColor: portInfo.portColor
    property bool showGraphs: false

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
            topMargin: 110
        }
        advertisedVoltage:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return platformInterface.request_usb_power_notification.negotiated_voltage
            }
            else{
                return portInfo.advertisedVoltage;
            }
        }
        pdContract:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
               return (platformInterface.request_usb_power_notification.negotiated_current * platformInterface.request_usb_power_notification.negotiated_voltage);
            }
            else{
                return portInfo.pdContract;
            }
        }
        inputPower:{
            if (platformInterface.request_usb_power_notification.port === portNumber){
                return (platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current).toFixed(2);
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
                return (platformInterface.request_usb_power_notification.temperature).toFixed(1);
            }
            else{
                return portInfo.portTemperature;
            }
        }
//        efficency: {
//            var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
//            var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

//            if (platformInterface.request_usb_power_notification.port === portNumber){
//                if (theInputPower == 0){    //division by 0 would normally give "nan"
//                    return "—"
//                }
//                else{
//                    //return Math.round((theOutputPower/theInputPower)*100)/100
//                    return "—"
//                }
//            }
//            else{
//                return portInfo.efficency;
//            }
//        }
    }



    Rectangle{
        id:graphAndCapibilitiesRect
        anchors.left: portInfo.right
        anchors.verticalCenter: portInfo.verticalCenter
        anchors.verticalCenterOffset: 2

        height:225
        width:310

        SGLayoutDivider {
            position: "left"
        }


        Text {
            id: advertisedVoltagesText
            text: "<b>Advertised Profiles</b>"
            font {
                pixelSize: 16
            }
            anchors {
                bottom: faultProtectionButtonStrip.top
                bottomMargin: 10
                left: graphAndCapibilitiesRect.left
                leftMargin: 10
            }
        }

        SGSegmentedButtonStrip {
            id: faultProtectionButtonStrip
            anchors {
                left: graphAndCapibilitiesRect.left
                leftMargin: 10
                bottom: graphAndCapibilitiesRect.verticalCenter
                bottomMargin: 15
            }
            textColor: "#666"
            activeTextColor: "white"
            radius: 4
            buttonHeight: 25
            hoverEnabled: false
            buttonImplicitWidth:0   //minimize width of the buttons

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
                        faultProtectionButtonStrip.buttonList[0].children[6].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[6].text += platformInterface.usb_pd_advertised_voltages_notification.settings[6].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[6].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[6].text = "NA";
                    }

                    if (numberOfSettings >= 6){
                        faultProtectionButtonStrip.buttonList[0].children[5].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[5].text = platformInterface.usb_pd_advertised_voltages_notification.settings[5].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[5].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[5].text += platformInterface.usb_pd_advertised_voltages_notification.settings[5].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[5].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[5].text = "NA";
                    }

                    if (numberOfSettings >= 5){
                        faultProtectionButtonStrip.buttonList[0].children[4].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[4].text = platformInterface.usb_pd_advertised_voltages_notification.settings[4].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[4].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[4].text += platformInterface.usb_pd_advertised_voltages_notification.settings[4].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[4].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[4].text = "NA";
                    }

                    if (numberOfSettings >= 4){
                        faultProtectionButtonStrip.buttonList[0].children[3].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[3].text = platformInterface.usb_pd_advertised_voltages_notification.settings[3].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[3].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[3].text += platformInterface.usb_pd_advertised_voltages_notification.settings[3].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[3].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[3].text = "NA";
                    }

                    if (numberOfSettings >= 3){
                        faultProtectionButtonStrip.buttonList[0].children[2].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[2].text = platformInterface.usb_pd_advertised_voltages_notification.settings[2].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[2].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[2].text += platformInterface.usb_pd_advertised_voltages_notification.settings[2].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[2].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[2].text = "NA";
                    }

                    if (numberOfSettings >= 2){
                        faultProtectionButtonStrip.buttonList[0].children[1].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[1].text = platformInterface.usb_pd_advertised_voltages_notification.settings[1].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[1].text += "V\n ";
                        faultProtectionButtonStrip.buttonList[0].children[1].text += platformInterface.usb_pd_advertised_voltages_notification.settings[1].maximum_current;
                        faultProtectionButtonStrip.buttonList[0].children[1].text += "A";
                    }
                    else{
                        faultProtectionButtonStrip.buttonList[0].children[1].text = "NA";
                    }

                    if (numberOfSettings >= 1){
                        faultProtectionButtonStrip.buttonList[0].children[0].enabled = true;
                        faultProtectionButtonStrip.buttonList[0].children[0].text = platformInterface.usb_pd_advertised_voltages_notification.settings[0].voltage;
                        faultProtectionButtonStrip.buttonList[0].children[0].text += "V\n ";
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

        SGSegmentedButtonStrip {
            id: graphSelector
            label: "<b>Show Graphs</b>"
            labelLeft: false
            labelFontSize: 16
            anchors {
                top: graphAndCapibilitiesRect.verticalCenter
                topMargin: 15
                left: graphAndCapibilitiesRect.left
                leftMargin: 10
            }
            textColor: "#666"
            activeTextColor: "white"
            radius: 4
            buttonHeight: 25
            exclusive: false
            buttonImplicitWidth: 0
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

//                SGSegmentedButton{
//                    text: qsTr("η")
//                    enabled: root.portConnected
//                    onCheckedChanged: {
//                        if (checked) {
//                            graph6.visible = true
//                            graphSelector.howManyChecked++
//                        } else {
//                            graph6.visible = false
//                            graphSelector.howManyChecked--
//                        }
//                    }
//                }
            }


        }
    }


    PortSettings {
        id: portSettings
        anchors {
            left: graphAndCapibilitiesRect.right
            top: graphAndCapibilitiesRect.top
            right: root.right
        }
        height: 225

        SGLayoutDivider {
            position: "left"
        }
    }

    Row {
        id: portGraphs
        anchors {
            top: portSettings.bottom
            topMargin: 5
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
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "V"
            xAxisTitle: "Seconds"
            minYValue: 0                    // Default: 0
            maxYValue: 22                   // Default: 10
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
//                left: graph1.right
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "A"
            xAxisTitle: "Seconds"

            minYValue: 0                    // Default: 0
            maxYValue: 6                   // Default: 10
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
//                left: graph2.right
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "A"
            xAxisTitle: "Seconds"

            minYValue: 0                    // Default: 0
            maxYValue: 6                   // Default: 10
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
//                left: graph3.right
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "W"
            xAxisTitle: "Seconds"
            minYValue: 0                    // Default: 0
            maxYValue: 110                   // Default: 10
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
//                left: graph4.right
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "W"
            xAxisTitle: "Seconds"
            minYValue: 0                    // Default: 0
            maxYValue: 110                   // Default: 10
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
                //                left: graph4.right
            }
            width: portGraphs.width /  Math.max(1, graphSelector.howManyChecked)
            yAxisTitle: "Percent"
            xAxisTitle: "Seconds"

            minYValue: 0                    // Default: 0
            maxYValue: 100                   // Default: 10
            minXValue: 0                    // Default: 0
            maxXValue: 5                    // Default: 10

            property real stream: 0
            property real count: 0
            property real interval: 10 // 10 Hz?
            property real inputPower: 0
            property real outputPower: 0

            property var powerInfo: platformInterface.request_usb_power_notification.output_voltage
            onPowerInfoChanged:{
                //console.log("new power notification for port ",portNumber);
                if (platformInterface.request_usb_power_notification.port === portNumber){
                    //console.log("voltage=",platformInterface.request_usb_power_notification.output_voltage," count=",count);
                    count += interval;
                    inputPower = platformInterface.request_usb_power_notification.input_voltage *
                            platformInterface.request_usb_power_notification.input_current;
                    outputPower = platformInterface.request_usb_power_notification.output_voltage *
                            platformInterface.request_usb_power_notification.output_current;
                    //console.log("inputPower=",inputPower," outputPower=",outputPower,(outputPower/inputPower)*100);
                    if (inputPower == 0)
                        stream = 0;
                    else{
                        stream = (outputPower/inputPower)*100;
                    }
                }
            }

            inputData: stream          // Set the graph's data source here
        }
    }

}

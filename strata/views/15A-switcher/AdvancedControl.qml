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

import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "qrc:/js/navigation_control.js" as NavigationControl
import "qrc:/views/15A-switcher/sgwidgets"
import "qrc:/js/help_layout_manager.js" as Help

Item {
    anchors.fill: parent
    property string vinlable: ""
    property var read_enable_state: platformInterface.initial_status.enable_status

    onRead_enable_stateChanged: {
        if(read_enable_state === "on") {
            platformInterface.enabled = true
        }
        else  {
            platformInterface.enabled = false
        }
    }

    property var soft_start_state: platformInterface.initial_status.soft_start_status
    onSoft_start_stateChanged: {
        if(soft_start_state === "5ms"){
            platformInterface.soft_start = 0
        }
        else {
            platformInterface.soft_start = 1
        }
    }

    property var vout_state: platformInterface.initial_status.vout_selector_status
    onVout_stateChanged: {
        platformInterface.vout = vout_state
    }

    property var ocp_threshold_state: platformInterface.initial_status.ocp_threshold_status
    onOcp_threshold_stateChanged: {
        if(ocp_threshold_state === 3){
            platformInterface.ocp_threshold = 2
        }
        else platformInterface.ocp_threshold = ocp_threshold_state
    }

    property var mode_state: platformInterface.initial_status.mode_index_status
    onMode_stateChanged: {
        platformInterface.mode = mode_state
    }


    FontLoader {
        id: icons
        source: "sgwidgets/fonts/sgicons.ttf"
    }

    property var read_vin: platformInterface.status_voltage_current.vingood
    onRead_vinChanged: {
        if(read_vin === "good") {
            ledLight.status = "green"
            vinlable = "over"
            ledLight.label = "VIN Ready ("+vinlable + " 4.5V)"
            enableSwitch.enabled  = true
            enableSwitch.opacity = 1.0

        }
        else {
            ledLight.status = "red"
            vinlable = "under"
            ledLight.label = "VIN Ready ("+vinlable +" 4.5V)"
            enableSwitch.enabled  = false
            enableSwitch.opacity = 0.5
            platformInterface.enabled = false
        }
    }

    Component.onCompleted:  {
        Help.registerTarget(efficiencyGauge, "This gauge shows the efficiency of the Switcher. This is calculated with Pout/Pin. Regulator efficiency-accurate when a load is present.", 0, "advance15AHelp")
        Help.registerTarget(powerDissipatedGauge, "This gauge shows the power dissipated by the Switcher in Watts. This is calculated with Pout - Pin.", 1, "advance15AHelp")
        Help.registerTarget(tempGauge, "This gauge shows the temperature of the board.", 2, "advance15AHelp")
        Help.registerTarget(powerOutputGauge, "This gauge shows the Output Power in Watts.", 3, "advance15AHelp")
        Help.registerTarget(ledLight, "The LED will light up green when input voltage is ready and greater than 4.5V. It will light up red when under 4.5V to warn the user that input voltage is not high enough.", 4, "advance15AHelp")
        Help.registerTarget(inputCurrent, "Input current is shown here in A.", 6, "advance15AHelp")
        Help.registerTarget(inputVoltage, "Input voltage is shown here in Volts.", 5, "advance15AHelp")
        Help.registerTarget(softStartList, "Select either a 5ms or 10ms softstart. Converter reset required to see changes", 7,"advance15AHelp")
        Help.registerTarget(modeSelect, "Select Converter Switching Mode. 550Khz or 1.1Mhz in either DCM or FCCM. When in 1.1Mhz FCCM, converter may go into over-temperature protect mode after some time at max load.", 8, "advance15AHelp")
        Help.registerTarget(vbVoltage, "This is internal LDO output voltage", 9, "advance15AHelp")
        Help.registerTarget(vccVoltage, "Biasing voltage used by converter- tied to input voltage by default.", 10, "advance15AHelp")
        Help.registerTarget(vboostVoltage, "This is boot-strap (pin BST) voltage. ", 11, "advance15AHelp")
        Help.registerTarget(enableSwitch, "Enables and disables 15A switcher output.", 12, "advance15AHelp")
        Help.registerTarget(outputVoltageList, "Select output voltages 1, 1.8, 2.5, and 3.3V. Converter will UVLO when changing from a higher output voltage to a lower output voltage when in DCM mode.", 13, "advance15AHelp")
        Help.registerTarget(ocplist,"Low-Side Sensing, Peak-Current detect threshold. Value is approximate as it is duty cycle and FSW dependant. CONVERTER RESET REQUIRED TO CHANGE THRESHOLD.", 14, "advance15AHelp")
        Help.registerTarget(ouputCurrent,"Output current is shown here in A.", 16, "advance15AHelp")
        Help.registerTarget(outputVoltage,"Output voltage is shown here in Volts.", 15, "advance15AHelp")
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
                topMargin: 30
                horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: pageText
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }

                text:  "<b> NCP3235 </b>"
                font.pixelSize: (parent.width + parent.height)/ 30
                color: "black"
            }
            Text {
                anchors {
                    top: pageText.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                text: "<b>High Current Sync Buck Converter</b>"
                font.pixelSize: (parent.width + parent.height)/ 40
                color: "black"

            }
        }

        Rectangle {
            id: controlSection
            width: parent.width
            height: parent.height - 100

            anchors{
                top: pageLable.bottom
                topMargin: 20
            }

            Rectangle {
                id: topControl
                anchors {
                    left: controlSection.left
                    top: controlSection.top
                }
                width: parent.width
                height: controlSection.height/2.5

                SGCircularGauge {
                    id: efficiencyGauge
                    anchors {
                        top: parent.top
                        left: parent.left
                    }

                    width: parent.width/4
                    height: parent.height
                    gaugeFrontColor1: Qt.rgba(1,0,0,1)
                    gaugeFrontColor2: Qt.rgba(0,1,.25,1)
                    minimumValue: 0
                    maximumValue: 100
                    tickmarkStepSize: 10
                    outerColor: "#999"
                    unitLabel: "%"
                    gaugeTitle: "Efficiency"
                    value: platformInterface.status_voltage_current.efficiency
                    Behavior on value { NumberAnimation { duration: 300 } }

                }

                SGCircularGauge {
                    id: powerDissipatedGauge
                    anchors {
                        left: efficiencyGauge.right
                        top: parent.top
                    }

                    width: parent.width/4
                    height: parent.height
                    gaugeFrontColor1: Qt.rgba(0,1,.25,1)
                    gaugeFrontColor2: Qt.rgba(1,0,0,1)
                    minimumValue: 0
                    maximumValue: 5
                    tickmarkStepSize: 0.5
                    outerColor: "#999"
                    unitLabel: "W"
                    gaugeTitle: "Power Loss"
                    decimal: 2

                    value: platformInterface.status_voltage_current.power_dissipated
                    Behavior on value { NumberAnimation { duration: 300 } }
                }


                SGCircularGauge {
                    id: tempGauge
                    anchors {
                        left: powerDissipatedGauge.right
                        top: parent.top
                    }

                    width: parent.width/4
                    height: parent.height
                    gaugeFrontColor1: Qt.rgba(0,0.5,1,1)
                    gaugeFrontColor2: Qt.rgba(1,0,0,1)
                    minimumValue: -55
                    maximumValue: 125
                    tickmarkStepSize: 20
                    outerColor: "#999"
                    unitLabel: "°C"
                    gaugeTitle: "Board" + "\n" + "Temperature"
                    value: platformInterface.status_temperature_sensor.temperature
                    Behavior on value { NumberAnimation { duration: 300 } }
                }
                SGCircularGauge {
                    id: powerOutputGauge
                    anchors {
                        left: tempGauge.right
                        top: parent.top
                    }
                    width: parent.width/4
                    height: parent.height
                    gaugeFrontColor1: Qt.rgba(0,0.5,1,1)
                    gaugeFrontColor2: Qt.rgba(1,0,0,1)
                    minimumValue: 0
                    maximumValue: 30
                    tickmarkStepSize: 2
                    outerColor: "#999"
                    unitLabel: "W"
                    gaugeTitle: "Output Power"
                    decimal: 2
                    value: platformInterface.status_voltage_current.output_power
                    Behavior on value { NumberAnimation { duration: 300 } }
                }

            }

            Rectangle {
                width: parent.width
                height: parent.height/2

                anchors {
                    top : topControl.bottom
                    topMargin: 20
                }

                Rectangle {
                    id: dataContainer
                    color: "transparent"
                    border.color: "black"
                    border.width: 5
                    radius: 10
                    width: parent.width/3.6
                    height: (parent.height/2) + 120

                    anchors {
                        top: parent.top
                        //  topMargin : 20
                        left: parent.left
                        leftMargin : 50
                    }

                    Text {
                        id: containerLabel
                        text: "Input"
                        width: parent.width/5
                        height: parent.height/10
                        anchors {
                            top: parent.top
                            topMargin: 20
                            horizontalCenter: parent.horizontalCenter
                        }
                        font.pixelSize: height
                        fontSizeMode: Text.Fit
                        font.bold: true
                    }

                    Rectangle {
                        id: line
                        height: 2
                        width: parent.width - 9

                        anchors {
                            top: containerLabel.bottom
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

                        property string vinMonitor: platformInterface.status_voltage_current.vingood
                        onVinMonitorChanged:  {
                            if(vinMonitor === "good") {
                                status = "green"
                                vinlable = "over"
                                label = "VIN Ready ("+ vinlable + " 4.5V)"
                                enableSwitch.enabled  = true
                                enableSwitch.opacity = 1.0
                            }
                            else if(vinMonitor === "bad") {
                                status = "red"
                                vinlable = "under"
                                label = "VIN Ready ("+ vinlable + " 4.5V)"
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
                            text: "<b>DO NOT exceed input voltage more than 23V</b>"
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
                        }
                    }

                    SGLabelledInfoBox {
                        id: inputCurrent
                        label: "Input Current"
                        info: platformInterface.status_voltage_current.iin.toFixed(2)
                        unit: "A"
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
                    id: dataContainerMiddle
                    width: parent.width/3
                    height: (parent.height/2) + 120
                    anchors {
                        left: dataContainer.right
                        leftMargin: 40
                        top: parent.top
                        // topMargin : 20
                        right: dataContainerRight.left
                        rightMargin: 40
                    }

                    Rectangle {
                        id: selectList
                        width: parent.width
                        height: (parent.height/2.5) + 20
                        color: "transparent"
                        border.color: "black"
                        border.width: 5
                        radius: 10
                        anchors {
                            top: parent.top
                            horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            id: softStartList
                            width: parent.width - 30
                            height: parent.height/3
                            anchors {
                                top: parent.top
                                topMargin: 10
                                horizontalCenter: parent.horizontalCenter
                            }

                            SGComboBox {
                                id: softStartCombo
                                currentIndex: platformInterface.soft_start
                                model: [
                                    "5ms", "10ms"
                                ]
                                label: "Soft Start:"

                                anchors {
                                    horizontalCenter: parent.horizontalCenter
                                    horizontalCenterOffset: (modeCombo.width -width)/2

                                }
                                fontSize :  (parent.width + parent.height)/26
                                comboBoxWidth: parent.width/1.6
                                comboBoxHeight: parent.height
                                onActivated: {
                                    if(currentIndex == 0) {
                                        platformInterface.set_soft_start.update("5ms")
                                    }
                                    else {
                                        platformInterface.set_soft_start.update("10ms")
                                    }
                                    platformInterface.soft_start = currentIndex
                                }
                            }
                        }

                        Rectangle {
                            id: modeSelect
                            width: parent.width - 30
                            height: parent.height/3
                            anchors {
                                top: softStartList.bottom
                                topMargin: 10
                                horizontalCenter: parent.horizontalCenter
                            }
                            SGComboBox {
                                id: modeCombo
                                currentIndex: platformInterface.mode
                                label: "Mode Select:"
                                model: [
                                    "Auto CCM/DCM, 550KHz, OVP Latch Off, Sonic Mode Enabled",
                                    "Auto CCM/DCM, 550KHz, OVP Latch Off, Sonic Mode Disabled",
                                    "Auto CCM/DCM, 1.1MHz, OVP Latch Off, Sonic Mode Enabled",
                                    "FCCM, 1.1MHz, OVP Hiccup, Sonic Mode Not Applied",
                                    "Auto CCM/DCM, 1.1MHz, OVP Latch Off, Sonic Mode Disabled"
                                ]
                                anchors {
                                    horizontalCenter: parent.horizontalCenter
                                }


                                fontSize :  (parent.width + parent.height)/26
                                comboBoxWidth: parent.width/1.6
                                comboBoxHeight: parent.height
                                onActivated:  {
                                    platformInterface.set_mode.update(currentIndex)
                                    platformInterface.mode = currentIndex
                                }
                            }
                        }
                    }

                    Rectangle {

                        color: "transparent"
                        border.color: "black"
                        border.width: 5
                        radius: 10
                        width: parent.width
                        height : parent.height/2
                        anchors {
                            top : selectList.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        SGLabelledInfoBox {
                            id: vbVoltage
                            label: "VB Voltage"
                            info: platformInterface.status_voltage_current.vb.toFixed(2)
                            unit: "V"
                            infoBoxWidth: parent.width/3
                            infoBoxHeight : parent.height/6
                            fontSize :  (parent.width + parent.height)/34
                            unitSize: (parent.width + parent.height)/30
                            anchors {
                                top : parent.top
                                topMargin : 20
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: (vboostVoltage.width - vbVoltage.width)/2

                            }



                        }
                        SGLabelledInfoBox {
                            id: vccVoltage
                            label: "VCC Voltage"
                            info: platformInterface.status_voltage_current.vcc.toFixed(2)
                            unit: "V"
                            infoBoxWidth: parent.width/3
                            infoBoxHeight : parent.height/6
                            fontSize :  (parent.width + parent.height)/34
                            unitSize: (parent.width + parent.height)/30
                            anchors {
                                top : vbVoltage.bottom
                                topMargin : 10
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: (vboostVoltage.width - vccVoltage.width)/2

                            }

                        }
                        SGLabelledInfoBox {
                            id: vboostVoltage
                            label: "VBST Voltage"
                            info: platformInterface.status_voltage_current.vboost.toFixed(2)
                            unit: "V"
                            infoBoxWidth: parent.width/3
                            infoBoxHeight : parent.height/6
                            fontSize :  (parent.width + parent.height)/34
                            unitSize: (parent.width + parent.height)/30
                            anchors {
                                top : vccVoltage.bottom
                                topMargin : 10
                                horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }

                Rectangle {
                    id: dataContainerRight
                    color: "transparent"
                    border.color: "black"
                    border.width: 5
                    radius: 10
                    width: parent.width/3.6
                    height: (parent.height/2) + 120

                    anchors {
                        right: parent.right
                        rightMargin: 50
                        top: parent.top
                    }

                    Text {
                        id: containerLabelout
                        text: "Output"
                        width: parent.width/5
                        height: parent.height/10
                        anchors {
                            top: parent.top
                            topMargin: 20
                            horizontalCenter: parent.horizontalCenter
                        }

                        font.pixelSize: height
                        font.bold: true
                        fontSizeMode: Text.Fit
                    }

                    Rectangle {
                        id: line2
                        height: 2
                        width: parent.width - 9
                        anchors {
                            top: containerLabelout.bottom
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
                            topMargin :  15
                            horizontalCenter: parent.horizontalCenter
                        }

                        label : "Enable (EN)"
                        switchWidth: parent.width/7         // Default: 52 (change for long custom checkedLabels when labelsInside)
                        switchHeight: parent.height/15             // Default: 26
                        textColor: "black"              // Default: "black"
                        handleColor: "white"            // Default: "white"
                        grooveColor: "#ccc"             // Default: "#ccc"
                        grooveFillColor: "#0cf"         // Default: "#0cf"

                        checked: platformInterface.enabled
                        fontSizeLabel: (parent.width + parent.height)/40

                        onCheckedChanged: {
                            if(checked){
                                ocplist.enabled = false
                                ocplist.opacity = 0.5
                            }
                            else{
                                ocplist.enabled = true
                                ocplist.opacity = 1.0
                            }
                        }

                        onToggled: {
                            if(checked){
                                platformInterface.set_enable.update("on")
                            }
                            else platformInterface.set_enable.update("off")

                            platformInterface.enabled = checked
                        }
                    }

                    Rectangle {
                        id: outputVoltageList
                        width: parent.width/1.3
                        height: parent.height/10
                        anchors {
                            top: enableSwitch.bottom
                            topMargin: 15
                            horizontalCenter: parent.horizontalCenter
                        }
                        SGComboBox {
                            id: ouputVolCombo
                            currentIndex: platformInterface.vout
                            model: [
                                "1V", "1.8V", "2.5V", "3.3V"
                            ]
                            label: "Select Output Voltage:"
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: (width - outputVoltage.width)/2
                            }
                            fontSize :  (parent.width + parent.height)/16
                            comboBoxWidth: parent.width/3.4
                            comboBoxHeight: parent.height
                            onActivated: {
                                platformInterface.select_output_voltage.update(currentIndex)
                                platformInterface.vout = currentIndex
                            }


                        }
                    }

                    Rectangle {
                        id: ocplist
                        width: parent.width/1.3
                        height: parent.height/10
                        anchors {
                            top: outputVoltageList.bottom
                            topMargin: 15
                            horizontalCenter: parent.horizontalCenter
                        }
                        SGComboBox {
                            id: ocpCombo
                            currentIndex: {
                                if(platformInterface.ocp_threshold == 3) {
                                    currentIndex = 2
                                }
                                else platformInterface.ocp_threshold
                            }

                            model: [
                                ">20A", "17.5A", "10A"
                            ]
                            label: "OCP Threshold:"
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: (width - outputVoltage.width)/2
                            }
                            fontSize :  (parent.width + parent.height)/16
                            comboBoxWidth: parent.width/3
                            comboBoxHeight: parent.height

                            onActivated: {
                                if(currentIndex == 2) {
                                    platformInterface.select_ocp_threshold.update(3)
                                    platformInterface.ocp_threshold = 2
                                }
                                else {
                                    platformInterface.select_ocp_threshold.update(currentIndex)
                                    platformInterface.ocp_threshold = currentIndex
                                }

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
                            top : ocplist.bottom
                            topMargin : 15
                            horizontalCenter: parent.horizontalCenter
                        }
                    }

                    SGLabelledInfoBox {
                        id: ouputCurrent
                        label: "Output Current"
                        info: platformInterface.status_voltage_current.iout.toFixed(2)
                        unit: "A"
                        infoBoxWidth: parent.width/3
                        infoBoxHeight :  parent.height/12
                        fontSize :   (parent.width + parent.height)/37
                        unitSize: (parent.width + parent.height)/35
                        anchors {
                            top : outputVoltage.bottom
                            topMargin : 14
                            horizontalCenter: parent.horizontalCenter

                        }
                    }
                }
            }
        } // end of controlContainer
    }
}




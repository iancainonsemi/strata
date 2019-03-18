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
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/js/navigation_control.js" as NavigationControl
import "qrc:/views/motor-vortex/sgwidgets"
import "qrc:/js/help_layout_manager.js" as Help

Rectangle {
    id: advancedControl
    width: 1200
    height: 725

    function resetData(){
        startStopButton.checked = false
        targetSpeedSlider.value = 1500
        rampRateSlider.value = 3
        driveModeCombo.currentIndex = 15
        faultModel.clear()
        platformInterface.driveModePseudoTrapezoidal = true
    }

    Component.onCompleted:  {
        platformInterface.phaseAngle = 15
        platformInterface.set_phase_angle.update(15);
        platformInterface.set_drive_mode.update(0);
        platformInterface.system_mode_selection.update("manual");
        Help.registerTarget( navTabs, "These tabs switch between Basic and Advanced control views. The FAE Only tab is restricted for ON Semiconductor field engineers.", 0 , "advanceViewHelp")
        Help.registerTarget( buttonContainer, "This button starts, stops or resets the motor",1, "advanceViewHelp")
        Help.registerTarget( targetSpeedSlider, "The slider sets motor speed from 1500-4000 rpm", 3, "advanceViewHelp")
        Help.registerTarget( operationModeControl, "These are two modes to control the system. In manual mode, speed of the motor will be set by the slider above. In Automatic Demo Pattern mode, the system will go through a particular speed profile.", 2, "advanceViewHelp")
        Help.registerTarget( rampRateSlider, "This slider sets the startup ramp speed of the motor. Lower numbers have slower startup speeds. The default ramp rate is 3",4, "advanceViewHelp")
        Help.registerTarget( driveModeContainer, "Selects whether the motor phases are driven with a trapezoidal or pseudo sinusoidal signal. In trapezoidal drive mode it is possible to advance the commutation point towards zero−crossing of the back−EMF signal.",5, "advanceViewHelp")
        Help.registerTarget( hueSlider, "This slider changes the LED color on the motor vortex to a combination of different colors ",6, "advanceViewHelp")
        Help.registerTarget( singleColorSlider, " This slider sets LED light to single color Red, Green or, Blue",7, "advanceViewHelp")
        Help.registerTarget( ledPulseFrequency, "This slider sets the LED pulse frequency in Hertz.",8, "advanceViewHelp")
        // added extra space in the start so that help message is centered in the popup. since this popup is at the corner
        Help.registerTarget( vInGraph, "          Voltage is plotted in real time as the motor spins",9, "advanceViewHelp")
        Help.registerTarget( speedGraph, "RPM is plotted in real time as the motor spins. ",10, "advanceViewHelp")
        Help.registerTarget( faultBox , "Any faults detected by the system will appear in this box.", 11,"advanceViewHelp")
    }

    Rectangle {
        id: leftSide
        width: 600
        height: childrenRect.height
        anchors {
            left: advancedControl.left
            verticalCenter: advancedControl.verticalCenter
        }

        SGLabelledInfoBox {
            id: vInBox
            label: "Vin (volts):"
            info: platformInterface.input_voltage_notification.vin
            infoBoxWidth: 80
            anchors {
                top: leftSide.top
                horizontalCenter: vInGraph.horizontalCenter
            }
        }

        SGLabelledInfoBox {
            id: speedBox
            label: "Current Speed (rpm):"
            info: platformInterface.pi_stats.current_speed
            infoBoxWidth: 100
            anchors {
                top: leftSide.top
                horizontalCenter: speedGraph.horizontalCenter
            }
        }

        SGGraph{
            id: vInGraph
            width: 300
            height: 300
            anchors {
                top: vInBox.bottom
            }
            showOptions: false
            xAxisTitle: "Seconds"
            yAxisTitle: "Voltage"
            inputData: platformInterface.input_voltage_notification.vin
            maxYValue: 15
        }

        SGGraph{
            id: speedGraph
            width: 300
            height: 300
            anchors {
                top: vInBox.bottom
                left: vInGraph.right
            }
            showOptions: false
            xAxisTitle: "Seconds"
            yAxisTitle: "RPM"
            inputData: platformInterface.pi_stats.current_speed
            maxYValue: 6500
        }

        SGStatusListBox {
            id: faultBox
            title: "Faults:"
            anchors {
                top: speedGraph.bottom
                horizontalCenter: leftSide.horizontalCenter
            }
            width: 500
            height: 200
            model: faultModel
        }

        property var errorArray: platformInterface.system_error.error_and_warnings
        onErrorArrayChanged: {
            for (var i in errorArray){
                faultModel.append({ status : errorArray[i] })
            }
        }

        ListModel {
            id: faultModel
            onCountChanged: {
                if (faultModel.count === 0) {
                    basicView.warningVisible = false
                } else {
                    basicView.warningVisible = true
                }
            }
        }
    }

    Rectangle {
        id: rightSide
        width: 600
        height: childrenRect.height
        anchors {
            left: leftSide.right
            verticalCenter: advancedControl.verticalCenter
        }

        Item {
            id: buttonContainer
            width: childrenRect.width
            height: childrenRect.height
            anchors {
                horizontalCenter: rightSide.horizontalCenter
            }

            Button {
                id: startStopButton
                text: checked ? qsTr("Start Motor") : qsTr("Stop Motor")
                checkable: true
                checked: platformInterface.motorState

                property var motorOff: platformInterface.motor_off.enable;
                onMotorOffChanged: {
                    if(motorOff === "off") {
                        startStopButton.checked = true
                    }
                    else {
                        startStopButton.checked = false
                    }
                }

                background: Rectangle {
                    color: startStopButton.checked ? "lightgreen" : "red"
                    implicitWidth: 100
                    implicitHeight: 40
                }

                contentItem: Text {
                    text: startStopButton.text
                    color: startStopButton.checked ? "black" : "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onCheckedChanged: {
                    platformInterface.motorState = checked
                    console.log("in advance", startStopButton.checked)
                    if(checked == false) {
                        faultModel.clear();
                    }
                }
            }

            Button {
                id: resetButton
                anchors {
                    left: startStopButton.right
                    leftMargin: 20
                }
                text: qsTr("Reset")
                onClicked: {
                    resetData()
                    platformInterface.set_reset_mcu.update()
                }
            }
        }

        Rectangle {
            id: operationModeControlContainer
            width: 500
            height: childrenRect.height + 20
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: buttonContainer.bottom
                topMargin: 20
            }

            SGRadioButtonContainer {
                id: operationModeControl
                anchors {
                    top: operationModeControlContainer.top
                    topMargin: 10
                    horizontalCenter: operationModeControlContainer.horizontalCenter
                }

                label: "Operation Mode:"
                labelLeft: true
                exclusive: true
                radioGroup: GridLayout {
                    columnSpacing: 10
                    rowSpacing: 10
                    // Optional properties to access specific buttons cleanly from outside
                    property alias manual : manual
                    property alias automatic: automatic

                    SGRadioButton {
                        id: manual
                        text: "Manual Control"
                        checked: platformInterface.systemMode
                        onCheckedChanged: {
                            if (checked) {
                                console.log("manu adv")
                                platformInterface.systemMode = true
                                platformInterface.motorSpeedSliderValue = 1500
                                targetSpeedSlider.sliderEnable = true
                                targetSpeedSlider.opacity = 1.0
                            }
                            else {
                                console.log("auto adv")
                                platformInterface.systemMode = false
                                targetSpeedSlider.sliderEnable = false
                                targetSpeedSlider.opacity = 0.5
                            }
                        }
                    }

                    SGRadioButton {
                        id: automatic
                        text: "Automatic Demo Pattern"
                        checked : !manual.checked
                    }
                }
            }
        }

        Rectangle {
            id: speedControlContainer
            width: 500
            height: childrenRect.height + 20
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: operationModeControlContainer.bottom
                topMargin: 20
            }

            SGSlider {
                id: targetSpeedSlider
                label: "Target Speed:"
                width: 350
                from : 1500
                to: 4000

                anchors {
                    verticalCenter: setSpeed.verticalCenter
                    left: speedControlContainer.left
                    leftMargin: 10
                    right: setSpeed.left
                    rightMargin: 10
                }

                value :
                {
                    if(platformInterface.motorSpeedSliderValue <= 1500 ){
                        return 1500
                    }
                    if( platformInterface.motorSpeedSliderValue >= 4000 ) {

                        return 4000
                    }
                    return platformInterface.motorSpeedSliderValue

                }

                onValueChanged: {
                    setSpeed.input = value.toFixed(0)
                    var current_slider_value = value.toFixed(0)

                    // Don't change if FAE safety limit is enabled
                    if(current_slider_value >= 4000 && platformInterface.motorSpeedSliderValue >= 4000){
                        console.log("Do nothing")
                    }
                    else if(current_slider_value <= 1500 && platformInterface.motorSpeedSliderValue <= 1500){
                        console.log("Do nothing")
                    }
                    else{
                        platformInterface.motorSpeedSliderValue = current_slider_value
                    }
                }

                MouseArea {
                    id: targetSpeedSliderHover
                    anchors { fill: targetSpeedSlider.children[0] }
                    hoverEnabled: true
                }

                SGToolTipPopup {
                    id: sgToolTipPopup
                    showOn: targetSpeedSliderHover.containsMouse
                    anchors {
                        bottom: targetSpeedSliderHover.top
                        horizontalCenter: targetSpeedSliderHover.horizontalCenter
                    }
                    color: "#0bd"   // Default: "#00ccee"

                    content: Text {
                        text: qsTr("To change values or remove safety\nlimits, contact your FAE.")
                        color: "white"
                    }
                }
            }

            SGSubmitInfoBox {
                id: setSpeed
                infoBoxColor: "white"
                anchors {
                    top: speedControlContainer.top
                    topMargin: 10
                    right: speedControlContainer.right
                    rightMargin: 10
                }
                buttonVisible: false
                onApplied: {
                    platformInterface.motorSpeedSliderValue = parseInt(value, 10)
                }
                infoBoxWidth: 80
            }

            SGSlider {
                id: rampRateSlider
                label: "Ramp Rate:"
                value:{
                    if(platformInterface.rampRateSliderValue < 2) {
                        return 2
                    }
                    if(platformInterface.rampRateSliderValue > 4) {
                        return 4
                    }
                    return platformInterface.rampRateSliderValue
                }
                from: 2
                to:4
                anchors {
                    top: targetSpeedSlider.bottom
                    topMargin: 10
                    left: speedControlContainer.left
                    leftMargin: 10
                    right: setRampRate.left
                    rightMargin: 10
                }
                onValueChanged: {
                    setRampRate.input = value.toFixed(0)
                    var current_slider_value = value.toFixed(0)

                    // Don't change if FAE safety limit is enabled
                    if(current_slider_value >= 4 && platformInterface.rampRateSliderValue >= 4){
                        console.log("Do nothing")
                    }
                    else if(current_slider_value <= 2 && platformInterface.rampRateSliderValue <= 2){
                        console.log("Do nothing")
                    }
                    else {
                        platformInterface.rampRateSliderValue = current_slider_value
                    }
                }
            }

            SGSubmitInfoBox {
                id: setRampRate
                infoBoxColor: "white"
                anchors {
                    top: setSpeed.bottom
                    topMargin: 10
                    right: speedControlContainer.right
                    rightMargin: 10
                }
                buttonVisible: false
                onApplied: {
                    platformInterface.rampRateSliderValue = parseInt(value, 10)
                }
                input: rampRateSlider.value
                infoBoxWidth: 80
            }
        }

        Rectangle {
            id: driveModeContainer
            width: 500
            height: childrenRect.height + 20 // 20 for margins
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: speedControlContainer.bottom
                topMargin: 20
            }

            SGRadioButtonContainer {
                id: driveModeRadios
                anchors {
                    horizontalCenter: driveModeContainer.horizontalCenter
                    top: driveModeContainer.top
                    topMargin: 10
                }
                label: "Drive Mode:"
                radioGroup: GridLayout {
                    columnSpacing: 10
                    rowSpacing: 10

                    // Optional properties to access specific buttons cleanly from outside
                    property alias ps : ps
                    property alias trap: trap
                    SGRadioButton {
                        id: ps
                        text: "Pseudo-Sinusoidal"
                        checked: platformInterface.driveModePseudoSinusoidal
                        onCheckedChanged: {
                            platformInterface.driveModePseudoSinusoidal = ps.checked
                        }
                    }

                    SGRadioButton {
                        id: trap
                        text: "Trapezoidal"
                        checked: platformInterface.driveModePseudoTrapezoidal
                        onCheckedChanged: {
                            platformInterface.driveModePseudoTrapezoidal = trap.checked
                        }
                    }
                }
            }

            Item {
                id: phaseAngleRow
                width: childrenRect.width
                height: childrenRect.height
                anchors {
                    top: driveModeRadios.bottom
                    topMargin: 10
                    horizontalCenter: driveModeContainer.horizontalCenter
                }

                Text {
                    width: contentWidth
                    id: phaseAngleTitle
                    text: qsTr("Phase Angle:")
                    anchors {
                        verticalCenter: driveModeCombo.verticalCenter
                    }
                }

                SGComboBox {
                    id: driveModeCombo
                    currentIndex: platformInterface.phaseAngle
                    model: ["0", "1.875", "3.75","5.625","7.5", "9.375", "11.25","13.125", "15", "16.875", "18.75", "20.625", "22.5" , "24.375" , "26.25" , "28.125"]
                    anchors {
                        top: phaseAngleRow.top
                        left: phaseAngleTitle.right
                        leftMargin: 20
                    }

                    onCurrentIndexChanged: {
                        platformInterface.phaseAngle = currentIndex;
                    }
                }
            }
        }

        Rectangle {
            id: ledControlContainer
            width: 500
            height: childrenRect.height + 10
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: driveModeContainer.bottom
                topMargin: 20
            }

            SGHueSlider {
                id: hueSlider
                label: "Set LED color:"
                labelLeft: true
                value: platformInterface.ledSlider
                anchors {
                    verticalCenter: whiteButton.verticalCenter
                    left: ledControlContainer.left
                    leftMargin: 10
                    right: ledControlContainer.right
                    rightMargin: 10
                    top: ledControlContainer.top
                    topMargin: 10
                }

                onValueChanged: {
                    console.log(" in advance")
                    platformInterface.set_color_mixing.update(hueSlider.color1, hueSlider.color_value1, hueSlider.color2, hueSlider.color_value2)
                    platformInterface.ledSlider = value
                    platformInterface.turnOffChecked = false
                }
            }

            Rectangle {
                id: buttonControlContainer
                color: "transparent"
                anchors{
                    top: hueSlider.bottom
                    topMargin: 10
                    horizontalCenter: ledControlContainer.horizontalCenter
                    horizontalCenterOffset: 40
                }
                width: 300; height: 50

                Button {
                    id: whiteButton
                    checkable: false
                    text: "White"
                    onClicked: {
                        platformInterface.set_led_outputs_on_off.update("white")
                        platformInterface.turnOffChecked = false
                    }
                }

                Button {
                    id: turnOff
                    checkable: true
                    text: checked ? "Turn On" : "Turn Off"
                    anchors {
                        left: whiteButton.right
                        leftMargin: 30
                    }

                    onClicked: {
                        if (checked) {
                            platformInterface.set_led_outputs_on_off.update("off")
                            platformInterface.turnOffChecked = true
                        } else {
                            platformInterface.set_color_mixing.update(hueSlider.color1, hueSlider.color_value1, hueSlider.color2, hueSlider.color_value2)
                            platformInterface.turnOffChecked = false
                        }
                    }
                    checked: platformInterface.turnOffChecked
                }
            }
        }

        Rectangle {
            id: ledSecondContainer
            width: 500
            height: childrenRect.height + 20
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: ledControlContainer.bottom
                topMargin: 20
            }

            SGRGBSlider {
                id: singleColorSlider
                label: "Single LED color:"
                labelLeft: true
                value: platformInterface.singleLEDSlider
                anchors {
                    top: ledSecondContainer.top
                    topMargin: 10
                    left: ledSecondContainer.left
                    leftMargin: 10
                    right: ledSecondContainer.right
                    rightMargin: 10
                }
                onValueChanged: {
                    platformInterface.set_single_color.update(singleColorSlider.color, singleColorSlider.color_value)
                    platformInterface.singleLEDSlider = value
                    platformInterface.turnOffChecked = false
                }
            }

            SGSlider {
                id: ledPulseFrequency
                label: "LED Pulse Frequency:"
                value: platformInterface.ledPulseSlider
                from: 1
                to: 152
                anchors {
                    left: ledSecondContainer.left
                    leftMargin: 10
                    top: singleColorSlider.bottom
                    topMargin: 10
                    right: setLedPulse.left
                    rightMargin: 10
                }
                stepSize: 1.0

                onValueChanged: {
                    platformInterface.set_single_color.update(singleColorSlider.color, singleColorSlider.color_value)
                    setLedPulse.input = value
                    platformInterface.ledPulseSlider = value
                    platformInterface.turnOffChecked = false
                }
            }

            SGSubmitInfoBox {
                id: setLedPulse
                infoBoxColor: "white"
                anchors {
                    right: ledSecondContainer.right
                    rightMargin: 10
                    verticalCenter: ledPulseFrequency.verticalCenter
                }
                buttonVisible: false
                onApplied:  {
                    platformInterface.ledPulseSlider = parseInt(value, 10)
                }
                input: ledPulseFrequency.value
                infoBoxWidth: 80
            }
        }

        Rectangle {
            id: directionControlContainer
            width: 500
            height: childrenRect.height + 20 - directionToolTip.height
            color: "#eeeeee"
            anchors {
                horizontalCenter: rightSide.horizontalCenter
                top: ledSecondContainer.bottom
                topMargin: 20
            }

            SGRadioButtonContainer {
                id: directionRadios
                anchors {
                    horizontalCenter: directionControlContainer.horizontalCenter
                    top: directionControlContainer.top
                    topMargin: 10
                }

                // Optional configuration:
                label: "Direction:"
                radioGroup: GridLayout {
                    columnSpacing: 10
                    rowSpacing: 10

                    SGRadioButton {
                        text: "Forward"
                        checked: true
                        enabled: false
                    }

                    SGRadioButton {
                        text: "Reverse"
                        enabled: false
                    }
                }
            }

            MouseArea {
                id: directionRadiosHover
                anchors { fill: directionRadios }
                hoverEnabled: true
            }

            SGToolTipPopup {
                id: directionToolTip

                showOn: directionRadiosHover.containsMouse
                anchors {
                    bottom: directionRadiosHover.top
                    horizontalCenter: directionRadiosHover.horizontalCenter
                }
                color: "#0bd"   // Default: "#00ccee"

                content: Text {
                    text: qsTr("Reversing direction will damage setup.\nTo remove safety limits, contact your FAE.")
                    color: "white"
                }
            }
        }
    }
}

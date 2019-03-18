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
import "qrc:/views/usb-pd/sgwidgets"

Item {
    id: root

    Item {
        id: controlMargins
        anchors {
            fill: parent
            margins: 15
        }

        SGComboBox {
            id: maxPowerOutput
            label: "Max Power Output:"
            model: ["15","27", "36", "45","60","100"]
            anchors {
                left: parent.left
                leftMargin: 23
                top: parent.top
                topMargin:25
            }

            //when changing the value
            onActivated: {
                console.log("setting max power to ",maxPowerOutput.comboBox.currentText);
                platformInterface.set_usb_pd_maximum_power.update(portNumber,maxPowerOutput.comboBox.currentText)
            }

            //notification of a change from elsewhere
            property var currentMaximumPower: platformInterface.usb_pd_maximum_power.current_max_power
            onCurrentMaximumPowerChanged: {
                if (platformInterface.usb_pd_maximum_power.port === portNumber){
                    maxPowerOutput.currentIndex = maxPowerOutput.comboBox.find( parseInt (platformInterface.usb_pd_maximum_power.current_max_power))
                }

            }


        }


        SGSlider {
            id: currentLimit
            label: "Current limit:"
            from:1
            to:6
            stepSize: 1
            startLabel:"1A"
            endLabel:"6A"
            labelTopAligned: true
            value: {
                if (platformInterface.output_current_exceeds_maximum.port === portNumber){
                    return platformInterface.output_current_exceeds_maximum.current_limit;
                }
                else{
                    return currentLimit.value;
                }

            }
            anchors {
                left: parent.left
                leftMargin: 61
                top: maxPowerOutput.bottom
                topMargin: 15
                right: currentLimitInput.left
                rightMargin: 10
            }

            onSliderMoved: platformInterface.set_over_current_protection.update(portNumber, value)
            onValueChanged: platformInterface.set_over_current_protection.update(portNumber, value)

        }

        SGSubmitInfoBox {
            id: currentLimitInput
            showButton: false
            minimumValue: 1
            maximumValue: 6
            anchors {
                verticalCenter: currentLimit.verticalCenter
                verticalCenterOffset: -7
                right: parent.right
            }
            value:{
               if (platformInterface.output_current_exceeds_maximum.port === portNumber){
                   return platformInterface.output_current_exceeds_maximum.current_limit.toFixed(0)
                }
                else{
                   return currentLimitInput.value;
                 }
            }
            onApplied: platformInterface.set_over_current_protection.update(portNumber, intValue)
        }


        Text {
            id: cableCompensation
            text: "Cable Compensation:"
            font {
                pixelSize: 13
            }
            anchors {
                top: currentLimit.bottom
                topMargin: 20
                left:parent.left
                leftMargin: 10
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
                        cableCompensationButtonStrip.buttonList[0].children[2].checked = true;
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
                        platformInterface.set_cable_loss_compensation.update(portNumber,
                                               1,
                                               0);
                    }
                }

                SGSegmentedButton{
                    id: cableCompensationSetting2
                    text: qsTr("100 mv/A")
                    checkable: true

                    onClicked:{
                        platformInterface.set_cable_loss_compensation.update(portNumber,
                                               1,
                                               100/1000);
                    }
                }

                SGSegmentedButton{
                    id:cableCompensationSetting3
                    text: qsTr("200 mv/A")
                    checkable: true

                    onClicked:{
                        platformInterface.set_cable_loss_compensation.update(portNumber,
                                               1,
                                               200/1000);
                    }
                }
            }
        }

//        Text {
//            id: cableCompensation
//            text: "<b>Cable Compensation</b>"
//            font {
//                pixelSize: 16
//            }
//            anchors {
//                top: div1.bottom
//                topMargin: 10
//            }
//        }

//        SGSlider {
//            id: increment
//            label: "Rate of change:"
//            value:{
//                if (platformInterface.get_cable_loss_compensation.port === portNumber){
//                    return platformInterface.get_cable_loss_compensation.bias_voltage*1000;
//                }
//                else{
//                    return increment.value
//                }
//            }
//            from:.0
//            to:200
//            stepSize: 10
//            toolTipDecimalPlaces: 0
//            labelTopAligned: true
//            startLabel: "0mV/A"
//            endLabel: "200mV/A"
//            anchors {
//                left: parent.left
//                top: cableCompensation.bottom
//                topMargin: 10
//                right: incrementInput.left
//                rightMargin: 10
//            }
//            onSliderMoved:{
//                //console.log("sending values from increment slider:",portNumber, increment.value, platformInterface.get_cable_loss_compensation.bias_voltage);
//                platformInterface.set_cable_compensation.update(portNumber,
//                                       platformInterface.get_cable_loss_compensation.output_current,
//                                       value/1000)
//            }

//        }

//        SGSubmitInfoBox {
//            id: incrementInput
//            showButton: false
//            infoBoxWidth: 35
//            minimumValue: 0
//            maximumValue: 200
//            anchors {
//                verticalCenter: increment.verticalCenter
//                right: parent.right
//            }
//            value:{
//                if (platformInterface.get_cable_loss_compensation.port === portNumber){
//                    return (platformInterface.get_cable_loss_compensation.bias_voltage*1000)
//                }
//                else{
//                    return increment.value
//                }
//            }
//            onApplied:{
//                platformInterface.set_cable_compensation.update(portNumber,
//                           platformInterface.get_cable_loss_compensation.output_current,
//                           incrementInput.floatValue/1000)
//            }

//        }

//        SGSlider {
//            id: bias
//            label: "Per:"
//            value:{
//                if (platformInterface.get_cable_loss_compensation.port === portNumber){
//                    return platformInterface.get_cable_loss_compensation.output_current
//                }
//                else{
//                    return bias.value
//                }
//            }
//            from:.25
//            to:1
//            stepSize: .25
//            labelTopAligned: true
//            startLabel: "0.25A"
//            endLabel: "1A"
//            toolTipDecimalPlaces: 2
//            anchors {
//                left: parent.left
//                leftMargin: 50
//                top: increment.bottom
//                topMargin: 10
//                right: biasInput.left
//                rightMargin: 10
//            }
//            onSliderMoved: {
//                platformInterface.set_cable_compensation.update(portNumber,
//                                                                value,
//                                                                platformInterface.get_cable_loss_compensation.bias_voltage
//                                                                )
//            }

//        }

//        SGSubmitInfoBox {
//            id: biasInput
//            showButton: false
//            minimumValue: 0
//            maximumValue: 1
//            anchors {
//                verticalCenter: bias.verticalCenter
//                right: parent.right
//            }
//            value:{
//                if (platformInterface.get_cable_loss_compensation.port === portNumber){
//                    return platformInterface.get_cable_loss_compensation.output_current
//                }
//                else{
//                    return biasInput.value
//                }
//            }
//            onApplied: platformInterface.set_cable_compensation.update(portNumber,
//                          biasInput.floatValue,
//                          platformInterface.get_cable_loss_compensation.bias_voltage)
//        }



    }
}

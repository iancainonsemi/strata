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
//import tech.spyglass. 1.0
import "qrc:/js/navigation_control.js" as NavigationControl
import "qrc:/views/motor-vortex/sgwidgets"
import "qrc:/js/help_layout_manager.js" as Help

Rectangle {
    id: controlPage
    objectName: "control"
    width: 1200
    height: 725
    color: "white"

    property alias warningVisible: warningBox.visible

    Component.onCompleted: {
        Help.registerTarget(navTabs, "These tabs switch between Basic and Advanced control views. The FAE Only tab is restricted for ON Semiconductor field engineers.", 0, "basicViewHelp")
        Help.registerTarget(motorSpeedControl, "The slider sets motor speed from 1500-4000 rpm" , 1 , "basicViewHelp")
        Help.registerTarget(tachMeterGauge, "The gauge shows the speed of the motor", 3, "basicViewHelp")
        Help.registerTarget(operationModeControl, "These are two modes to control the system. In manual mode, speed of the motor will be set by the slider above. In Automatic Demo Pattern mode, the system will go through a particular speed profile.", 2 , "basicViewHelp")
    }

    // Control Section
    Rectangle {
        id: controlSection1
        width: leftControl.width + rightControl.width + rightControl.anchors.leftMargin
        height: controlPage.height / 2
        anchors {
            verticalCenter: controlPage.verticalCenter
            horizontalCenter: controlPage.horizontalCenter
        }

        Rectangle {
            id: leftControl
            anchors {
                left: controlSection1.left
                top: controlSection1.top
            }
            width: height
            height: controlSection1.height

            SGCircularGauge {
                id: tachMeterGauge
                anchors {
                    fill: leftControl
                }
                gaugeFrontColor1: Qt.rgba(0,1,.25,1)
                gaugeFrontColor2: Qt.rgba(1,0,0,1)
                minimumValue: 0
                maximumValue: 8000
                tickmarkStepSize: 1000
                outerColor: "#999"
                unitLabel: "RPM"
                value: platformInterface.pi_stats.current_speed
                Behavior on value { NumberAnimation { duration: 300 } }
            }
        }

        Rectangle {
            id: rightControl
            anchors {
                left: leftControl.right
                leftMargin: 50
                verticalCenter: leftControl.verticalCenter
            }
            width: 400
            height: motorSpeedControl.height + operationModeControl.height + 40

            SGSlider {
                id: motorSpeedControl
                anchors {
                    left: rightControl.left
                    right: setSpeed.left
                    rightMargin: 10
                    top: rightControl.top
                }
                from: 1500
                to: 4000
                label: "<b>Motor Speed:</b>"
                labelLeft: false
                value:
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
                    //  Don't change if FAE safety limit is enabled
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
            }

            SGSubmitInfoBox {
                id: setSpeed
                infoBoxColor: "white"
                buttonVisible: false
                anchors {
                    verticalCenter: motorSpeedControl.verticalCenter
                    right: rightControl.right
                    rightMargin: 10
                }
                onApplied: {
                    platformInterface.motorSpeedSliderValue = parseInt(value, 10)
                }
                input: motorSpeedControl.value
                infoBoxWidth: 80
            }

            SGRadioButtonContainer {
                id: operationModeControl
                anchors {
                    top: motorSpeedControl.bottom
                    topMargin: 40
                    left: motorSpeedControl.left
                }

                label: "<b>Operation Mode:</b>"
                labelLeft: false
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
                                motorSpeedControl.sliderEnable = true
                                motorSpeedControl.opacity = 1.0
                            }
                            else {
                                console.log("auto adv")
                                platformInterface.systemMode = false
                                motorSpeedControl.sliderEnable = false
                                motorSpeedControl.opacity = 0.5
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
            id: warningBox
            color: "red"
            anchors {
                bottom: rightControl.top
                horizontalCenter: rightControl.horizontalCenter
                bottomMargin: 30
            }
            width: warningText.contentWidth + 100
            height: warningText.contentHeight + 40
            visible: false

            Text {
                id: warningText
                anchors {
                    centerIn: warningBox
                }
                text: "See Advanced Controls for Current Fault Status"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: warningIcon1
                anchors {
                    right: warningText.left
                    verticalCenter: warningText.verticalCenter
                    rightMargin: 10
                }
                text: "\ue80e"
                font.family: icons.name
                font.pixelSize: 40
                color: "white"
            }

            Text {
                id: warningIcon2
                anchors {
                    left: warningText.right
                    verticalCenter: warningText.verticalCenter
                    leftMargin: 10
                }
                text: "\ue80e"
                font.family: icons.name
                font.pixelSize: 40
                color: "white"
            }

            FontLoader {
                id: icons
                source: "sgwidgets/fonts/sgicons.ttf"
            }
        }
    } // end Control Section Rectangle
}

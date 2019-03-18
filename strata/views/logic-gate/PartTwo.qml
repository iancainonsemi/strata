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
import QtQuick.Controls 1.4
import "qrc:/views/logic-gate/sgwidgets"



GridLayout {
    anchors.fill: parent
    anchors.margins: 20
    rowSpacing: 20
    columnSpacing: 20
    flow:  GridLayout.LeftToRight
    property string gateImageSource
    property string value_A: A
    property string value_B: B
    property string value_C: C
    property var value_ANoti
    property var value_BNoti
    property var value_CNoti
    property int currentIndex: 0
    //Reset view for the nl7sz58 tab
    function resetToIndex0(){
        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/nand.png"
        inputAToggleContainer.anchors.topMargin = 10
        inputBToggleContainer.anchors.topMargin = 10
        inputBToggleContainer.anchors.leftMargin = 0
        thirdInput.anchors.topMargin = 80
        // Input 2 Container
        sgStatusLightInputTwo.visible = false
        inputTwoText.visible = true
        inputTwoToggle.visible = true
        currentIndex = 0
        logicSelectionList.index = 0
    }

    Rectangle {
        id: container

        anchors.centerIn: parent
        Layout.fillWidth: true
        Layout.fillHeight: true


        anchors {
            fill: parent
        }

        property var test_case: platformInterface.nl7sz58_io_state
        onTest_caseChanged : {
            if(currentIndex == 0) { //NL7SZ58 NAND
                value_A = "B"
                value_ANoti = platformInterface.nl7sz58_io_state.b
                value_B = "C"
                value_BNoti = platformInterface.nl7sz58_io_state.c
                value_C = "A"
                value_CNoti = platformInterface.nl7sz58_io_state.a
            }

            if(currentIndex == 1) { //NL7SZ58 AND NOT B
                value_A = "B"
                value_ANoti = platformInterface.nl7sz58_io_state.b
                value_B = "C"
                value_BNoti = platformInterface.nl7sz58_io_state.c
                value_C = "A"
                value_CNoti = platformInterface.nl7sz58_io_state.a
            }

            if(currentIndex == 2) { //NL7SZ58 AND NOT C
                value_A = "A"
                value_ANoti = platformInterface.nl7sz58_io_state.a
                value_B = "C"
                value_BNoti = platformInterface.nl7sz58_io_state.c
                value_C = "B"
                value_CNoti = platformInterface.nl7sz58_io_state.b
            }

            if(currentIndex == 3) { //NL7SZ58 OR
                value_A = "A"
                value_ANoti = platformInterface.nl7sz58_io_state.a
                value_B = "C"
                value_BNoti = platformInterface.nl7sz58_io_state.c
                value_C = "B"
                value_CNoti = platformInterface.nl7sz58_io_state.b
            }

            if(currentIndex == 4) { //NL7SZ58 XOR
                value_A = "B"
                value_ANoti = platformInterface.nl7sz58_io_state.b
                value_B = "C"
                value_BNoti = platformInterface.nl7sz58_io_state.c
                value_C = "A"
                value_CNoti = platformInterface.nl7sz58_io_state.b
            }

            if(currentIndex == 5) { //NL7SZ58 Inverter
                value_A = "B"
                value_ANoti = platformInterface.nl7sz58_io_state.b
                value_B = "A"
                value_BNoti = platformInterface.nl7sz58_io_state.a
                value_C = "C"
                value_CNoti = platformInterface.nl7sz58_io_state.c
            }

            if(currentIndex == 6) { //NL7SZ58 Buffer
                value_A = "A"
                value_ANoti = platformInterface.nl7sz58_io_state.a
                value_B = "B"
                value_BNoti = platformInterface.nl7sz58_io_state.b
                value_C = "C"
                value_CNoti = platformInterface.nl7sz58_io_state.c
            }
        }

        // For the Selector Switch Input 2
        property var valueB: value_BNoti
        onValueBChanged: {
            if(valueB === 1) {
                inputTwoToggle.checked = true
            }
            else {
                inputTwoToggle.checked = false
            }
        }

        // For the Selector Switch Input 1
        property var valueA: value_ANoti
        onValueAChanged: {
            if( valueA === 1) {
                inputOneToggle.checked = true
            }
            else {
                inputOneToggle.checked = false
            }
        }

        // For the Selector status light Input 3
        property var valueY:  platformInterface.nl7sz58_io_state.y
        onValueYChanged: {
            if(valueY === 1) {
                sgStatusLight.status = "green"
            }
            else sgStatusLight.status = "off"
        }

        // For the status light output Y
        property var valueC: value_CNoti
        onValueCChanged: {
            if(valueC === 1) {
                sgStatusLightTwo.status = "green"
            }
            else sgStatusLightTwo.status = "off"
        }

        SGSegmentedButtonStrip {
            id: logicSelectionList
            radius: 4
            buttonHeight: 45
            visible: true
            anchors {
                top: parent.top
                topMargin: 40
                horizontalCenter: parent.horizontalCenter
            }

            Component.onCompleted: {
                resetToIndex0();
            }
            segmentedButtons: GridLayout {
                columnSpacing: 1
                /*
              Changing the setting of the page based on which gate it is
            */
                SGSegmentedButton{  //nl7sz58 Nand
                    text: qsTr("NAND")
                    checked: true  // Sets default checked button when exclusive
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/nand.png"
                        inputAToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.top = inputAToggleContainer.bottom
                        inputBToggleContainer.anchors.right = gatesImage.left
                        inputBToggleContainer.anchors.rightMargin = -5
                        thirdInput.anchors.topMargin = 80
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = false
                        inputBToggleContainer.visible = true
                        inputTwoText.visible = true
                        inputTwoToggle.visible = true
                        currentIndex = 0
                        platformInterface.nand.update();
                    }
                }

                SGSegmentedButton{  //nl7sz58 AND NOT B
                    text: qsTr("AND NOTB")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/nand_nb.png"
                        inputAToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.top = inputAToggleContainer.bottom
                        inputBToggleContainer.anchors.right = gatesImage.left
                        inputBToggleContainer.anchors.rightMargin = -5
                        thirdInput.anchors.topMargin = 80
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = false
                        inputTwoText.visible = true
                        inputTwoToggle.visible = true
                        currentIndex = 1;
                        platformInterface.and_nb.update();
                    }
                }

                SGSegmentedButton{  //nl7sz58 AND NOT C
                    text: qsTr("AND NOTC")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/and_nc.png"
                        inputAToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.top = inputAToggleContainer.bottom
                        inputBToggleContainer.anchors.right = gatesImage.left
                        inputBToggleContainer.anchors.rightMargin = -5
                        thirdInput.anchors.topMargin = 80
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = false
                        inputTwoText.visible = true
                        inputTwoToggle.visible = true
                        currentIndex = 2
                        platformInterface.and_nc.update();
                    }
                }

                SGSegmentedButton{  //nl7sz58 OR
                    text: qsTr("OR")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/or.png"
                        inputAToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.topMargin = 20
                        inputBToggleContainer.anchors.top = inputAToggleContainer.bottom
                        inputBToggleContainer.anchors.right = gatesImage.left
                        inputBToggleContainer.anchors.rightMargin = -5
                        thirdInput.anchors.topMargin = 80
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = false
                        inputTwoText.visible = true
                        inputTwoToggle.visible = true
                        currentIndex = 3
                        platformInterface.or.update();
                    }
                }

                SGSegmentedButton{  //nl7sz58 XOR
                    text: qsTr("XOR")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/xor.png"
                        inputAToggleContainer.anchors.topMargin = 10
                        inputBToggleContainer.anchors.topMargin = 20
                        inputBToggleContainer.anchors.top = inputAToggleContainer.bottom
                        inputBToggleContainer.anchors.right = gatesImage.left
                        inputBToggleContainer.anchors.rightMargin = -5
                        thirdInput.anchors.topMargin = 80
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = false
                        inputTwoText.visible = true
                        inputTwoToggle.visible = true
                        currentIndex = 4
                        platformInterface.xor.update();
                    }
                }

                SGSegmentedButton{  //nl7sz58 Inverter
                    text: qsTr("Inverter")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/inverter.png"
                        inputAToggleContainer.anchors.topMargin = 70
                        inputBToggleContainer.anchors.topMargin = 70
                        inputBToggleContainer.anchors.rightMargin = -150
                        thirdInput.anchors.topMargin = 20
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = true
                        inputTwoText.visible = false
                        inputTwoToggle.visible = false
                        currentIndex = 5
                        platformInterface.inverter.update()
                    }
                }

                SGSegmentedButton{  //nl7sz58 Buffer
                    text: qsTr("Buffer")
                    onClicked: {
                        gateImageSource = "qrc:/views/logic-gate/images/nl7sz58/buffer.png"
                        inputAToggleContainer.anchors.topMargin = 70
                        inputBToggleContainer.anchors.topMargin = 70
                        inputBToggleContainer.anchors.rightMargin = -150
                        thirdInput.anchors.topMargin = 20
                        // Input 2 Container
                        sgStatusLightInputTwo.visible = true
                        inputTwoText.visible = false
                        inputTwoToggle.visible = false
                        currentIndex = 6
                        platformInterface.buffer.update();
                    }
                }
            }
        }

        Rectangle {
            id: logicContainer
            width: parent.width/2
            height: parent.height/2

            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            Rectangle {

                anchors.centerIn: parent
                width : parent.width - 100
                height : parent.height - 100

                Rectangle { //Input 1 Container
                    id: inputAToggleContainer
                    width: 100
                    height: 100

                    anchors {
                        right : gatesImage.left
                        top: gatesImage.top
                    }

                    SGSwitch {  //Input 1 switch
                        id: inputOneToggle
                        anchors{
                            verticalCenter: parent.verticalCenter
                        }

                        transform: Rotation { origin.x: 25; origin.y: 25; angle: 270 }

                        onClicked: {
                            if(inputOneText.text === "A") {
                                if(inputOneToggle.checked)  {
                                    platformInterface.write_io.update(1, platformInterface.nl7sz58_io_state.b, platformInterface.nl7sz58_io_state.c)
                                }
                                else {
                                    platformInterface.write_io.update(0, platformInterface.nl7sz58_io_state.b, platformInterface.nl7sz58_io_state.c)
                                }
                            }

                            if(inputOneText.text === "B" ) {
                                // When the function is XOR (index = 4) A = B
                                if(currentIndex === 4) {
                                    if(inputOneToggle.checked)  {
                                        platformInterface.write_io.update(1,1, platformInterface.nl7sz58_io_state.c)
                                    }
                                    else {
                                        platformInterface.write_io.update(0,0, platformInterface.nl7sz58_io_state.c)
                                    }
                                }

                                else {
                                    if(inputOneToggle.checked)  {
                                        console.log("in the else case of its")
                                        platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a,1, platformInterface.nl7sz58_io_state.c)
                                    }
                                    else {
                                        platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a,0, platformInterface.nl7sz58_io_state.c)
                                    }
                                }
                            }

                            if(inputOneText.text === "C") {
                                if(inputOneToggle.checked)  {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a,platformInterface.nl7sz58_io_state.b,1)
                                }
                                else {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a, platformInterface.nl7sz58_io_state.b,0)
                                }
                            }
                        }
                    }

                    Text {  //Input 1 text
                        id: inputOneText
                        text: value_A
                        font.bold: true
                        font.pointSize: 30
                        anchors {
                            left: inputOneToggle.right
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Rectangle { //Input 2 container
                    id: inputBToggleContainer
                    width: 100
                    height: 100

                    anchors {
                        right: gatesImage.left
                        top: inputAToggleContainer.bottom
                    }

                    SGSwitch {  //Input 2 switch
                        id: inputTwoToggle
                        anchors{
                            verticalCenter: parent.verticalCenter
                        }

                        onClicked: {
                            if( inputTwoText.text === "A") {
                                if(inputTwoToggle.checked)  {
                                    platformInterface.write_io.update(1,platformInterface.nl7sz58_io_state.b, platformInterface.nl7sz58_io_state.c)
                                }
                                else {
                                    platformInterface.write_io.update(0,platformInterface.nl7sz58_io_state.b, platformInterface.nl7sz58_io_state.c)
                                }
                            }

                            if(inputTwoText.text === "B") {
                                if(inputTwoToggle.checked)  {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a, 1, platformInterface.nl7sz58_io_state.c)
                                }
                                else {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a, 0, platformInterface.nl7sz58_io_state.c)
                                }
                            }

                            if(inputTwoText.text === "C") {
                                if(inputTwoToggle.checked)  {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a,platformInterface.nl7sz58_io_state.b,1)
                                }
                                else {
                                    platformInterface.write_io.update(platformInterface.nl7sz58_io_state.a,platformInterface.nl7sz58_io_state.b,0)
                                }
                            }
                        }

                        transform: Rotation { origin.x: 25; origin.y: 25; angle: 270 }
                    }

                    Text {  //Input 2 text
                        id: inputTwoText
                        text: value_B
                        font.bold: true
                        font.pointSize: 30
                        anchors {
                            left: inputTwoToggle.right
                            //  horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                        }
                    }

                    SGStatusLight { //Input 2 status light
                        id: sgStatusLightInputTwo
                        label: "<b>" + value_B + "</b>" // Default: "" (if not entered, label will not appear)
                        lightSize: 50
                        textColor: "black"
                        status : "off"
                    }
                }

                Image { //Center Image
                    id: gatesImage
                    source: gateImageSource
                    anchors {
                        top: parent.top
                        centerIn: parent
                    }
                    fillMode: Image.PreserveAspectFit
                }

                Rectangle { //Input 3 Container
                    id: thirdInput
                    width: 50
                    height: 50
                    anchors {
                        left: gatesImage.right
                        top: inputAToggleContainer.top
                        topMargin: 70
                    }

                    SGStatusLight { //Input 3 status light
                        id: sgStatusLight
                        label: "<b>Y</b>" // Default: "" (if not entered, label will not appear)
                        lightSize: 50
                        textColor: "black"
                        status : "off"
                    }
                }

                Rectangle { //Output Y Container
                    id: fourInputContainer
                    width: 50
                    height: 50
                    anchors {
                        top: gatesImage.bottom
                        horizontalCenter: gatesImage.horizontalCenter
                        horizontalCenterOffset: -30
                    }

                    SGStatusLight { //Output status light
                        id: sgStatusLightTwo
                        label: value_C // Default: "" (if not entered, label will not appear)
                        lightSize: 50
                        textColor: "black"
                        status : "off"
                    }
                }
            } // inside Rectangle
        }
    }
}

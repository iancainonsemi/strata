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
import "qrc:/../SGAccordion/"
import "qrc:/../SGSwitch/"
import "qrc:/../SGSlider/"
import "qrc:/../SGSegmentedButtonStrip/"
import "qrc:/../SGCircularGauge/"
import "qrc:/../SGComboBox/"
import "qrc:/../SGGraphTimed/"
import "qrc:/../SGGraphStatic/"
import "qrc:/../SGLabelledInfoBox/"
import "qrc:/../SGOutputLogBox/"
import "qrc:/../SGPopout/"
import "qrc:/../SGRadioButton/"
import "qrc:/../SGStatusLight/"
import "qrc:/../SGStatusListBox/"
import "qrc:/../SGSubmitInfoBox/"
import "qrc:/../SGToolTipPopup/"
import "qrc:/../SGCapacityBar/"
import "qrc:/../SGHueSlider/"
import "qrc:/../SGRGBSlider/"
import "qrc:/../SGDrawerMenu/"

Window {
    id: mainWindow
    visible: true
    width: 1200
    height: 900
    title: qsTr("SpyGlass Widget Gallery")


    SGDrawerMenu {
        id: sgDrawerMenu
        z:20

        drawerMenuItems: Item {

            SGDrawerMenuItem {
                label: "Users"
                icon:"\u0045"
                contentDrawerWidth: 250
                drawerContent: Text {
                    text: "<b>Users</b>"
                    font {
                        pixelSize: 50
                    }
                    color: "#fff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            SGDrawerMenuItem {
                label: "Chat"
                icon:"\u003B"
                drawerColor: "lightsalmon"
                drawerContent: Text {
                    text: "<b>Chat</b>"
                    font {
                        pixelSize: 50
                    }
                    color: "#fff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            SGDrawerMenuItem {
                label: "Help"
                icon:"\ue808"
                drawerColor: "burlywood"
                contentDrawerWidth: 400
                drawerContent: Text {
                    text: "<b>Help</b>"
                    font {
                        pixelSize: 50
                    }
                    color: "#fff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            SGDrawerMenuItem {
                drawerColor: "lightgreen"
                divider: false
                contentDrawerWidth: 350
                drawerContent: Text {
                    text: "<b>Settings</b>"
                    font {
                        pixelSize: 50
                    }
                    color: "#fff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    SGAccordion {
        id: accordion

        width: mainWindow.width - sgDrawerMenu.hintWidth
        height: mainWindow.height

        // accordionItems contains a ColumnLayout as a container for SGAccordionItems
        accordionItems:   Column { // must have ColumnLayout as container since loader works only with single widgets
            spacing: 0

            SGAccordionItem {
                title: "SG Switch"
                open: false

                // contents contains SGAccordionItem content
                contents: Item {  // must have some Item as container for multiple widgets since loader only works with single widgets
                    height: childrenRect.height + 40

                    SGSwitch {
                        id: sgSwitch

                        // Optional Configuration:
                        label: "<b>Switch:</b>"         // Default: "" (if not entered, label will not appear)
                        labelLeft: false                // Default: true
                        checkedLabel: "Switch On"       // Default: "" (if not entered, label will not appear)
                        uncheckedLabel: "Switch Off"    // Default: "" (if not entered, label will not appear)
                        switchWidth: 84                 // Default: 52 (change for long custom checkedLabels when labelsInside)

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        onCheckedChanged: console.log("Switch toggled")
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Tool Tip Popup"

                contents: Item{
                    height: childrenRect.height + 40

                    Rectangle {
                        id: hoverContainer
                        color: "tomato"
                        height: 50
                        width: hoverText.contentWidth + 40

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 40
                        }

                        Text {
                            id: hoverText
                            text: qsTr("Hover Here")
                            color: "white"
                            anchors {  centerIn: parent }
                        }

                        MouseArea {
                            id: hoverArea
                            anchors { fill: parent }
                            hoverEnabled: true
                        }

                        SGToolTipPopup {
                            id: sgToolTipPopup

                            showOn: hoverArea.containsMouse
                            anchors {
                                bottom: hoverText.top
                                horizontalCenter: hoverText.horizontalCenter
                            }
                            z:50

                            // Optional Configuration:
                            radius: 8       // Default: 5 (0 for square)
                            color: "#0ce"   // Default: "#00ccee"

                            // Content can contain any single object (which can have nested objects within it)
                            content: Text {
                                text: qsTr("This is a SGToolTipPopup")
                                color: "white"
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Slider"

                contents: Item{
                    height: childrenRect.height + 40

                    SGSlider {
                        id: sgSliderCustom
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        label: "RPM:"              // Default: "" (if not entered, label will not appear)
                        labelLeft: false             // Default: true
                        width: 300
                        grooveColor: "#ddd"   // Default: "#dddddd"
                        grooveFillColor: "lightgreen"      // Default: "#888888"
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Radio Button"

                contents: Item{
                    height: childrenRect.height + 40

                    SGRadioButtonContainer {
                        id: buttons

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        // Optional configuration:
                        label: "<b>Radio Buttons:</b>" // Default: "" (will not appear if not entered)
                        labelLeft: false

                        radioGroup: GridLayout {
                            columnSpacing: 10
                            rowSpacing: 10
                            columns: 1          // Comment this line for horizontal row layout

                            property alias ps : ps
                            property alias trap: trap
                            property alias square: square

                            SGRadioButton {
                                id: ps
                                text: "Pseudo-Sinusoidal"
                                checked: true
                                onCheckedChanged: { if (checked) console.log ( "PS Checked!") }
                            }

                            SGRadioButton {
                                id: trap
                                text: "Trapezoidal"
                                onCheckedChanged: { if (checked) console.log ( "Trap Checked!") }
                                enabled: false
                            }

                            SGRadioButton {
                                id: square
                                text: "Square"
                                onCheckedChanged: { if (checked) console.log ( "Square Checked!") }
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Segmented Button Strip"

                contents: Item{
                    height: childrenRect.height + 40

                    SGSegmentedButtonStrip {
                        id: segmentedButtonsExample

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        label: "Input:"                 // Default: "" (will not appear if not entered)
                        labelLeft: false                // Default: true (true: label on left, false: label on top)

                        segmentedButtons: GridLayout {
                            columnSpacing: 2

                            SGSegmentedButton{
                                text: qsTr("DVD")
                                checked: true  // Sets default checked button when exclusive
                            }

                            SGSegmentedButton{
                                text: qsTr("Blu-Ray")
                            }

                            SGSegmentedButton{
                                text: qsTr("VHS")
                            }

                            SGSegmentedButton{
                                text: qsTr("Radio")
                            }

                            SGSegmentedButton{
                                text: qsTr("Betamax")
                                enabled: false
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Status Light"

                contents: Item{
                    height: childrenRect.height + 40

                    SGStatusLight {
                        id: sgStatusLight
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        label: "<b>Status:</b>" // Default: "" (if not entered, label will not appear)
                        labelLeft: false        // Default: true

                        // Useful Signals:
                        onStatusChanged: console.log("Changed to " + status)
                    }


                    Button {
                        id: switchStatus
                        anchors {
                            left: sgStatusLight.right
                            leftMargin: 40
                            verticalCenter: sgStatusLight.verticalCenter
                        }
                        property real status: 0
                        text: "Switch Status"
                        onClicked: {
                            if (status > 3) { status = 0 } else { status++ }
                            switch (status) {
                                case 1:
                                    sgStatusLight.status = "green"
                                    break;
                                case 2:
                                    sgStatusLight.status = "yellow"
                                    break;
                                case 3:
                                    sgStatusLight.status = "orange"
                                    break;
                                case 4:
                                    sgStatusLight.status = "red"
                                    break;
                                default:
                                    sgStatusLight.status = "off"
                                    break;
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Submit Info Box"

                contents: Item{
                    height: childrenRect.height + 40

                    SGSubmitInfoBox {
                        id: applyInfoBox

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        value: "6"    // String to this to be displayed in box
                        infoBoxWidth: 80            // Must be set by user based on their needs

                        label: "Voltage:"       // Default: "" (if not entered, label will not appear)
                        labelLeft: false                 // Default: true (if false, label will be on top)
                        realNumberValidation: true      // Default: false (set true to restrict enterable values to real numbers)
                        buttonText: "Apply"
                        showButton: true
                        unit: "V"

                        onApplied: console.log("Applied string value is " + value)
                    }

                }
            }

            SGAccordionItem {
                open: false
                title: "SG Status List Box"

                contents: Item{
                    height: childrenRect.height + 40
                    SGStatusListBox{
                        id: logBox
                        model: demoModel
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                        title: "Status List"            // Default: "" (title bar will not be visible when empty string)
                        statusTextColor: "#777777"      // Default: "#000000" (black)
                    }

                    ListModel {
                        id: demoModel
                        ListElement {
                            status: "Port 1 Temperature: 71°C"
                        }
                    }

                    Button{
                        id: debugButton
                        text: "Add to model"
                        anchors {
                            top: logBox.bottom
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                        onClicked: {
                            demoModel.append({ "status" : Date.now() + " fault" });
                        }
                    }

                    Button{
                        text: "Remove from model"
                        x: 200
                        anchors {
                            bottom: debugButton.bottom
                            left: debugButton.right
                            leftMargin: 10
                        }
                        onClicked: {
                            if (demoModel.count > 0) {
                                demoModel.remove(demoModel.count-1);
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Popout"

                contents: Item{
                    height: childrenRect.height + 40

                    SGPopout {
                        id: popout1
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                        title: "Popout 1"
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Labelled Info Box"

                contents: Item{
                    height: childrenRect.height + 40

                    SGLabelledInfoBox {
                        id: defaultLabelledInfoBox
                        infoBoxWidth: 70
                        label: "Speed:"
                        info: "40 rpm"
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Graph Timed"

                contents: Item{
                    height: childrenRect.height + 40

                    SGGraphTimed {
                        // ChartView needs to be run in a QApplication, not the default QGuiApplication
                        // https://stackoverflow.com/questions/34099236/qtquick-chartview-qml-object-seg-faults-causes-qml-engine-segfault-during-load
                        id: graphtimed

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        height: 300
                        width: 300

                        inputData: graphData.stream          // Set the graph's data source here

                        title: "<b>Graph</b>"                  // Default: empty
                        xAxisTitle: "Seconds"           // Default: empty
                        yAxisTitle: "Why Axes"          // Default: empty
                        minYValue: 0                    // Default: 0
                        maxYValue: 20                   // Default: 10
                        minXValue: 0                    // Default: 0
                        maxXValue: 5                    // Default: 10
                        showXGrids: false               // Default: false
                        showYGrids: true                // Default: false
                    }

                    SGSwitch {
                        id: graphSwitch
                        label: "Demo Data"
                        checked: false
                        anchors {
                            left: graphtimed.right
                            leftMargin: 40
                            verticalCenter: graphtimed.verticalCenter
                        }
                    }

                    // Sends demo data stream with adjustible timing interval output
                    Timer {
                        id: graphData
                        property real stream
                        property real count: 0
                        interval: 100
                        running: graphSwitch.checked
                        repeat: true
                        onTriggered: {
                            count += interval;
                            stream = Math.sin(count/500)*10+10;
                        }
                    }
                }
            }
            SGAccordionItem {
                open: false
                title: "SG Graph Static"

                contents: Item{
                    height: childrenRect.height + 40

                    SGGraphStatic {
                        // ChartView needs to be run in a QApplication, not the default QGuiApplication
                        // https://stackoverflow.com/questions/34099236/qtquick-chartview-qml-object-seg-faults-causes-qml-engine-segfault-during-load
                        id: graphstatic

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        height: 300
                        width: 300

                        // Optional graph settings:
                        title: "Graph"                  // Default: empty
                        xAxisTitle: "X axis"           // Default: empty
                        yAxisTitle: "Why axis"          // Default: empty
                        dataLine1Color: "cyan"          // Default: #000000 (black)
                        minYValue: 0                    // Default: 0
                        maxYValue: 20                   // Default: 10
                        minXValue: 0                    // Default: 0
                        maxXValue: 20                    // Default: 10
                        showXGrids: false               // Default: false
                        showYGrids: true                // Default: false

                        Component.onCompleted: {
                            for (var i = 0; i < 20; i=(i+.1)){
                                series1.append(i, Math.sin(i) * 5 +10)
                            }
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Combo Box"

                contents: Item{
                    height: childrenRect.height + 40

                    SGComboBox {
                        id: sgComboBox
                        model: ["Amps", "Volts", "Watts"]

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                        label: "<b>ComboBox:</b>"   // Default: "" (if not entered, label will not appear)
                        labelLeft: false            // Default: true
                        comboBoxWidth: 150          // Default: 120 (set depending on model info length)
                        textColor: "black"          // Default: "black"
                        indicatorColor: "#aaa"      // Default: "#aaa"
                        borderColor: "#aaa"         // Default: "#aaa"
                        boxColor: "white"           // Default: "white"
                        dividers: true              // Default: false

                        onActivated: console.log("item " + index + " activated")
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Circular Gauge"

                contents: Item{
                    height: childrenRect.height + 40

                    SGCircularGauge {
                        id: sgCircularGauge
                        //value: data.stream

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        // Optional Configuration:
                        value: gaugecontrol.value
                        minimumValue: 0
                        maximumValue: 100
                        tickmarkStepSize: 10
                        gaugeRearColor: "#ddd"
                        centerColor: "black"
                        outerColor: "#999"
                        gaugeFrontColor1: Qt.rgba(0,.75,1,1)
                        gaugeFrontColor2: Qt.rgba(1,0,0,1)
                        unitLabel: "RPM"                        // Default: "RPM"
                    }

                    SGSlider {
                        id: gaugecontrol
                        label: "Demo Control:"
                        labelLeft: false
                        live: true
                        anchors {
                            left: sgCircularGauge.right
                            leftMargin: 40
                            verticalCenter: sgCircularGauge.verticalCenter
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Capacity Bar"

                contents: Item{
                    height: childrenRect.height + 40

                    SGCapacityBar {
                        id: capacityBar

                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }

                        label: "<b>Load Capacity:</b>"  // Default: "" (if not entered, label will not appear)
                        labelLeft: false
                        showThreshold: true             // Default: false
                        thresholdValue: 80              // Default: maximumValue

                        gaugeElements: Row {
                            id: container
                            property real totalValue: childrenRect.width // Necessary for over threshold detection signal

                            SGCapacityBarElement{
                                color: "#7bdeff"
                                value: graphData2.stream1
                            }

                            SGCapacityBarElement{
                                color: "#c6e78f"
                                value: graphData2.stream2
                            }
                        }

                        // Usable Signals:
                        onOverThreshold: console.log("Over Threshold!")
                    }

                    SGSwitch {
                        id: capBarSwitch
                        label: "Demo Data"
                        checked: false
                        anchors {
                            left: capacityBar.right
                            leftMargin: 40
                            verticalCenter: capacityBar.verticalCenter
                        }
                    }

                    // Sends demo data stream with adjustible timing interval output
                    Timer {
                        id: graphData2
                        property real stream1
                        property real stream2
                        property real count: 0
                        interval: 100
                        running: capBarSwitch.checked
                        repeat: true
                        onTriggered: {
                            count += interval;
                            stream1 = Math.sin(count/500)*10+50;
                            stream2 = Math.sin((count-800)/500)*10+25;
                        }
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG Hue Slider"

                contents: Item{
                    height: childrenRect.height + 40

                    SGHueSlider {
                        label: "Hue Slider"
                        labelLeft: false
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                        onValueChanged: console.log(color1, color_value1, color2, color_value2)
                    }
                }
            }

            SGAccordionItem {
                open: false
                title: "SG RGB Slider"

                contents: Item{
                    height: childrenRect.height + 40

                    SGRGBSlider {
                        label: "RGB Slider"
                        labelLeft: false
                        anchors {
                            top: parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20
                        }
                    }
                }
            }
        }
    }
}

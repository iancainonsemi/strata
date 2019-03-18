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
import QtQuick.Layouts 1.3  //for gridLayout
import "qrc:/views/usb-pd-multiport/sgwidgets"

Item {
    id:advanceControlsView

    property int buildInTime: 500

    function transitionToAdvancedView(){
        //set the opacity of the view to be seen, but set the opacity of the parts to 0
        advanceControlsView.opacity = 1;
        topDivider.opacity = 0;
        maxOutputPower.opacity = 0;
        currentLimitText.opacity = 0;
        currentLimitSlider.opacity = 0
        cableCompensationText.opacity = 0
        outputBiasText.opacity = 0;
        cableCompensationDivider.opacity = 0;
        cableCompensationHeaderText.opacity = 0
        cableCompensationIncrementSlider.opacity = 0
        outputBiasSlider.opacity = 0;

        graphDivider.opacity = 0
        showGraphText.opacity = 0;
        graphSelector.opacity = 0;
        capabilitiesDivider.opacity = 0;
        sourceCapabilitiesText.opacity = 0;
        sourceCapabilitiesButtonStrip.opacity = 0;

        advancedPortControlsBuildIn.start()
    }

    SequentialAnimation{
        id: advancedPortControlsBuildIn
        running: false

        PropertyAnimation {
            targets: [topDivider, maxOutputPower, currentLimitText, currentLimitSlider ]
            property: "opacity"
            from: 0
            to: 1
            duration: buildInTime
        }

        PropertyAnimation {
            targets: [cableCompensationDivider,cableCompensationHeaderText,cableCompensationText, outputBiasText, cableCompensationIncrementSlider,outputBiasSlider]
            property: "opacity"
            to: 1
            duration: buildInTime
        }

        PropertyAnimation {
            id: fadeInGraphsSection
            targets: [graphDivider,showGraphText,graphSelector]
            property: "opacity"
            to: 1
            duration: buildInTime
        }
        PropertyAnimation {
            id: fadeInSourceCapibilitiesSection
            targets: [capabilitiesDivider,sourceCapabilitiesText,sourceCapabilitiesButtonStrip]
            property: "opacity"
            to: 1
            duration: buildInTime
        }

        onStopped: {
            //console.log("finished advanced build-in")
        }

    }

    function transitionToBasicView(){
        //set the opacity of the view to be seen, but set the opacity of the parts to 0
        advanceControlsView.opacity = 0;
        topDivider.opacity = 0;
        maxOutputPower.opacity = 0;
        currentLimitText.opacity = 0;
        currentLimitSlider.opacity = 0
        cableCompensationText.opacity = 0
        outputBiasText.opacity = 0;
        cableCompensationDivider.opacity = 0;
        cableCompensationHeaderText.opacity = 0
        cableCompensationIncrementSlider.opacity = 0
        outputBiasSlider.opacity = 1;

        graphDivider.opacity = 0
        showGraphText.opacity = 0;
        graphSelector.opacity = 0;
        capabilitiesDivider.opacity = 0;
        sourceCapabilitiesText.opacity = 0;
        sourceCapabilitiesButtonStrip.opacity = 0;

        //do we want a build-out here?
        //advancedPortControlsBuildIn.start()
    }

    Rectangle{
        id:topDivider
        anchors.left: advanceControlsView.left
        anchors.right:advanceControlsView.right
        anchors.top: advanceControlsView.top
        anchors.topMargin: 10
        height: 1
        color:"grey"
    }

    SGComboBox {
        id: maxOutputPower
        label: "Max Output Power:"
        model: ["15","27", "36", "45","60","100"]
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            right: advanceControlsView.right
            rightMargin: 10
            top: topDivider.bottom
            topMargin: 5
        }
        comboBoxWidth: 70
        comboBoxHeight: 25
        //when changing the value
        onActivated: {
            console.log("setting input power foldback to ",limitOutput.comboBox.currentText);
            //platformInterface.set_input_voltage_foldback.update(platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_enabled,
           //                                                     platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage,
            //                                                             limitOutput.comboBox.currentText)
        }

        property var currentFoldbackOuput: platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power
        onCurrentFoldbackOuputChanged: {
            //console.log("got a new min power setting",platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power);
            //limitOutput.currentIndex = limitOutput.comboBox.find( parseInt (platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power))
        }


    }

    Text{
        id:currentLimitText
        text:"Current Limit:"
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            top: maxOutputPower.bottom
            topMargin: 5
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    SGSlider {
        id: currentLimitSlider
        //value: platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            top: currentLimitText.bottom
            topMargin: 3
            right: advanceControlsView.right
            rightMargin: 10
        }
        from: 0
        to: 100
        startLabel: "0A"
        endLabel: "100V"
        //copy the current values for other stuff, and add the new slider value for the limit.
        onMoved: platformInterface.set_input_voltage_foldback.update(platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_enabled,
                         value,
                        platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power)
    }

    Rectangle{
        id:cableCompensationDivider
        anchors.left: advanceControlsView.left
        anchors.right:advanceControlsView.right
        anchors.top: currentLimitSlider.bottom
        anchors.topMargin: 3
        height: 1
        color:"grey"
    }

    Text{
        id:cableCompensationHeaderText
        text:"CABLE COMPENSATION"
        font.bold:true
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            top: cableCompensationDivider.bottom
            topMargin: 10
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    Text{
        id:cableCompensationText
        text:"For every increment of:"
        anchors {
            left: advanceControlsView.left
            leftMargin: 20
            top: cableCompensationHeaderText.bottom
            topMargin: 10
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    SGSlider {
        id: cableCompensationIncrementSlider
        //value: platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage
        anchors {
            left: advanceControlsView.left
            leftMargin: 20
            top: cableCompensationText.bottom
            topMargin: 5
            right: advanceControlsView.right
            rightMargin: 10
        }
        from: 0
        to: 100
        startLabel: "0A"
        endLabel: "100V"
        //copy the current values for other stuff, and add the new slider value for the limit.
        onMoved: platformInterface.set_input_voltage_foldback.update(platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_enabled,
                         value,
                        platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power)
    }

    Text{
        id:outputBiasText
        text:"Bias output by:"
        anchors {
            left: advanceControlsView.left
            leftMargin: 20
            top: cableCompensationIncrementSlider.bottom
            topMargin: 10
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    SGSlider {
        id: outputBiasSlider
        //value: platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage
        anchors {
            left: advanceControlsView.left
            leftMargin: 20
            top: outputBiasText.bottom
            topMargin: 5
            right: advanceControlsView.right
            rightMargin: 10
        }
        from: 0
        to: 100
        startLabel: "0A"
        endLabel: "100V"
        //copy the current values for other stuff, and add the new slider value for the limit.
        onMoved: platformInterface.set_input_voltage_foldback.update(platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_enabled,
                         value,
                        platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power)
    }

    Rectangle{
        id:graphDivider
        anchors.left: advanceControlsView.left
        anchors.right:advanceControlsView.right
        anchors.top: outputBiasSlider.bottom
        anchors.topMargin: 3
        height: 1
        color:"grey"
    }

    Text{
        id:showGraphText
        text:"GRAPHS:"
        font.bold:true
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            top: graphDivider.bottom
            topMargin: 3
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    SGSegmentedButtonStrip {
        id: graphSelector
        //label: "<b>Show Graphs:</b>"
        labelLeft: false
        anchors {
            top: showGraphText.bottom
            topMargin: 5
            horizontalCenter: advanceControlsView.horizontalCenter
        }
        textColor: "#666"
        activeTextColor: "white"
        radius: 4
        buttonHeight: 25
        exclusive: false
        buttonImplicitWidth: 5
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

    Rectangle{
        id:capabilitiesDivider
        anchors.left: advanceControlsView.left
        anchors.right:advanceControlsView.right
        anchors.top: graphSelector.bottom
        anchors.topMargin: 3
        height: 1
        color:"grey"
    }

    Text{
        id:sourceCapabilitiesText
        text:"SOURCE CAPABILITIES:"
        font.bold:true
        anchors {
            left: advanceControlsView.left
            leftMargin: 10
            top: capabilitiesDivider.bottom
            topMargin: 3
            right: advanceControlsView.right
            rightMargin: 10
        }
    }

    SGSegmentedButtonStrip {
        id: sourceCapabilitiesButtonStrip
        anchors {
            left: advanceControlsView.left
            top: sourceCapabilitiesText.bottom
            topMargin: 3
            verticalCenter: advanceControlsView.verticalCenter
        }
        textColor: "#666"
        activeTextColor: "white"
        radius: 4
        buttonHeight: 30
        buttonImplicitWidth: 15
        hoverEnabled: false

        property var sourceCapabilities: platformInterface.usb_pd_advertised_voltages_notification.settings

        onSourceCapabilitiesChanged:{

            //the strip's first child is the Grid layout. The children of that layout are the buttons in
            //question. This makes accessing the buttons a little bit cumbersome since they're loaded dynamically.
            if (platformInterface.usb_pd_advertised_voltages_notification.port === portNumber){
                //console.log("updating advertised voltages for port ",portNumber)
                //disable all the possibilities
                sourceCapabilitiesButtonStrip.buttonList[0].children[6].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[5].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[4].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[3].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[2].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[1].enabled = false;
                sourceCapabilitiesButtonStrip.buttonList[0].children[0].enabled = false;

                var numberOfSettings = platformInterface.usb_pd_advertised_voltages_notification.number_of_settings;
                if (numberOfSettings >= 7){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].text = platformInterface.usb_pd_advertised_voltages_notification.settings[6].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].text += platformInterface.usb_pd_advertised_voltages_notification.settings[6].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[6].text = "NA";
                }

                if (numberOfSettings >= 6){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].text = platformInterface.usb_pd_advertised_voltages_notification.settings[5].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].text += platformInterface.usb_pd_advertised_voltages_notification.settings[5].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[5].text = "NA";
                }

                if (numberOfSettings >= 5){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].text = platformInterface.usb_pd_advertised_voltages_notification.settings[4].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].text += platformInterface.usb_pd_advertised_voltages_notification.settings[4].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[4].text = "NA";
                }

                if (numberOfSettings >= 4){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].text = platformInterface.usb_pd_advertised_voltages_notification.settings[3].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].text += platformInterface.usb_pd_advertised_voltages_notification.settings[3].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[3].text = "NA";
                }

                if (numberOfSettings >= 3){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].text = platformInterface.usb_pd_advertised_voltages_notification.settings[2].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].text += platformInterface.usb_pd_advertised_voltages_notification.settings[2].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[2].text = "NA";
                }

                if (numberOfSettings >= 2){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text = platformInterface.usb_pd_advertised_voltages_notification.settings[1].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text += platformInterface.usb_pd_advertised_voltages_notification.settings[1].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text = "NA";
                }

                if (numberOfSettings >= 1){
                    sourceCapabilitiesButtonStrip.buttonList[0].children[0].enabled = true;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[0].text = platformInterface.usb_pd_advertised_voltages_notification.settings[0].voltage;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[0].text += "V, ";
                    sourceCapabilitiesButtonStrip.buttonList[0].children[0].text += platformInterface.usb_pd_advertised_voltages_notification.settings[0].maximum_current;
                    sourceCapabilitiesButtonStrip.buttonList[0].children[0].text += "A";
                }
                else{
                    sourceCapabilitiesButtonStrip.buttonList[0].children[1].text = "NA";
                }

            }
        }

        segmentedButtons: GridLayout {
            id:advertisedVoltageGridLayout
            columnSpacing: 2

            SGSegmentedButton{
                id: setting1
                text: qsTr("5V\n3A")
                checkable: false
            }

            SGSegmentedButton{
                id: setting2
                text: qsTr("7V\n3A")
                checkable: false
            }

            SGSegmentedButton{
                id:setting3
                text: qsTr("8V\n3A")
                checkable: false
            }

            SGSegmentedButton{
                id:setting4
                text: qsTr("9V\n3A")
                //enabled: false
                checkable: false
            }

            SGSegmentedButton{
                id:setting5
                text: qsTr("12V\n3A")
                enabled: false
                checkable: false
            }

            SGSegmentedButton{
                id:setting6
                text: qsTr("15V\n3A")
                enabled: false
                checkable: false
            }

            SGSegmentedButton{
                id:setting7
                text: qsTr("20V\n3A")
                enabled: false
                checkable: false
            }
        }
    }

}

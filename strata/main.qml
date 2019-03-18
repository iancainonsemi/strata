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

import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import "js/navigation_control.js" as NavigationControl
import "js/uuid_map.js" as UuidMap
import "qrc:/js/platform_selection.js" as PlatformSelection
import "qrc:/js/help_layout_manager.js" as Help

import "qrc:/js/platform_model.js" as Model

Window {
    id: mainWindow
    visible: true
    width: 1200
    height: 900
    minimumHeight: 768-40 // -40 for Win10 taskbar height
    minimumWidth: 1024
    title: qsTr("ON Semiconductor: Strata Developer Studio")
    property string versionNumber: "Strata 1.1.0 Build 1"  // For About Strata Popup

    // Debug option(s)
    property bool is_remote_connected: false

    /****
      TO HIDE THE DEBUG SET THE BELOW PROPERTY TO FALSE
    ***/
    property bool debug_menu_enabled: false

    Component.onCompleted: {
        console.log("Initializing")
        NavigationControl.init(flipable,controlContainer, contentContainer, statusBarContainer)
        Help.registerWindow(mainWindow)
    }

    onClosing: {    // @disable-check M16
        if(is_remote_connected) {
            // sending remote disconnect message to hcs
            var remote_disconnect_json = {
                "hcs::cmd":"remote_disconnect",
            }
            coreInterface.sendCommand(JSON.stringify(remote_disconnect_json))

            console.log("UI -> HCS ", JSON.stringify(remote_disconnect_json))
        }

        var remote_json = {
            "hcs::cmd":"advertise",
            "payload": {
                "advertise_platforms":false
            }
        }
        console.log("asking hcs to advertise the platforms",JSON.stringify(remote_json))
        coreInterface.sendCommand(JSON.stringify(remote_json))
        // End session with HCS
        coreInterface.unregisterClient();

        // Destruct components dynamically created by NavigationControl
        NavigationControl.removeView(statusBarContainer)
        NavigationControl.removeView(controlContainer)
        NavigationControl.removeView(contentContainer)
    }

    Settings {
        id: mainWindowSettings

        category: "MainWindow"

        property alias x: mainWindow.x
        property alias y: mainWindow.y
        property alias width: mainWindow.width
        property alias height: mainWindow.height
    }

    Column {
        id: view
        spacing: 0
        anchors.fill: parent

        Rectangle {
            id: statusBarContainer
            height: visible ? 40 : 0
            width: parent.width

            property real windowHeight: mainWindow.height  // for centering popups spawned from the statusbar
            property bool showDebug: false;  // for linking debug in status bar to the debug bar
            property alias versionNumber: mainWindow.versionNumber
        }

        Flipable {
            id: flipable
            height: parent.height - statusBarContainer.height
            width: parent.width

            property bool flipped: false
            property real statusBarHeight: statusBarContainer.height // for spawning drawers in right position

            front: SGControlContainer { id: controlContainer }
            back: SGContentContainer { id: contentContainer }

            transform: Rotation {
                id: rotation
                origin {
                    x: flipable.width/2;
                    y: flipable.height/2
                }
                axis {
                    x: 0;
                    y: -1;
                    z: 0
                }    // set axis.y to 1 to rotate around y-axis

                angle: 0    // the default angle
            }

            states: State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
                when: flipable.flipped
            }

            transitions: Transition {
                NumberAnimation { target: rotation; property: "angle"; duration: 400 }
            }
        }
    }

    ListModel {
        id: platformListModel

        // These properties are here (not in platform_selection.js) so they generate their built in signals
        property int currentIndex: 0
        property string selectedClass_id: ""
        property string selectedName: ""
        property string selectedConnection: ""

        Component.onCompleted: {
            //            console.log("platformListModel component completed");
            if (!PlatformSelection.isInitialized) { PlatformSelection.initialize(this, coreInterface, documentManager) }
        }
    }

    Connections {
        id: coreInterfaceConnection
        target: coreInterface

        onPlatformIDChanged: {
            console.log("Main: PlatformIDChanged to ", id)

            // Send update to NavigationControl
//            if (UuidMap.uuid_map.hasOwnProperty(id)){
//                console.log("identified new platform as ", UuidMap.uuid_map[id])
//                var data = { class_id : id }
//                NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
//            }
        }

        onPlatformStateChanged: {
            console.log("Main: PlatformStateChanged: ", platform_connected_state)
        }

        onRemoteConnectionChanged:{
            // Successful remote connection
            if (result === true){
                is_remote_connected = true
            }
            else {
                is_remote_connected = false
            }
        }

        onPlatformListChanged: {
            console.log("Main: PlatformListChanged: ", list)
            if (NavigationControl.context["is_logged_in"] === true) {
                //TODO: Uncomment this when platform list comes in updated format from coreInterface, remove shortcircuit(), also redo popplats in sgstatusbar
//                PlatformSelection.populatePlatforms(list)
                Model.shortCircuit(list)
            }
        }
    }

    // Debug commands for simulation
    Rectangle {
        id: commandBar
        enabled: debug_menu_enabled
        visible: false
        width: parent.width
        height: childrenRect.height
        color: "lightgrey"
        anchors {
            bottom: parent.bottom
        }

        // Simulate Platform events
        GridLayout {
            columns: 10
            anchors { horizontalCenter: commandBar.horizontalCenter }
            //            Button {
            //                text: "USB-PD"
            //                onClicked: {
            //                    var data = { class_id: "usb-pd"}
            //                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
            //                }
            //            }
            Button {
                text: "BuBU Interface"
                onClicked: {
                    var data = { class_id: "P2.2018.1.1.0"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }
            Button {
                text: "Motor Vortex"
                onClicked: {
                    var data = { class_id: "204"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }
            Button {
                text: "Template UI"
                onClicked: {
                    var data = { class_id: "template"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }
            Button {
                text: "USB-PD 4 Ports"
                onClicked: {
                    var data = { class_id: "203"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }
            Button {
                text: "Logic gate"
                onClicked: {
                    var data = { class_id: "101"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }

            Button {
                text: "Linear-VR"
                onClicked: {
                    var data = { class_id: "206"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }
            Button {
                text: "15A-switcher"
                onClicked: {
                    var data = { class_id: "207"}
                    NavigationControl.updateState(NavigationControl.events.NEW_PLATFORM_CONNECTED_EVENT, data)
                }
            }

            // UI events
            Button {
                text: "Toggle Content/Control"
                onClicked: {
                    NavigationControl.updateState(NavigationControl.events.TOGGLE_CONTROL_CONTENT)
                }
            }
            Button {
                text: "Statusbar Debug"
                onClicked: {
                    statusBarContainer.showDebug = !statusBarContainer.showDebug
                }
            }
            Button {
                text: "Reset Window"
                onClicked: {
                    mainWindow.height = 900
                    mainWindow.width = 1200
                }
            }
            Button {
                text: "Login as guest"
                onClicked: {
                    var data = { user_id: "Guest" }
                    NavigationControl.updateState(NavigationControl.events.LOGIN_SUCCESSFUL_EVENT,data)
                }
            }
        }
    }

    Button {
        id: debugCloser
        enabled: debug_menu_enabled
        text: "X"
        height: 30
        width: height
        onClicked: commandBar.visible = false
        anchors {
            right: commandBar.right
            bottom: commandBar.top
        }
        visible: commandBar.visible

    }

    Button {
        id: debugButton
        enabled: debug_menu_enabled
        text: "DEBUG"
        height: 30
        width: 70
        /**
          HIDING THE DEBUG Button
        **/
        visible: !commandBar.visible && debugMouse.containsMouse
        opacity: 0.5
        onClicked: commandBar.visible = true
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
    }

    MouseArea {
        id: debugMouse
        enabled: debug_menu_enabled
        anchors {
            fill: debugButton
        }
        hoverEnabled: true
        onClicked: commandBar.visible = true
    }
}

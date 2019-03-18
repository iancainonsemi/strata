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

import QtQuick 2.10 // to support scale animator
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Window 2.3 // for debug window, can be cut out for release
import QtGraphicalEffects 1.0
import "js/navigation_control.js" as NavigationControl
import "qrc:/js/platform_selection.js" as PlatformSelection
import "js/login.js" as Authenticator
import "qrc:/statusbar-partial-views"
import "qrc:/statusbar-partial-views/help-tour"
import Fonts 1.0
import "qrc:/js/help_layout_manager.js" as Help

import "qrc:/js/platform_model.js" as Model

Rectangle {
    id: container
    anchors { fill: parent }

    // Context properties that get passed when created dynamically
    property string user_id: ""
    property bool is_logged_in: false
    property bool is_remote_connected: false
    property bool is_remote_advertised: false
    property string generalTitle: "Guest"
    property color backgroundColor: "#3a3a3a"
    property color menuColor: "#33b13b"
    property color alternateColor1: "#575757"

    color: "black"

    Component.onCompleted: {
        Help.registerTarget(platformSelectionButton, "Use button to open the platform selector view.", 0, "statusHelp")
        Help.registerTarget(platformControlsButton, "Use this button to select the platform control view. Only available when platform is connected", 1, "statusHelp")
        Help.registerTarget(platformContentButton, "Use this button to select the content view for the selected platform.", 2, "statusHelp")
    }

    // Navigation_control calls this after login when statusbar AND control/content components are all complete
    function loginSuccessful() {
//        PlatformSelection.populatePlatforms(coreInterface.platform_list_)
        //TODO: uncomment the above when coreInterface sends updated format
        PlatformSelection.populatePlatforms(JSON.stringify(Model.platforms))

        // only run shortCircuit if HCS is working and a platformlist is available
        if (JSON.parse(coreInterface.platform_list_).hasOwnProperty("list")) {
            Model.shortCircuit(coreInterface.platform_list_)
        }
    }

    Component.onDestruction: {
        Help.destroyHelp()
    }

    function getWidth(string) {
        return (string.match(/width=\"([0-9]+)\"/))
    }

    function getHeight(string) {
        return (string.match(/height=\"([0-9]+)\"/))
    }

    property var userImages: {
        "dave.priscak@onsemi.com" : "dave_priscak.png",
                "david.somo@onsemi.com" : "david_somo.png",
                "daryl.ostrander@onsemi.com" : "daryl_ostrander.png",
                "paul.mascarenas@onsemi.com" : "paul_mascarenas.png",
                "ian.cain@onsemi.com" : "ian.cain.jpg",
                "blankavatar" : "blank_avatar.png"
    }

    property var userNames: {
        "dave.priscak@onsemi.com" : "Dave Priscak",
                "david.somo@onsemi.com"   : "David Somo",
                "daryl.ostrander@onsemi.com" : "Daryl Ostrander",
                "paul.mascarenas@onsemi.com" : "Paul Mascarenas",
                "ian.cain@onsemi.com" : "Ian Cain"
    }

    property var userJobtitle: {
        "dave.priscak@onsemi.com" : "VP Solutions Engineering",
                "david.somo@onsemi.com"   : "Vice President, Corporate Strategy and Marketing",
                "daryl.ostrander@onsemi.com" : "Director ON Semiconductor",
                "paul.mascarenas@onsemi.com" : "Director ON Semiconductor",
                "ian.cain@onsemi.com" : "Corporate Tech Ladder-Apps Mgmt (TL)"
    }

    function getUserImage(user_name){
        user_name = user_name.toLowerCase()
        if(userImages.hasOwnProperty(user_name)){
            return userImages[user_name]
        }
        else{
            return userImages["blankavatar"]
        }
    }

    function getUserName(user_name){
        var user_lower = user_name.toLowerCase()
        if(userNames.hasOwnProperty(user_lower)){
            return userNames[user_lower]
        }
        else{
            return user_name
        }
    }

    function getJobTitle(user_name){
        var user_lower = user_name.toLowerCase()
        if(userJobtitle.hasOwnProperty(user_lower)){
            return userJobtitle[user_lower]
        }
        else{
            return generalTitle;
        }

    }

    function generateToken(n) {
        var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        var token = '';
        for(var i = 0; i < n; i++) {
            token += chars[Math.floor(Math.random() * chars.length)];
        }
        return token;
    }

    function find(model, remote_user_name) {
        for(var i = 0; i < model.count; ++i) {
            if (remote_user_name === model.get(i).name) {
                return i
            }
        }
        return null
    }


    Connections {
        target: coreInterface
        onRemoteUserAdded: {
            remoteUserModel.append({"name":user_name, "active":false})
        }
    }

    Connections {
        target: coreInterface
        onRemoteUserRemoved: {
            remoteUserModel.remove(find(remoteUserModel, user_disconnected))
        }
    }

    Connections {
        target: coreInterface
        onPlatformStateChanged: {
            //resetting the remote connection state
            is_remote_connected = false;
            tokenField.text = "";
            // send "close remote advertise to hcs to close the remote socket"
            if (remoteToggle.checked) {
                remoteToggle.checked = false;
                var remote_json = {
                    "hcs::cmd":"advertise",
                    "payload": {
                        "advertise_platforms":false
                    }
                }
                console.log("asking hcs to advertise the platforms",JSON.stringify(remote_json))
                coreInterface.sendCommand(JSON.stringify(remote_json))
            }
        }
    }

    Text {
        id: remote_activity_icon
        text: qsTr("\u0027")
        anchors {
            left: remote_user_icons.right
            leftMargin: 15
            verticalCenter: container.verticalCenter
        }
        color: "#00b842"
        font {
            family: Fonts.sgicons
            pixelSize: 20
        }
        visible: remote_activity_label.visible
    }

    Label {
        id:remote_activity_label
        anchors {
            left: remote_activity_icon.right
            leftMargin: 5
            verticalCenter: container.verticalCenter
        }
        text: ""
        visible: false
        color: "white"
    }


    Connections {
        target: coreInterface
        onRemoteActivityChanged: {
            remote_activity_label.visible = true;
            remote_activity_label.text= "Controlled by "+ coreInterface.remote_user_activity_;
            activityMonitorTimer.start();
        }
    }

    Timer {
        // 3 second timeout for response
        id: activityMonitorTimer
        interval: 3000
        running: false
        repeat: false
        onTriggered: {
            remote_activity_label.visible = false;
        }
    }

    ToolBar {
        id: toolBar
        anchors {
            left: container.left
        }
        background: Rectangle {
            color: container.color
            height: container.height
        }

        Row {
            Item {
                id: logoContainer
                height: toolBar.height
                width: 65

                Image {
                    source: "qrc:/images/strata-logo-reverse.svg"
                    height: 30
                    width: 60
                    mipmap: true
                    anchors {
                        verticalCenter: logoContainer.verticalCenter
                        right: logoContainer.right
                    }
                }
            }


            SGToolButton {
                id: platformSelectionButton
                text: qsTr("Platform Selection")
                width: 150
                buttonColor: hovered || PlatformSelection.platformListModel.selectedConnection === "" ? menuColor : container.color
                onClicked: {
                    if (NavigationControl.context["platform_state"] || NavigationControl.context["class_id"] !== "") {
                        PlatformSelection.deselectPlatform()
                    }
                }
                iconCharacter: "\ue804"
            }

            Rectangle {
                id: buttonDivider1
                width: 1
                height: toolBar.height
                color: container.color
            }

            SGToolButton {
                id: platformControlsButton
                text: qsTr("Platform Controls")
                width: 150
                buttonColor: hovered || (PlatformSelection.platformListModel.selectedConnection !== "" && !NavigationControl.flipable_parent_.flipped) ? menuColor : container.color
                enabled: PlatformSelection.platformListModel.selectedConnection !== "view" && PlatformSelection.platformListModel.selectedConnection !== ""
                onClicked: {
                    NavigationControl.updateState(NavigationControl.events.SHOW_CONTROL)
                }
                iconCharacter: "\u003a"
            }

            Rectangle {
                id: buttonDivider2
                width: 1
                height: toolBar.height
                color: container.color
            }

            SGToolButton {
                id: platformContentButton
                text: qsTr("Platform Content")
                width: 150
                buttonColor: hovered || (PlatformSelection.platformListModel.selectedConnection !== "" && NavigationControl.flipable_parent_.flipped) ? menuColor : container.color
                enabled: PlatformSelection.platformListModel.selectedConnection !== ""
                onClicked: {
                    NavigationControl.updateState(NavigationControl.events.SHOW_CONTENT)
                }
                iconCharacter: "\uf15b"
            }

            Rectangle {
                id: buttonDivider3
                width: 1
                height: toolBar.height
                color: container.color
            }

            SGToolButton {
                id: remoteSupportButton

                visible: false
                enabled: false

                text: qsTr("Remote Support")
                width: 150
                onPressed: {
                    remoteSupportMenu.open()
                }
                buttonColor: remoteSupportButton.hovered || remoteSupportMenu.visible ? menuColor : container.color
                iconCharacter: "\u0043"

                Text {
                    id: remoteSupportPopupIndicator
                    text: "\ue810"
                    font {
                        family: Fonts.sgicons
                    }
                    visible: remoteSupportMenu.visible
                    anchors {
                        bottom: remoteSupportButton.bottom
                        horizontalCenter: remoteSupportButton.horizontalCenter
                    }
                    color: container.color
                }

                Popup {
                    id: remoteSupportMenu
                    y: remoteSupportButton.height
                    x: container.width > toolBar.x + remoteSupportButton.x + width ? 0 : container.width > toolBar.x + remoteSupportButton.x + remoteSupportButton.width ? container.width - toolBar.x -remoteSupportButton.x - width/*- (width / 2) + (remoteSupportButton.width / 2)*/ : - width + remoteSupportButton.width
                    padding: 0
                    width: 500
                    height: 250

                    DropShadow {
                        width: remoteSupportMenu.width
                        height: remoteSupportMenu.height
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 8.0
                        samples: 15
                        color: "#88000000"
                        source: remoteSupportMenu.background
                        z: -1
                        cached: true
                    }

                    background: Rectangle {
                        color: alternateColor1
                        border {
                            width: 0
                        }
                    }

                    contentItem: Item {
                        id: remoteMenuContent
                        width: remoteSupportMenu.width
                        height: remoteSupportMenu.height

                        TabBar {
                            id: remoteMenuSelector
                            width: remoteMenuContent.width
                            background: Rectangle {
                                color: "black"
                            }

                            SGTabButton {
                                text: qsTr("Invite to Connect")
                                onClicked: {
                                    remoteInviteContainer.visible = true
                                    remoteConnectContainer.visible = false
                                }
                                buttonColor: checked ? alternateColor1 : backgroundColor
                                enabled : !is_remote_connected
                            }

                            SGTabButton {
                                text: qsTr("Connect to Remote")
                                onClicked: {
                                    remoteInviteContainer.visible = false
                                    remoteConnectContainer.visible = true
                                    tokenField.forceActiveFocus();
                                }
                                buttonColor: checked ? alternateColor1 : backgroundColor
                                enabled: !remoteToggle.checked
                            }
                        }

                        Item {
                            id: remoteInviteContainer
                            anchors {
                                top: remoteMenuSelector.bottom
                                bottom: remoteMenuContent.bottom
                                right: remoteMenuContent.right
                                left: remoteMenuContent.left
                            }
                            width: remoteMenuContent.width
                            visible: true

                            Item {
                                id: noConnectedPlatContainer
                                anchors {
                                    fill: remoteInviteContainer
                                }
                                z:10
                                visible: PlatformSelection.platformListModel.selectedConnection !== "connected"

                                onVisibleChanged: {
                                    if (visible) {
                                        remoteToggle.checked = false
                                    }
                                }

                                Rectangle {
                                    id: noConnectedPlatWarning
                                    color: backgroundColor
                                    anchors {
                                        centerIn: noConnectedPlatContainer
                                    }
                                    z:12
                                    width: noConnectedPlatText.width + 20
                                    height: noConnectedPlatText.height + 20

                                    TextEdit {
                                        id: noConnectedPlatText
                                        anchors {
                                            centerIn: noConnectedPlatWarning
                                        }
                                        text: "Select a Connected Platform to\n Enable Incoming Remote Connections"
                                        color: "white"
                                        readOnly: true
                                        horizontalAlignment: TextEdit.AlignHCenter
                                    }
                                }

                                Rectangle {
                                    id: noConnectedPlatOverlay
                                    color: alternateColor1
                                    opacity: .8
                                    anchors {
                                        fill: noConnectedPlatContainer
                                    }
                                    z:11

                                    MouseArea {
                                        anchors {
                                            fill: noConnectedPlatOverlay
                                        }
                                    }
                                }
                            }

                            Item {
                                id: remoteInviteLeft
                                width: 270
                                anchors {
                                    margins: 15
                                    top: remoteInviteContainer.top
                                    bottom: remoteInviteContainer.bottom
                                    left: remoteInviteContainer.left
                                }

                                Image {
                                    id: remoteImage
                                    source: remoteToggle.checked ? "qrc:/images/icons/remote-unlocked.png" : "qrc:/images/icons/remote-locked.png"
                                    anchors {
                                        horizontalCenter: remoteInviteLeft.horizontalCenter
                                        top: remoteInviteLeft.top
                                    }
                                }

                                SGSwitch {
                                    id: remoteToggle
                                    anchors {
                                        top: remoteImage.bottom
                                        topMargin: 15
                                        horizontalCenter: remoteInviteLeft.horizontalCenter
                                    }
                                    label: "Remote Support Access:"
                                    labelLeft: true
                                    checkedLabel: "Enabled"
                                    uncheckedLabel: "Disabled"
                                    labelsInside: true
                                    switchWidth: 77
                                    textColor: "white"
                                    grooveFillColor: "#00b842"
                                    grooveColor: "#777"

                                    onCheckedChanged: {
                                        var advertise;
                                        if (remoteToggle.checked) {
                                            advertise = true
                                            is_remote_advertised = true
                                            tokenTimer.start()
                                        } else {
                                            hcs_token_status.text= qsTr("Enable to generate remote token")
                                            advertise = false
                                            hcs_token.text = ""
                                            tokenTimer.running = false
                                            remoteUserModel.clear()
                                        }
                                        var remote_json = {
                                            "hcs::cmd":"advertise",
                                            "payload": {
                                                "advertise_platforms":advertise
                                            }
                                        }
                                        console.log("asking hcs to advertise the platforms",JSON.stringify(remote_json))
                                        coreInterface.sendCommand(JSON.stringify(remote_json))
                                    }
                                }

                                Row {
                                    id: tokenRow
                                    anchors {
                                        top: remoteToggle.bottom
                                        horizontalCenter: remoteInviteLeft.horizontalCenter
                                        topMargin: 20
                                    }


                                    Item {
                                        id: tokenStatusContainer
                                        height: 25
                                        width: hcs_token_status.width

                                        Text {
                                            id: hcs_token_status
                                            text : qsTr("Enable to generate remote token")
                                            font {
                                                family: Fonts.franklinGothicBook
                                            }
                                            color: "white"
                                            //readOnly: true
                                            anchors {
                                                topMargin: 7
                                                top: tokenStatusContainer.top
                                            }
                                        }

                                    }

                                    Rectangle {
                                        id: tokenContainer
                                        visible: hcs_token.text !== ""
                                        height: 25
                                        color: "#ddd"
                                        width: 100

                                        TextEdit {
                                            id: hcs_token
                                            visible: text !== ""
                                            text: ""
                                            readOnly: true
                                            font {
                                                family: Fonts.inconsolata
                                                pixelSize: 20
                                            }
                                            selectByMouse: true

                                            anchors {
                                                centerIn: tokenContainer
                                            }
                                        }
                                    }


                                }

                                Connections {
                                    target: coreInterface
                                    onPlatformStateChanged: {
                                        remoteToggle.checked = false
                                    }
                                }

                                Connections {
                                    target: coreInterface
                                    onRemoteConnectionChanged:{
                                        if ( remoteConnectContainer.state === "connecting") {

                                            // Successful remote connection
                                            if (result === true){
                                                remoteConnectContainer.state = "success"
                                                is_remote_connected = true
                                            }
                                            else {
                                                remoteConnectContainer.state = "error"
                                            }
                                        }
                                    }
                                }

                                Timer {
                                    // 3 second timeout for response
                                    id: tokenTimer
                                    interval: 3000
                                    running: false
                                    repeat: false
                                    onRunningChanged: {
                                        if (running) {
                                            hcs_token_status.text = qsTr("Generating token...")
                                        }
                                    }
                                    onTriggered: {
                                        remoteToggle.checked = false
                                        hcs_token_status.text = qsTr("ERROR: Generation failed, enable to retry")
                                    }
                                }

                                Connections {
                                    target: coreInterface
                                    onHcsTokenChanged: {

                                        hcs_token.text =  coreInterface.hcs_token_
                                        if(hcs_token.text === "") {
                                            return;
                                        }
                                        else {
                                            hcs_token_status.text = qsTr("Your remote token is: ")
                                            tokenTimer.stop()
                                        }
                                    }
                                }
                            }

                            Item {
                                id: remoteInviteRight
                                anchors {
                                    left: remoteInviteLeft.right
                                    top: remoteInviteContainer.top
                                    bottom: remoteInviteContainer.bottom
                                    right: remoteInviteContainer.right
                                    leftMargin: 15
                                    topMargin: 10
                                    rightMargin: 5
                                }

                                Rectangle {
                                    id: connectedUsersTitle
                                    anchors {
                                        left: remoteInviteRight.left
                                        right: remoteInviteRight.right
                                        top: remoteInviteRight.top
                                    }
                                    height: 30
                                    color: remoteToggle.checked ? Qt.darker(backgroundColor, 1.25) : backgroundColor

                                    Text {
                                        id: connectedUsersTitleText
                                        text: remoteUserModel.count === 0 ? qsTr("No Connected Users") : qsTr("Connected Users")
                                        anchors {
                                            verticalCenter: connectedUsersTitle.verticalCenter
                                            left: connectedUsersTitle.left
                                            leftMargin: 10
                                            verticalCenterOffset: 2
                                        }
                                        color: remoteToggle.checked ? "white" : "grey"
                                        font {
                                            family: Fonts.franklinGothicBook
                                        }
                                    }
                                }

                                Rectangle {
                                    id: connectedUsersContainer
                                    color: remoteToggle.checked ? backgroundColor : "#484848"
                                    anchors {
                                        left: remoteInviteRight.left
                                        right: remoteInviteRight.right
                                        top: connectedUsersTitle.bottom
                                        topMargin: 2
                                        bottom: remoteInviteRight.bottom
                                        bottomMargin: 10
                                    }

                                    ListModel {
                                        id: remoteUserModel
                                    }

                                    Component {
                                        id: remoteUserDelegate

                                        Item {
                                            id: remoteUserDelegateContainer
                                            width: connectedUsersContainer.width
                                            height: 50

                                            Image {
                                                id: remote_user_img
                                                anchors {
                                                    left: remoteUserDelegateContainer.left
                                                    top: remoteUserDelegateContainer.top
                                                    leftMargin: 4
                                                    topMargin: 4
                                                }
                                                sourceSize.height: 46
                                                fillMode: Image.PreserveAspectFit
                                                source: "qrc:/images/blank_avatar.png"
                                            }

                                            Label {
                                                id:remote_user_name
                                                anchors {
                                                    left: remote_user_img.right
                                                    verticalCenter: remoteUserDelegateContainer.verticalCenter
                                                    leftMargin: 10
                                                    right: close_icon.left
                                                }
                                                text: name
                                                font {
                                                    family: Fonts.franklinGothicBold
                                                }
                                                color: "white"
                                                elide: Text.ElideRight
                                            }

                                            Image {
                                                id: close_icon
                                                anchors {
                                                    verticalCenter: remoteUserDelegateContainer.verticalCenter
                                                    right: remoteUserDelegateContainer.right
                                                    rightMargin: 5
                                                }
                                                height: remoteUserDelegateContainer.height - 30
                                                width: height
                                                fillMode: Image.PreserveAspectFit
                                                source: "qrc:/images/closeIcon.svg"
                                            }

                                            MouseArea {
                                                anchors {
                                                    fill: close_icon
                                                }
                                                hoverEnabled: true
                                                onClicked: {
                                                    var remote_json = {
                                                        "hcs::cmd":"disconnect_remote_user",
                                                        "payload": {
                                                            "user_name":name
                                                        }
                                                    }
                                                    console.log("disconnecting user",JSON.stringify(remote_json))
                                                    coreInterface.sendCommand(JSON.stringify(remote_json))

                                                }
                                                cursorShape: Qt.PointingHandCursor
                                            }
                                        }
                                    }

                                    ListView {
                                        id: remote_user_list_view
                                        anchors {
                                            fill: connectedUsersContainer
                                        }
                                        model: remoteUserModel
                                        delegate: remoteUserDelegate
                                        focus: true
                                        clip: true
                                    }
                                }
                            }
                        }

                        Item {
                            id: remoteConnectContainer
                            anchors {
                                top: remoteMenuSelector.bottom
                                bottom: remoteMenuContent.bottom
                            }
                            width: remoteMenuContent.width
                            visible: false

                            state: "default"
                            states: [
                                State {
                                    name: "default"
                                    // Show button and textfield
                                    PropertyChanges { target: tokenLabel; text: "Enter remote token:"; visible: true}
                                    PropertyChanges { target: tokenInput; visible: true}
                                    PropertyChanges { target: tokenBusyIndicator; visible: false}
                                    PropertyChanges { target: tryAgainButton; visible: false }
                                    PropertyChanges { target: disconnectButton; visible: false}
                                },
                                State {
                                    name: "connecting"
                                    // Show BusyIndicator and 'connecting' text
                                    PropertyChanges { target: tokenLabel; text: "Attempting to connect to server"; visible: true}
                                    PropertyChanges { target: tokenBusyIndicator; visible: true}

                                    // Hide input
                                    PropertyChanges { target: tokenInput; visible: false}

                                    // Start timer
                                    PropertyChanges { target: tokenBusyTimer; running: true;}
                                },
                                State {
                                    name: "timeout"
                                    // Show timeout
                                    PropertyChanges { target: tokenLabel; text: "Connection to server timed out"; visible: true}
                                    PropertyChanges { target: statusImage; source: "qrc:/images/icons/fail_x.svg"; visible: true}

                                    // Hide BusyIndicator
                                    PropertyChanges { target: tokenBusyIndicator; visible: false}

                                    // Show button to try again
                                    PropertyChanges { target: tryAgainButton; visible: true }
                                },
                                State {
                                    name: "success"
                                    // Show timeout
                                    PropertyChanges { target: tokenLabel; text: "Connection successful. Remote device listed."; visible: true}
                                    PropertyChanges { target: statusImage; source: "qrc:/images/icons/success_check.svg"; visible: true}

                                    // Hide BusyIndicator
                                    PropertyChanges { target: tokenBusyIndicator; visible: false}

                                    // Show Disconnect
                                    PropertyChanges { target: disconnectButton; visible: true}

                                },
                                State {
                                    name: "error"
                                    // Show error
                                    PropertyChanges { target: tokenLabel; text: "Error with server connection"; visible: true}
                                    PropertyChanges { target: statusImage; source: "qrc:/images/icons/fail_x.svg"; visible: true}

                                    // Hide BusyIndicator
                                    PropertyChanges { target: tokenBusyIndicator; visible: false}

                                    // Show button to try again
                                    PropertyChanges { target: tryAgainButton; visible: true }
                                }
                            ]


                            // Connections for internal event handling
                            Connections{
                                target: tokenField
                                onAccepted: {
                                    remoteConnectContainer.state = "connecting"
                                }
                            }

                            Connections{
                                target: submitTokenButton
                                onClicked: {
                                    // Send command to CoreInterface
                                    // Go to connecting

                                    remoteConnectContainer.state = "connecting"
                                }
                            }

                            Connections{
                                target: tokenBusyTimer
                                onTriggered: {
                                    remoteConnectContainer.state = "timeout"
                                }
                            }


                            Connections {
                                target: tryAgainButton
                                onClicked: {
                                    console.log("try again")
                                    remoteConnectContainer.state = "default"
                                }
                            }

                            Connections {
                                target: disconnectButton
                                onClicked: {
                                    remoteConnectContainer.state = "default"
                                    // sending remote disconnect message to hcs
                                    var remote_disconnect_json = {
                                        "hcs::cmd":"remote_disconnect",
                                    }
                                    coreInterface.sendCommand(JSON.stringify(remote_disconnect_json))
                                    console.log("UI -> HCS ", JSON.stringify(remote_disconnect_json));
                                }
                            }

                            Connections {
                                target: coreInterface
                                onPlatformStateChanged: {
                                    remoteConnectContainer.state = "default"
                                }
                            }

                            Connections {
                                target: coreInterface
                                onRemoteConnectionChanged:{
                                    if ( remoteConnectContainer.state === "connecting") {

                                        // Successful remote connection
                                        if (result === true){
                                            remoteConnectContainer.state = "success"
                                            is_remote_connected = true
                                        }
                                        else {
                                            remoteConnectContainer.state = "error"
                                        }
                                    }
                                }
                            }


                            // Timer to timeout busy animation
                            Timer {
                                // 3 second timeout for response
                                id: tokenBusyTimer
                                interval: 3000
                                running: false
                                repeat: false
                                onTriggered: {
                                    // Show failure
                                }
                            }

                            // Show busy
                            Item {
                                id: busyIndicatorContainer
                                width: tokenBusyTimer.running || statusImage.visible ? 75 : 0
                                height: tokenBusyTimer.running || statusImage.visible ? 75 : 0
                                anchors {
                                    horizontalCenter: remoteConnectContainer.horizontalCenter
                                    top: remoteConnectContainer.top
                                    topMargin: height === 0 ? 0 : 30
                                }

                                BusyIndicator {
                                    id: tokenBusyIndicator
                                    // Bind to Timer
                                    running: tokenBusyTimer.running
                                    anchors { fill: busyIndicatorContainer }
                                }

                                Image{
                                    id: statusImage
                                    width: busyIndicatorContainer.width
                                    height: busyIndicatorContainer.height
                                    fillMode: Image.PreserveAspectFit
                                    source: ""
                                    visible: false
                                }
                            }

                            Label {
                                id: tokenLabel
                                height: 30
                                text: "Enter remote token:"
                                font {
                                    family: Fonts.franklinGothicBold
                                }
                                color: "white"
                                anchors {
                                    top: busyIndicatorContainer.bottom
                                    topMargin: busyIndicatorContainer.height === 0 ? 50 : 0
                                    horizontalCenter: remoteConnectContainer.horizontalCenter
                                }
                            }

                            Button {
                                id: tryAgainButton
                                text: "Try Again"
                                focus: true
                                anchors {
                                    top: tokenLabel.bottom
                                    horizontalCenter: remoteConnectContainer.horizontalCenter
                                }
                                visible: false
                            }

                            Button {
                                id: disconnectButton
                                text: "Disconnect"
                                anchors {
                                    top: tokenLabel.bottom
                                    horizontalCenter: remoteConnectContainer.horizontalCenter
                                }
                                visible: false
                                onClicked: {
                                    is_remote_connected = false
                                }
                            }

                            Item {
                                id: tokenInput
                                width: tokenField.width + submitTokenButton.width + submitTokenButton.anchors.leftMargin
                                height: tokenField.height
                                // Default visibility is false; state changes will make it visible
                                visible: { console.log("created"); return false}
                                anchors {
                                    top: tokenLabel.bottom
                                    horizontalCenter: remoteConnectContainer.horizontalCenter
                                }


                                TextField {
                                    id: tokenField
                                    selectByMouse: true
                                    focus: true
                                    placeholderText: qsTr("Token (ex: DMI2UE1N)")
                                    cursorPosition: 1
                                    font.capitalization: Font.AllUppercase

                                    onAccepted: {
                                        focus = false
                                        console.log("TOKEN: ", text);
                                        console.log("sending token:", tokenField.text);
                                        var remote_json = {
                                            "hcs::cmd":"get_platforms",
                                            "payload": {
                                                "hcs_token": tokenField.text.toUpperCase()
                                            }
                                        }
                                        coreInterface.sendCommand(JSON.stringify(remote_json))
                                        console.log("UI -> HCS ", JSON.stringify(remote_json));
                                    }

                                }

                                Button{
                                    id: submitTokenButton
                                    text: "Submit"
                                    width: 80
                                    height: tokenField.height
                                    anchors{
                                        left: tokenField.right
                                        leftMargin: 10
                                    }
                                    font.capitalization: Font.AllUppercase

                                    onClicked: {
                                        console.log("sending token:", tokenField.text);
                                        var remote_json = {
                                            "hcs::cmd":"get_platforms",
                                            "payload": {
                                                "hcs_token": tokenField.text.toUpperCase()
                                            }
                                        }
                                        coreInterface.sendCommand(JSON.stringify(remote_json))
                                        console.log("UI -> HCS ", JSON.stringify(remote_json));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    Component {
        id: remoteUserIconDelegate

        Item {
            id: remote_icon_container
            width: remote_user_hover.containsMouse ? remote_user_img.width + 18 : remote_user_img.width
            height: 40
            clip: false

            Behavior on width { NumberAnimation {
                    duration: 50
                }
            }

            Image {
                id: remote_user_img
                sourceSize.height: 40
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/blank_avatar.png"
                visible: false
                anchors {
                    right: remote_icon_container.right
                }
            }

            Rectangle {
                id: mask
                width: remote_user_img.width
                height: width
                radius: width/2
                visible: false
                anchors {
                    right: remote_icon_container.right
                }
            }

            OpacityMask {
                height: mask.width
                width: mask.height
                source: remote_user_img
                maskSource: mask
                anchors {
                    right: remote_icon_container.right
                }

                ToolTip {
                    text: model.name
                    visible: remote_user_hover.containsMouse
                }
            }

            MouseArea {
                id: remote_user_hover
                anchors {
                    fill: remote_icon_container
                }
                hoverEnabled: true
            }
        }
    }

    Row {
        id: remote_user_icons
        anchors {
            left: toolBar.right
            leftMargin: 18
        }
        width: icon_repeater.count * 19 + 16
        height: 40
        y: 2
        spacing: -16
        layoutDirection: Qt.RightToLeft
        clip: false

        Repeater {
            id: icon_repeater
            model: remoteUserModel
            delegate: remoteUserIconDelegate
        }
    }

    Item {
        id: profileIconContainer
        anchors {
            right: container.right
            rightMargin: 2
            top: container.top
            bottom: container.bottom
        }
        width: height

        Rectangle {
            id: profileIcon
            anchors {
                centerIn: profileIconContainer
            }
            height: profileIconHover.containsMouse ? profileIconContainer.height : profileIconContainer.height - 6
            width: height
            radius: height / 2
            color: "#00b842"

            Text {
                id: profileInitial
                text: getUserName(user_id).charAt(0)
                color: "white"
                anchors {
                    centerIn: profileIcon
                }
                font {
                    family: Fonts.franklinGothicBold
                    pixelSize: profileIconHover.containsMouse ? 24 : 20
                }
            }
        }

        MouseArea {
            id: profileIconHover
            hoverEnabled: true
            anchors {
                fill: profileIconContainer
            }
            onPressed: {
                profileMenu.open()
            }
        }

        Popup {
            id: profileMenu
            x: -width + profileIconContainer.width
            y: profileIconContainer.height
            padding: 0
            topPadding: 10
            width: 100
            background: Canvas {
                width: profileMenu.width
                height: profileMenu.contentItem.height + 10

                onPaint: {
                    var context = getContext("2d");
                    context.reset();
                    context.beginPath();
                    context.moveTo(0, 10);
                    context.lineTo(width - (profileIconContainer.width/2)-10, 10);
                    context.lineTo(width - profileIconContainer.width/2, 0);
                    context.lineTo(width - (profileIconContainer.width/2)+10, 10);
                    context.lineTo(width, 10);
                    context.lineTo(width, height);
                    context.lineTo(0, height);
                    context.closePath();
                    context.fillStyle = "#00b842";
                    context.fill();
                }
            }

            contentItem:
                Column {
                id: profileColumn
                width: profileMenu.width

                SGMenuItem {

                    visible: false
                    enabled: false

                    text: qsTr("My Profile")
                    onClicked: {
                        profileMenu.close()
                        profilePopup.open();
                    }
                    width: profileMenu.width
                }

                SGMenuItem {
                    text: qsTr("About")
                    onClicked: {
                        profileMenu.close()
                        aboutPopup.open();
                    }
                    width: profileMenu.width
                }

                SGMenuItem {
                    text: qsTr("Feedback")
                    onClicked: {
                        profileMenu.close()
                        feedbackPopup.open();
                    }
                    width: profileMenu.width
                }

                SGMenuItem {
                    text: qsTr("Help")
                    onClicked: {
                        profileMenu.close()
                        Help.startHelpTour("statusHelp", "strataMain")
                    }
                    width: profileMenu.width
                }

                Rectangle {
                    id: menuDivider
                    color: "white"
                    opacity: .4
                    height: 1
                    width: profileMenu.width - 20
                    anchors {
                        horizontalCenter: profileColumn.horizontalCenter
                    }
                }

                SGMenuItem {
                    text: qsTr("Log Out")
                    onClicked: {
                        profileMenu.close()

                        NavigationControl.updateState(NavigationControl.events.LOGOUT_EVENT)
                        Authenticator.logout()
                        coreInterface.disconnectPlatform()
                    }
                    width: profileMenu.width
                }
            }
        }
    }

    SGProfilePopup {
        id: profilePopup

        x: container.width/2 - profilePopup.width/2
        y: container.parent.windowHeight/2 - profilePopup.height/2

        property string versionNumber: container.parent.versionNumber
    }

    SGAboutPopup {
        id: aboutPopup

        x: container.width/2 - aboutPopup.width/2
        y: container.parent.windowHeight/2 - aboutPopup.height/2

        property string versionNumber: container.parent.versionNumber
    }

    SGPrivacyPopup {
        id: privacyPopup

        x: container.width/2 - privacyPopup.width/2
        y: container.parent.windowHeight/2 - privacyPopup.height/2
    }

    SGFeedbackPopup {
        id: feedbackPopup

        x: container.width/2 - feedbackPopup.width/2
        y: container.parent.windowHeight/2 - feedbackPopup.height/2
    }

    Window {
        id: debugWindow
        visible: container.parent.showDebug
        height: 200
        width: 300
        x: 1620
        y: 500
        title: "SGStatusBar.qml Debug Controls"

        Column {
            id: debug1
            Button {
                text: "add user to model"
                onClicked: {
                    remoteUserModel.append({"name":"David Faller" })
                }
            }
            Button {
                text: "clear model"
                onClicked: {
                    remoteUserModel.clear()
                }
            }
            Button {
                text: "remote activity"
                onClicked: {
                    remote_activity_label.visible = true;
                    remote_activity_label.text= "Controlled by David Faller";
                    activityMonitorTimer.start();
                }
            }
            Button {
                text: "add plat to combobox"
                onClicked: {
                    var platform_info = {
                        "text" : "Fake Platform 9000 (Connected)",
                        "verbose" : "Fake Platform 9000 (Connected)",
                        "name" : "motor-vortex",
                        "connection" : "connected",
                        "uuid" : "SEC.2017.004.2.0.0.1c9f3822-b865-11e8-b42a-47f5c5ed4fc3"
                    }
                    PlatformSelection.platformListModel.append(platform_info)
                }
            }
        }

        Column {
            id: debug2
            anchors {
                left: debug1.right
                leftMargin: 10
            }

            Button {
                text: "spoof plat list, autoconnect"
                onClicked: {
                    var data = '{
                        "list":
                            [ { "connection":"view",
                                "uuid":"P2.2018.1.1.0.0.c9060ff8-5c5e-4295-b95a-d857ee9a3671",
                                "verbose":"USB PD Load Board"},
                              { "connection":"view",
                                "uuid":"P2.2017.1.1.0.0.cbde0519-0f42-4431-a379-caee4a1494af",
                                "verbose":"USB PD"},
                              { "connection":"view",
                                "uuid":"SEC.2017.004.2.0.0.1c9f3822-b865-11e8-b42a-47f5c5ed4fc3",
                                "verbose":"Vortex Fountain Motor Platform Board"},
                              '+/*{ "connection":"connected",
                                "uuid":"SEC.2017.004.2.0.0.1c9f3822-b865-11e8-b42a-47f5c5ed4fc3",
                                "verbose":"Fake Motor Vortex AutoConnect"}*/'
                              { "connection":"connected",
                                "uuid":"SEC.2016.004.2.0.0.1c9f3822-b865-11e8-b42a-47f5c5ed4fc3",
                                "verbose":"Unknown Board"}
                               ]
                        }'


                    PlatformSelection.populatePlatforms(data)
                }
            }
            Text {
                id: name
                text: qsTr(PlatformSelection.platformListModel.selectedConnection)
            }
        }
    }
}

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
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import "js/navigation_control.js" as NavigationControl
import "js/login.js" as Authenticator
import Fonts 1.0
import "qrc:/statusbar-partial-views"

Rectangle {
    id: container
    anchors { fill: parent }
    visible: true
    clip: true

    Component.onCompleted: {
        usernameField.forceActiveFocus();   // Allows the user to type their username without clicking
    }

    // Login Button Connection
    Connections {
        target: loginButton
        onClicked: {
//            // Report Error if we are missing text
//            if (usernameField.text=="" || passwordField.text==""){
//                loginErrorText.text = "Username or password is blank"
//                failedLoginAnimation.start();
//            } else {
//                // Pass info to Authenticator
//                var login_info = { user: usernameField.text, password: passwordField.text }
//                Authenticator.login(login_info)
//                loginRectangle.enabled = false
//            }
            var data = { user_id: "Guest" }
            NavigationControl.updateState(NavigationControl.events.LOGIN_SUCCESSFUL_EVENT,data)
        }
    }

    Connections {
        target: Authenticator.signals
        onLoginResult: {
            //console.log("Login result received")
            if (result === "Connected") {
                connectionStatus.text = "Connected, Loading UI..."
                var data = { user_id: usernameField.text }
                NavigationControl.updateState(NavigationControl.events.LOGIN_SUCCESSFUL_EVENT,data)
                usernameField.updateModel()
            } else {
                loginRectangle.enabled = true
                connectionStatus.text = ""
                if (result === "No Connection") {
                    loginErrorText.text = "Connection to authentication server failed"
                } else {
                    loginErrorText.text = "Your username or password are incorrect"
                }
                failedLoginAnimation.start()
            }
        }

        // [TODO][prasanth]: jwt will be created/received in the hcs
        // for now, jwt will be received in the UI and then sent to HCS
        onLoginJWT: {
            //console.log("JWT received",jwt_string)
            var jwt_json = {
                "hcs::cmd":"jwt_token",
                "payload": {
                    "jwt":jwt_string,
                    "user_name":usernameField.text
                }
            }
            console.log("sending the jwt json to hcs",JSON.stringify(jwt_json))
            coreInterface.sendCommand(JSON.stringify(jwt_json))
        }

        onConnectionStatus: {
            switch(status) {
                case 0:
                    connectionStatus.text = "Building Request"
                    break;
                case 1:
                    connectionStatus.text = "Waiting on Server Response"
                    break;
                case 2:
                    connectionStatus.text = "Request Received From Server"
                    break;
                case 3:
                    connectionStatus.text = "Processing Request"
            }
        }
    }

    //-----------------------------------------------------------
    //Elements common to both the connection and login screens
    //-----------------------------------------------------------
    Image {
        id: background
        source: "qrc:/images/login-background.svg"
        height: 1080
        width: 1920
        x: (parent.width - width)/2
        y: (parent.height - height)/2
    }

    Image {
        id: strataLogo
        fillMode: Image.PreserveAspectFit
        sourceSize.height: container.height < 560 ? 125 : 200
        anchors {
            horizontalCenter: container.horizontalCenter
            bottom: spyglassTextRect.top
        }
        source: "qrc:/images/strata-logo.svg"
        mipmap: true;
    }

    Rectangle {
        id: spyglassTextRect
        height: 0
        color: "#ffffff"
        anchors {
            horizontalCenter: container.horizontalCenter;
            verticalCenter: container.verticalCenter;
            verticalCenterOffset:  container.height < 560 ? 25 : 50
        }
    }

    Rectangle {
        id: onSemiHeader
        color: "#235a92"
        anchors {
            top: container.top
            left: container.left
            right: container.right
        }
        height: 130
        clip: true

        Image {
            id: onSemiLogo
            source: "qrc:/images/on-semi-logo.png"
            anchors {
                left: onSemiHeader.left
                leftMargin: 25
                verticalCenter: onSemiHeader.verticalCenter
            }
        }
    }

    //-----------------------------------------------------------
    // login screen elements
    //-----------------------------------------------------------

    Item {
        id: loginRectangle
        width: 184
        height: 125
        anchors {
            horizontalCenter: container.horizontalCenter;
            top: spyglassTextRect.bottom
            topMargin: 15
        }

        SGComboBox {
            id: usernameField

            comboBoxHeight: 38
            focus: true
            property string text: "Guest"
            onEditTextChanged: text = editText
            onCurrentTextChanged: text = currentText

            onActivated: {
                if(index >= 0) {
                    usernameField.editText = model.get(index).text
                }
            }

            editable: true
            borderColor: "#ddd"
            model: ListModel {    ListElement {
                    name: "Guest"
                }}
            placeholderText: "Username"
            enabled: false

//            Component.onCompleted: {
//                var userNames = JSON.parse(userNameFieldSettings.userNameStore)
//                for (var i = 0; i < userNames.length; ++i) {
//                    model.append(userNames[i])
//                }
//                currentIndex = userNameFieldSettings.userNameIndex
//            }
//            Component.onDestruction: {
//                var userNames = []
//                for (var i = 0; i < model.count; ++i) {
//                    userNames.push(model.get(i))
//                }
//                userNameFieldSettings.userNameStore = JSON.stringify(userNames)
//                userNameFieldSettings.userNameIndex = currentIndex
//            }

            anchors {
                top: loginRectangle.top
                left: loginRectangle.left
                right: loginRectangle.right
            }
            comboBoxWidth: loginRectangle.width

            Keys.onPressed: {
                hideFailedLoginAnimation.start()
            }

            //handle a return key click, which is the equivalent of the login button being clicked
            Keys.onReturnPressed:{
                loginButton.clicked()
            }

            function updateModel() {
                if (find(text) === -1) {
                    model.append({text: text})
                    currentIndex = find(text)
                }
            }

            font {
                pixelSize: 15
                family: Fonts.franklinGothicBook
            }

            Settings {
                id: userNameFieldSettings

                property string userNameStore: "{}"
                property int userNameIndex: -1
            }
        }

        TextField {
            id: passwordField
            anchors{
                top: usernameField.bottom
                topMargin: 2
                left: loginRectangle.left
                right: loginRectangle.right
            }
            enabled: false
            height: 38
            activeFocusOnTab: true
            placeholderText: qsTr("Password")
            echoMode: TextInput.Password
            font {
                pixelSize: 15
                family: Fonts.franklinGothicBook
            }
            background: Rectangle {
                border.color: passwordField.activeFocus ? "#219647" : "#ddd"
            }
            selectByMouse: true
            KeyNavigation.tab: loginButton

            Keys.onPressed: {
                hideFailedLoginAnimation.start()
            }
            //handle a return key click, which is the equivalent of the login button being clicked
            Keys.onReturnPressed:{
                loginButton.clicked()
            }

            text: "Guest"
        }

        Rectangle {
            id: hoverWarning
            anchors {
                top: usernameField.top
                bottom: passwordField.bottom
                left: usernameField.left
                right: usernameField.right
            }
            visible: mouseWarning.containsMouse
            opacity: .75
            color: "#666"
        }

        MouseArea {
            id: mouseWarning
            hoverEnabled: true
            anchors {
                fill: hoverWarning
            }
        }

        Text {
            id: guestText
            text: "This initial release of Strata does not require an account, click 'Login' below."
            wrapMode: Text.Wrap
            anchors {
                left: hoverWarning.left
                right: hoverWarning.right
                margins: 10
                verticalCenter: hoverWarning.verticalCenter
            }
            color: "white"
            visible: mouseWarning.containsMouse
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle{
            id:loginErrorRect
            width: loginRectangle.width
            height: 48
            color:"red"
            opacity: 0.0
            anchors {
                horizontalCenter: loginRectangle.horizontalCenter
                top: passwordField.bottom
                topMargin: 5
            }

            Image{
                id:alertIcon
                source: "./images/icons/whiteAlertIcon.svg"
                anchors{left:loginErrorRect.left; top:loginErrorRect.top; bottom:loginErrorRect.bottom
                    leftMargin: 5; topMargin:10; bottomMargin:10}
                fillMode:Image.PreserveAspectFit
                mipmap: true;
            }

            Text{
                id:loginErrorText
                font {
                    pixelSize: 10
                    family: Fonts.franklinGothicBold
                }
                wrapMode: Label.WordWrap
                anchors {
                    left: alertIcon.right
                    right: loginErrorRect.right
                    rightMargin: 5
                    verticalCenter: loginErrorRect.verticalCenter
                }
                horizontalAlignment:Text.AlignHCenter
                text: ""
                color: "white"
            }
        }

        Button {
            id: loginButton
            anchors {
                bottom: loginRectangle.bottom
                topMargin: 2
                horizontalCenter: loginRectangle.horizontalCenter
            }
            width: 184; height: 38
            text:"Login"
            activeFocusOnTab: true

            background: Rectangle {
                color: loginButton.down ? "#666" : "#888"
                border.color: loginButton.activeFocus ? "#219647" : "transparent"
            }

            contentItem: Text {
                text: loginButton.text
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font {
                    pixelSize: 15
                    family: Fonts.franklinGothicBold
                }
            }

            Keys.onReturnPressed:{
                loginButton.clicked()
            }

            /* OnClicked is handled in Connections section above */
        }
    }

    //-----------------------------------------------------------
    // connecting status elements
    //-----------------------------------------------------------
    Item {
        id: connectingStatus
        anchors {
            fill: loginRectangle
        }
        visible: !loginRectangle.enabled

        Rectangle {
            id: coverup
            color: "white"
            opacity: 0.75
            anchors {
                fill: parent
            }
        }

        Text {
            id: searchingText
            color: "#888"
            text: "Connecting..."
            anchors {
                horizontalCenter: connectingStatus.horizontalCenter
                top: connectingStatus.top
                topMargin: 25
            }
            horizontalAlignment: Text.AlignHCenter
            font {
                family: Fonts.franklinGothicBold
            }
        }

        Text {
            id: connectionStatus
            color: "#888"
            text: ""
            anchors {
                horizontalCenter: searchingText.horizontalCenter
                top: searchingText.bottom
                topMargin: 3
            }
            horizontalAlignment: Text.AlignHCenter
            font {
                family: Fonts.franklinGothicBook
            }

//            onTextChanged: console.log("Connection Status:", text, Date.now())
        }

        Text {
            id: indicator
            font {
                family: Fonts.sgicons
                pixelSize: 40
            }
            text: "\ue834"
            color: "#888"
            anchors {
                horizontalCenter: connectingStatus.horizontalCenter
                top: searchingText.bottom
                topMargin: 30
            }

            onVisibleChanged: {
                if(visible) {
                    indicatorAnimation.start()
                } else {
                    indicatorAnimation.stop();
                }
            }

            RotationAnimation on rotation {
                id: indicatorAnimation
                loops: Animation.Infinite
                from: 0
                to: 360
                duration: 750
                running: false
            }
        }
    }

    SequentialAnimation{
        //animator to show that the login failed
        id:failedLoginAnimation

        NumberAnimation {
            target: loginRectangle
            property: "height"
            to: 175
            duration: 200
        }
        NumberAnimation{
            target: loginErrorRect
            property:"opacity"
            to: 1
            duration: 200
        }
    }

    SequentialAnimation{
        //animator to show that the login failed
        id:hideFailedLoginAnimation

        NumberAnimation{
            target:loginErrorRect
            property:"opacity"
            to: 0
            duration: 200
        }

        NumberAnimation {
            target: loginRectangle
            property: "height"
            // Go back to original height
            to: 125
            duration: 200
        }

        onStopped: loginErrorText.text = ""
    }

    // These text boxes are HACK solution to get around an issue on windows builds where the glyphs loaded in this file were the ONLY glyphs that appeared in subsequent views.
    // the effects of this bug are documented here: https://bugreports.qt.io/browse/QTBUG-62578 - our instance of this issue was not random as described, however.  --Faller
    // Update 10/23/2018: This may have been solved by moving to singleton font loader, [TODO] need to test.
    Text {
        text: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890:./\\{}()[]-=+_!@#$%^&*`~<>?\"\'"
        font {
            family: Fonts.franklinGothicBold
        }
        visible: false
    }

    Text {
        text:  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890:./\\{}()[]-=+_!@#$%^&*`~<>?\"\'"
        font {
            family: Fonts.franklinGothicBook
        }
        visible: false
    }

    Text {
        text:  "\u0023 \u0027 \u0037 \u0038 \u003a \u0043 \u25b2 \ue800 \ue801 \ue805 \ue808 \ue80b \ue80e \ue810 \ue811 \ue813 \ue824 \ue834 \uf15b"
        font {
            family: Fonts.sgicons
        }
        visible: false
    }
}

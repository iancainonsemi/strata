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
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "qrc:/statusbar-partial-views"
import "qrc:/statusbar-partial-views/platform-selector"
import "js/navigation_control.js" as NavigationControl
import Fonts 1.0
import QtWebEngine 1.6

Rectangle{
    id:container
    anchors.fill: parent
    clip: true

    // Context properties that get passed when created dynamically
    property string user_id: ""

    // Hardcoded mapping
    property var userImages: {
        "dave.priscak@onsemi.com" : "dave_priscak.png",
                "david.somo@onsemi.com" : "david_somo.png",
                "daryl.ostrander@onsemi.com" : "daryl_ostrander.png",
                "paul.mascarenas@onsemi.com" : "paul_mascarenas.png",
                "blankavatar" : "blank_avatar.png"
    }

    property var userNames: {
        "dave.priscak@onsemi.com" : "Dave Priscak",
                "david.somo@onsemi.com"   : "David Somo",
                "daryl.ostrander@onsemi.com" : "Daryl Ostrander",
                "paul.mascarenas@onsemi.com" : "Paul Mascarenas",
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

    Image {
        id: background
        source: "qrc:/images/login-background.svg"
        height: 1080
        width: 1920
        x: (parent.width - width)/2
        y: (parent.height - height)/2
    }

    Row {
        id: upperContainer
        anchors {
            horizontalCenter: container.horizontalCenter
            top: container.top
            topMargin: Math.max((container.height - upperContainer.height - platformSelector.height)/3, 0)
        }
        height: Math.max(userContainer.height, strataLogo.height)
        z: 2
        spacing: 20


        Item {
            id: userContainer
            anchors {
                verticalCenter: upperContainer.verticalCenter
            }
            height: childrenRect.height
            width: Math.max (welcomeMessage.width, user_img.width)

            Image {
                id: user_img
                sourceSize.height: 160
                fillMode: Image.PreserveAspectFit
                anchors {
                    top : userContainer.top
                    horizontalCenter: userContainer.horizontalCenter
                }
                source: "qrc:/images/" + getUserImage(user_id)
                visible: false
            }

            Rectangle {
                id: mask
                width: 120
                height: width
                radius: width/2
                visible: false
            }

            OpacityMask {
                anchors {
                    top: user_img.top
                    horizontalCenter: user_img.horizontalCenter
                }
                height: 135
                width: 135
                source: user_img
                maskSource: mask
            }

            Label {
                id: welcomeMessage
                anchors {
                    top: user_img.bottom
                    topMargin: -20
                    horizontalCenter: userContainer.horizontalCenter
                }
                font {
                    family: Fonts.franklinGothicBold
                    pixelSize: 20
                }
                text: getUserName(user_id)
            }
        }

        Rectangle {
            id: divider
            color: "#999"
            height: userContainer.height
            anchors {
                verticalCenter: userContainer.verticalCenter
            }
            width: 2
        }

        Image {
            id: strataLogo
            anchors {
                verticalCenter: userContainer.verticalCenter
            }
            sourceSize.height: 175
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/strata-logo.svg"
            mipmap: true;
        }
    }

    SGPlatformSelectorListView {
        id: platformSelector
        anchors {
            top: upperContainer.bottom
            horizontalCenter: container.horizontalCenter
            topMargin: upperContainer.anchors.topMargin
        }
        height: container.height * .625
    }

    Popup {
        id: orderPopup
        x: container.width/2 - orderPopup.width/2
        y: container.height/2 - orderPopup.height/2
        width: container.width-100
        height: container.height - 100
        modal: true
        focus: true
        padding: 0
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        onOpened: webview.url = "https://www.onsemi.com/PowerSolutions/locateSalesSupport.do"


        DropShadow {
            width: orderPopup.width
            height: orderPopup.height
            horizontalOffset: 1
            verticalOffset: 3
            radius: 15.0
            samples: 30
            color: "#cc000000"
            source: orderPopup.background
            z: -1
            cached: true
        }

        Rectangle {
            id: popupContainer
            width: orderPopup.width
            height: orderPopup.height
            clip: true
            color: "white"

            Rectangle {
                id: title
                height: 30
                width: popupContainer.width
                anchors {
                    top: popupContainer.top
                }
                color: "lightgrey"

                Text {
                    id: close
                    text: "\ue805"
                    color: close_hover.containsMouse ? "#eee" : "white"
                    font {
                        family: Fonts.sgicons
                        pixelSize: 20
                    }
                    anchors {
                        right: title.right
                        verticalCenter: title.verticalCenter
                        rightMargin: 10
                    }

                    MouseArea {
                        id: close_hover
                        anchors {
                            fill: close
                        }
                        onClicked: orderPopup.close()
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }

            WebEngineView {
                id: webview
                anchors {
                    top: title.bottom
                    left: popupContainer.left
                    right: popupContainer.right
                    bottom: popupContainer.bottom
                }
                url: ""
            }
        }
    }

}

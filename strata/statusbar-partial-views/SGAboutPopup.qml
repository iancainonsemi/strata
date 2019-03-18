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
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Fonts 1.0
import QtGraphicalEffects 1.0

Popup {
    id: profilePopup
    width: Math.max(container.width * 0.8, 600)
    height: Math.max(container.parent.windowHeight * 0.5, 350)
    modal: true
    focus: true
    padding: 0
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    DropShadow {
        width: profilePopup.width
        height: profilePopup.height
        horizontalOffset: 1
        verticalOffset: 3
        radius: 15.0
        samples: 30
        color: "#cc000000"
        source: profilePopup.background
        z: -1
        cached: true
    }

    Item {
        id: popupContainer
        width: profilePopup.width
        height: profilePopup.height
        clip: true

        Image {
            id: background
            source: "qrc:/images/login-background.svg"
            height: 1080
            width: 1920
            x: (popupContainer.width - width)/2
            y: (popupContainer.height - height)/2
        }

        Rectangle {
            id: title
            height: 30
            width: popupContainer.width
            anchors {
                top: popupContainer.top
            }
            color: "lightgrey"

            Label {
                id: profileTitle
                anchors {
                    left: title.left
                    leftMargin: 10
                    verticalCenter: title.verticalCenter
                }
                text: "About Strata"
                font {
                    family: Fonts.franklinGothicBold
                }
                color: "black"
            }

            Text {
                id: close_profile
                text: "\ue805"
                color: close_profile_hover.containsMouse ? "#eee" : "white"
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
                    id: close_profile_hover
                    anchors {
                        fill: close_profile
                    }
                    onClicked: profilePopup.close()
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        Item {
            id: content
            anchors {
                top: title.bottom
                bottom: popupContainer.bottom
                right: popupContainer.right
                left: popupContainer.left
            }

            clip: true

            Item {
                id: contentContainer
                width: Math.max(popupContainer.width, 600)
                height: mainColumn.childrenRect.height
                anchors {
                    verticalCenter: content.verticalCenter
                }

                clip: true

                Column {
                    id: mainColumn
                    spacing: 30
                    width: contentContainer.width - 30
                    anchors {
                        horizontalCenter: contentContainer.horizontalCenter
                        verticalCenter: contentContainer.verticalCenter
                    }

                    Row {
                        id: logoContainer
                        height: 200
                        anchors {
                            horizontalCenter: mainColumn.horizontalCenter
                        }

                        Image {
                            id: strataLogo
                            source: "qrc:/images/strata-logo.svg"
                            sourceSize.height: logoContainer.height
                            fillMode: Image.PreserveAspectFit
                        }

                        Image {
                            id: onsemiLogo
                            source: "qrc:/images/on-semi-logo-horiz.svg"
                            sourceSize.height: logoContainer.height/2
                            fillMode: Image.PreserveAspectFit
                            anchors {
                                verticalCenter: strataLogo.verticalCenter
                            }
                        }
                    }

                    Rectangle {
                        id: aboutTextContainer
                        width: mainColumn.width - 200
                        height: aboutText.contentHeight + 40
                        color: "#eee"
                        anchors {
                            horizontalCenter: mainColumn.horizontalCenter
                        }

                        TextEdit {
                            id: aboutText
                            anchors {
                                left: aboutTextContainer.left
                                right: aboutTextContainer.right
                                top: aboutTextContainer.top
                                margins: 20
                            }
                            // versionNumber is set in main.qml in mainWindow at top
                            text: "<b>" + versionNumber + "</b><br><br>Designed by engineers for engineers to securely deliver software & information, efficiently bringing you the focused info you need, nothing you don’t."
                            wrapMode: TextEdit.Wrap
                            horizontalAlignment: Text.AlignHCenter
                            textFormat: TextEdit.RichText
                        }
                    }

//                    Rectangle {
//                        id: nameContainer
//                        width: mainColumn.width
//                        height: Math.max(hardwareText.contentHeight + 40, softwareText.contentHeight + 40)
//                        color: "#eee"

//                        Row {
//                            id:namesRow
//                            anchors {
//                                top: nameContainer.top
//                                topMargin: 20
//                                horizontalCenter: nameContainer.horizontalCenter
//                            }

//                        TextEdit {
//                            id: hardwareText
//                            width: (nameContainer.width/2)-20
//                            text: "<b>Hardware Team:</b><br><br>Ed Osburn<br>Lorem ipsum<br>dolor sit amet<br>consectetur adipiscing<br>elit. Aenean id<br>dapibus purus.<br>Aliquam nibh velit,<br>volutpat et consequat<br>id, feugiat nec diam.<br>Mauris arcu nibh,<br>vulputate eu iaculis<br>ac, convallis vitae<br>nunc. Morbi ac<br>sodales ante,<br>sed accumsan<br>orci. Fusce vitae<br>neque quis nibh<br>vestibulum suscipit<br>in nec mauris."
//                            wrapMode: TextEdit.Wrap
//                            textFormat: TextEdit.RichText
//                        }

//                        TextEdit {
//                            id: softwareText
//                            width: (nameContainer.width/2)-20
//                            text: "<b>Software Team:</b><br><br>Ian Cain<br>Lorem ipsum<br>dolor sit amet<br>consectetur adipiscing<br>elit. Aenean id<br>dapibus purus.<br>Aliquam nibh velit,<br>volutpat et consequat<br>id, feugiat nec diam.<br>Mauris arcu nibh,<br>vulputate eu iaculis<br>ac, convallis vitae<br>nunc. Morbi ac<br>sodales ante,<br>sed accumsan<br>orci. Fusce vitae<br>neque quis nibh<br>vestibulum suscipit<br>in nec mauris."
//                            wrapMode: TextEdit.Wrap
//                            textFormat: TextEdit.RichText
//                        }
//                        }

//                    }
                }
            }
        }
    }
}

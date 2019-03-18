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
import QtQuick.Dialogs 1.3
import "content-widgets"
import Fonts 1.0

Rectangle {
    id: root
    implicitHeight: downloadControlsContainer.height + downloadControlsContainer.anchors.topMargin
    implicitWidth: parent.width
    color: Qt.darker("#666")

    function resetModel(model) {
        buttons.radioButtons.model = model
    }

    MouseArea {
        // Blocks clickthroughs
        anchors { fill: root }
        hoverEnabled: true
        preventStealing: true
        propagateComposedEvents: false
    }

    Item {
        id: downloadControlsContainer
        width: root.width - 20
        height: contentColumn.height
        anchors {
            top: root.top
            topMargin: 20
            horizontalCenter: root.horizontalCenter
        }

        Column {
            id: contentColumn
            anchors {
                horizontalCenter: downloadControlsContainer.horizontalCenter
            }
            width: downloadControlsContainer.width
            spacing: 20

            Text {
                id: title
                text: "<b>Select files for download:</b>"
                color: "white"
                font {
                    pixelSize: 16
                }
            }

            Item {
                id: radioButtonIndent
                height: buttons.height
                width: buttons.width

                SGRadioButtonContainer {
                    id: buttons

                    textColor: "white"      // Default: "#000000"  (black)
                    radioColor: "white"     // Default: "#000000"  (black)
                    exclusive: false         // Default: true

                    radioGroup: Column {
                        id: column
                        spacing: contentColumn.spacing

                        property alias selectAll: selectAll
                        property alias downloadListView: downloadListView
                        property alias model: downloadListView.model

                        property bool anythingChecked: false  // represents both if nothing or >0 things are checked
                        property bool allChecked: false

                        SGRadioButton {
                            id: selectAll
                            text: "Select All"
                            checked: allChecked
                            onCheckedChanged: {
                                if (checked) {
                                    for (var i = 0; i < downloadListView.contentItem.children.length; i++){
                                        if (downloadListView.contentItem.children[i].objectName === "radioButton"){
                                            downloadListView.contentItem.children[i].checked = true;
                                        }
                                    }
                                } else if ( allChecked ) {
                                    for (var j = 0; j < downloadListView.contentItem.children.length; j++){
                                        if (downloadListView.contentItem.children[j].objectName === "radioButton"){
                                            downloadListView.contentItem.children[j].checked = false;
                                        }
                                    }
                                }
                            }
                        }

                        Rectangle {
                            id: listViewContainer
                            border {
                                width: 1
                                color: "#ccc"
                            }
                            color: "transparent"
                            height: downloadListView.height + 20
                            width: contentColumn.width
                            clip: true

                            ListView {
                                id: downloadListView
                                anchors {
                                    centerIn: listViewContainer
                                }
                                ScrollBar.vertical: ScrollBar {
                                    policy: ScrollBar.AlwaysOn
                                }
                                height: Math.min(600, contentItem.childrenRect.height)
                                width: listViewContainer.width - 20

                                section {
                                    property: "dirname"
                                    delegate: Item {
                                        id: sectionContainer
                                        width: downloadListView.width - 20
                                        height: delegateText.height + 10

                                        Item {
                                            id: sectionBackground
                                            anchors {
                                                topMargin: 5
                                                fill: parent
                                                bottomMargin: 1
                                            }

                                            Rectangle {
                                                id: underline
                                                color: "#33b13b"
                                                height: 1
                                                width: sectionBackground.width
                                                anchors {
                                                    bottom: sectionBackground.bottom
                                                }
                                            }
                                        }

                                        Text {
                                            id: delegateText
                                            text: "<b>" + section + "</b>"
                                            color: "white"
                                            anchors {
                                                verticalCenter: sectionContainer.verticalCenter
                                                right: sectionContainer.right
                                            }
                                            width: sectionContainer.width - 5
                                            wrapMode: Text.Wrap
                                            font.capitalization: Font.Capitalize
                                        }
                                    }
                                }

                                delegate:  Item {
                                    id: delegateContainer
                                    height: Math.max(delegateRadio.height+10, delegateText.height + 10)
                                    width: downloadListView.width - 20
                                    property alias checked: delegateRadio.checked
                                    property alias text: delegateText.text
                                    property string uri: model.uri
                                    objectName: "radioButton"

                                    Rectangle {
                                        anchors {
                                            fill: delegateContainer
                                            bottomMargin: 1
                                        }

                                        color: mouseArea.pressed ? "#888": mouseArea.containsMouse ? "#666" : "#444"
                                    }

                                    SGRadioButton {
                                        id: delegateRadio
                                        text: ""
                                        onCheckedChanged: {
                                            whichChecked ()
                                        }
                                        anchors {
                                            left: delegateContainer.left
                                            leftMargin: 5
                                            verticalCenter: delegateContainer.verticalCenter
                                        }
                                        ButtonGroup.group: buttonGroup
                                    }

                                    Text {
                                        id: delegateText
                                        text: model.filename
                                        color: "white"
                                        anchors {
                                            verticalCenter: delegateRadio.verticalCenter
                                            left: delegateRadio.right
                                            leftMargin: 10
                                            right: delegateContainer.right
                                            rightMargin: 5
                                        }
                                        wrapMode: Text.Wrap
                                    }

                                    MouseArea {
                                        id: mouseArea
                                        anchors {
                                            fill: delegateText
                                        }
                                        hoverEnabled: true
                                        onClicked: {
                                            delegateRadio.checked = !delegateRadio.checked
                                        }
                                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                                    }
                                }

                                ButtonGroup {
                                    id: buttonGroup
                                    exclusive: false
                                }
                            }
                        }

                        function whichChecked() { // This functionality is integrated in QT 5.11 in buttonGroup.checkState, but for now, have to manually do it in 5.10
                            var all = true
                            var none = true
                            var anything = false
                            for (var i = 0; i < downloadListView.contentItem.children.length; i++){
                                if (downloadListView.contentItem.children[i].objectName === "radioButton" && downloadListView.contentItem.children[i].checked === false) {
                                    all = false
                                } else if (downloadListView.contentItem.children[i].objectName === "radioButton" && downloadListView.contentItem.children[i].checked === true) {
                                    anything = true;
                                    none = false
                                }
                            }
                            if (none) {
                                anythingChecked = false
                                allChecked = false
                            } else if (all) {
                                anythingChecked = true
                                allChecked = true
                            } else if (anything) {
                                anythingChecked = true
                                allChecked = false
                            }
                        }
                    }
                }
            }

            Button {
                id: fileDialogButton
                text: "Select Where to Download"
                onClicked: fileDialog.visible = true
                anchors {
                    horizontalCenter: contentColumn.horizontalCenter
                }
            }

            TextEdit {
                id: selectedDir
                text: "No Download Directory Selected"
                color: "white"
                wrapMode: TextEdit.Wrap
                width: downloadControlsContainer.width
            }

            Button {
                id: download
                enabled: buttons.radioButtons.anythingChecked && fileDialog.fileUrl != ""
                anchors {
                    horizontalCenter: contentColumn.horizontalCenter
                }
                opacity: enabled ? 1 : .2

                contentItem: Text {
                    color: "white"
                    text: "Download"
                    opacity: 1
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                background: Rectangle {
                    color: "#33b13b"
                    implicitWidth: 100
                    implicitHeight: 40
                }

                onClicked: {
                    downloadActiveCoverup.visible = true
                    progressBarFake.start()

                    var download_json = {
                        "hcs::cmd":"download_files",
                        "payload": []
                    }

                    for (var i = 0; i < buttons.radioButtons.downloadListView.contentItem.children.length; i++){
                        if (buttons.radioButtons.downloadListView.contentItem.children[i].objectName === "radioButton" && buttons.radioButtons.downloadListView.contentItem.children[i].checked) {
                            download_json.payload.push({
                                                           "file":buttons.radioButtons.downloadListView.contentItem.children[i].uri,
                                                           "path":fileDialog.fileUrl.toString(),
                                                           "name":buttons.radioButtons.downloadListView.contentItem.children[i].text
                                                       })
                        }
                    }

                    console.log("sending the jwt json to hcs",JSON.stringify(download_json))
                    coreInterface.sendCommand(JSON.stringify(download_json))
                }
            }

            Item {
                id: spacer7
                height: 1
                width: contentColumn.width
            }
        }
    }

    Rectangle {
        id: downloadActiveCoverup
        color: Qt.darker("#666")
        visible: false
        anchors {
            fill: downloadControlsContainer
        }

        MouseArea {
            id: mouseDisabler
            anchors {
                fill: downloadActiveCoverup
            }
        }

        Rectangle {
            id: progressBarContainer
            height: 30
            border {
                width: 1
                color: "white"
            }
            color: "transparent"
            width: downloadActiveCoverup.width
            anchors {
                centerIn: downloadActiveCoverup
            }

            Rectangle {
                id: progressBar
                color: "#33b13b"
                height: progressBarContainer.height - 6
                anchors {
                    verticalCenter: progressBarContainer.verticalCenter
                    left: progressBarContainer.left
                    leftMargin: 3
                }
                width: 1

                PropertyAnimation {
                    id: progressBarFake
                    target: progressBar
                    property: "width"
                    from: 1
                    to: progressBarContainer.width - 6
                    duration: 2000
                }
            }
        }

        Text {
            id: progressStatus
            text: "" + (100 * progressBar.width / (progressBarContainer.width - 6)).toFixed(0) + "% complete"
            color: "white"
            anchors {
                bottom: progressBarContainer.top
                right: progressBarContainer.right
                bottomMargin: 3
            }
        }

        Button {
            id: progressButton
            anchors {
                top: progressBarContainer.bottom
                topMargin: 30
                horizontalCenter: progressBarContainer.horizontalCenter
            }
            text: "Back"
            onClicked: downloadActiveCoverup.visible = false
        }
    }


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        selectFolder: true
        selectMultiple: false
        onAccepted: {
            selectedDir.text = "Files will be downloaded to: " + fileDialog.fileUrl
            //            console.log("You chose: " + fileDialog.fileUrl)
        }
        onRejected: {
            //            console.log("Canceled")
        }
    }
}

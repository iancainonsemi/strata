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

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "qrc:/views/bubu/Control.js" as BubuControl


Rectangle{
    id:serialContainer
    property string binaryConversion: ""
    property int indexHolder: 0
    property string i2c_ack

    /*
      Parse notification to check the acknowledge
    */
    function i2cAckParse(notification) {
        var i2c_Ack = notification.payload.ack_or_nack;

        if(i2c_Ack !== undefined){
            i2cAcknowledge.text = i2c_Ack
            if(i2c_Ack === "ack") {
                i2cAcknowledge.textColor = "green"
            }
            else {
                i2cAcknowledge.textColor = "red"
            }
        }
        else
        {
            console.log("Junk data found", i2c_Ack);
        }
    }

    /*
        Parse i2c notification to get read data
    */
    function i2cReadDataParse(notification) {
        var readData = notification.payload.read_data

        if(readData !== undefined){
            dataValue.text = readData.toString(16);
        }
        else
        {
            console.log("Junk data found", readData);
        }
    }
    /*
        convert hexadecimal to binary
    */
    function hex2bin(hex) {
        return ("00000000" + (parseInt(hex, 16)).toString(2)).substr(-8);
    }

    /*
        validate the string to check if it's hexadecimal
    */
    function isHex(str){
        var hexValues = '0123456789ABCDEFabcdef'

        for(var i = 0; i < str.length; ++i) {
            if(!hexValues.includes(str[i])) {
                return false;
            }

        }
        return true;
    }

    Text {
        id: i2cTitle
        text: "I2C Communication"
        font.family: "Helvetica"
        font.pointSize: 24
        anchors {
            left: serialContainer.left
            leftMargin: 10
        }
    }


    RowLayout {
        id: firstRowSetting
        width : parent.width
        height: 100
        anchors.top: i2cTitle.bottom

        Text {
            id: selectChannel
            text: "Channel Select"
            anchors {
                left: firstRowSetting.left
                leftMargin: 10
            }
        }

        ComboBox {
            id: i2cModel
            anchors{ left: selectChannel.right
                leftMargin: 10
            }
            model: ["I2C 0", "I2C 1", "I2C 2"]
            onCurrentIndexChanged: {
                if(currentIndex == 0) {
                    sclkModel.model = ["PC 7"]
                    sdaModel.model = ["PC 6"]

                }
                if(currentIndex == 1){
                    sclkModel.model = ["PE 1"]
                    sdaModel.model = ["PE 0"]

                }

                if(currentIndex == 2){
                    sclkModel.model = ["PE 11"]
                    sdaModel.model = ["PE 10"]

                }
            }

        }

        Text {
            id: selectSDA
            text: "SDA"

        }

        ComboBox {
            id: sdaModel
            anchors{ left: selectSDA.right
                leftMargin: 10
            }
            model: ["First", "Second", "Third"]

        }

        Text {
            id: selectSCLK
            text: "SCLK"
        }

        ComboBox {
            id:sclkModel
            anchors{ left: selectSCLK.right
                leftMargin: 10
            }
            model: ["First", "Second", "Third"]

        }

        Button {
            id: i2cConfig
            text : "Configure I2C"

            onClicked: {
                /*
                  set I2c Configure command
                */
                BubuControl.setI2cBusNumber(i2cModel.currentIndex+1);
                BubuControl.setI2cBusSpeed(busRateValue.text);
                coreInterface.sendCommand(BubuControl.getI2cConfigure());

            }
        }
    }

    RowLayout {
        id: secondRowSetting
        width : parent.width
        height: 100
        anchors.top: firstRowSetting.bottom

        Text {
            id: slaveAddress
            text: "Slave Address (Hex)"
            anchors {
                left: secondRowSetting.left
                leftMargin: 10
            }
        }

        TextField {
            id: slaveAddressValue
            anchors{ left: slaveAddress.right
                leftMargin: 10
            }
            text: "07"

        }

        Text {
            id: registerAddress
            text: "Register Address (Hex)"
        }
        TextField {
            id: registerAddressValue
            anchors{ left: registerAddress.right
                leftMargin: 10
            }
            text: "10"

        }

        Text {
            id: busRate
            text: "Bus Rate"
        }
        TextField {
            id: busRateValue
            anchors{ left: busRate.right
                leftMargin: 10
            }
            text : "400000"
        }
    }

    RowLayout {
        id: thirdRowSetting
        width : parent.width
        height: 100

        anchors.top: secondRowSetting.bottom

        Text {
            id: dataText
            anchors {
                left: thirdRowSetting.left
                leftMargin: 10
            }
            text: "Data (Hex)"
        }
        TextField {
            id: dataValue
            anchors{ left: dataText.right
                leftMargin: 10
            }

            text: "21"
            onTextChanged: {
                if(isHex(dataValue.text) === true) {
                    binaryConversion =  hex2bin(dataValue.text);
                }
                /*
                        Iterating the string to set the list model
                        to display the binary number
                */
                for (var i = 0; i < binaryConversion.length; ++i) {
                    binaryModal.get(i).value = binaryConversion.charAt(i);

                }
            }
        }


        ListView {
            id: bitview
            model: ListModel {
                id:binaryModal
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
                ListElement{
                    value:"0"
                }
            }

            width: 250
            height: 40
            spacing: 30
            anchors.leftMargin: 20
            orientation: ListView.Horizontal

            delegate: Rectangle  {
                id: binaryContainer
                TextField {
                    id: binaryNumber
                    text: value
                    width: 30
                    height: 30

                }

            }
        }
        Button {
            id: readButton
            anchors { left : bitview.right
                leftMargin: 20
            }
            text: "Read"
            onClicked: {
                /*
                  Set the I2C read command
                */
                BubuControl.setI2cBusNumber(i2cModel.currentIndex+1);
                BubuControl.setI2cSlaveAddressRead(parseInt(slaveAddressValue.text, 16));
                BubuControl.setI2cRegisterAddressRead(parseInt(registerAddressValue.text,16));
                coreInterface.sendCommand(BubuControl.getI2cRead());

            }

        }
        Button {
            id: writeButton
            anchors { left : readButton.right
                leftMargin: 20
            }
            text: "Write"
            onClicked: {
                /*
                  Set the I2C write command
                */
                BubuControl.setI2cBusNumber(i2cModel.currentIndex+1);
                BubuControl.setI2cSlaveAddressWrite(parseInt(slaveAddressValue.text, 16));
                BubuControl.setI2cRegisterAddressWrite(parseInt(registerAddressValue.text,16));
                BubuControl.setI2cData(parseInt(dataValue.text,16));
                coreInterface.sendCommand(BubuControl.getI2cWrite());

            }
        }

        TextField {
            id: i2cAcknowledge
            anchors { left : writeButton.right
                leftMargin: 20
            }
            placeholderText: "ACK/NCK"
        }

    }

    I2CTable {
        anchors.top: thirdRowSetting.bottom
    }


}

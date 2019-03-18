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
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import "qrc:/views/led/sgwidgets"
import "qrc:/views/led/views/basic-partial-views"

Rectangle {
    id: root
    anchors.fill:parent
    color:"dimgrey"

    property string textColor: "white"
    property string secondaryTextColor: "grey"
    property string windowsDarkBlue: "#2d89ef"
    property string backgroundColor: "#FF2A2E31"
    property string transparentBackgroundColor: "#002A2E31"
    property string dividerColor: "#3E4042"
    property string switchGrooveColor:"dimgrey"
    property int leftSwitchMargin: 40
    property int rightInset: 50
    property int leftScrimOffset: 310
    property bool pulseColorsLinked: false

    property real widthRatio: root.width / 1200

    function rgbToHsl(r, g, b) {
      r /= 255
      g /= 255
      b /= 255
      var max = Math.max(r, g, b), min = Math.min(r, g, b)
      var h, s, l = (max + min) / 2
      if (max == min) {
        h = s = 0
      } else {
        var d = max - min
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min)
        switch (max) {
        case r:
          h = (g - b) / d + (g < b ? 6 : 0)
          break
        case g:
          h = (b - r) / d + 2
          break
        case b:
          h = (r - g) / d + 4
          break
        }
        h /= 6;
      }
      return {"h":h, "s":s, "l":l};
    }

    //----------------------------------------------------------------------------------------
    //                      Views
    //----------------------------------------------------------------------------------------


    Rectangle{
        id:deviceBackground
        color:backgroundColor
        radius:10
        height:(7*parent.height)/16
        anchors.left:root.left
        anchors.leftMargin: 12
        anchors.right: root.right
        anchors.rightMargin: 12
        anchors.top:root.top
        anchors.topMargin: 12
        anchors.bottom:root.bottom
        anchors.bottomMargin: 12

        Rectangle{
            id:pwmContainer
            anchors.left:parent.left
            anchors.right:parent.right
            anchors.top:parent.top
            height: parent.height/4
            color:"transparent"

            Image{
                id:pwmIcon
                height:parent.height/4
                width:parent.height/4
                mipmap:true
                anchors.top:parent.top
                anchors.topMargin: 15
                anchors.left:parent.left
                anchors.leftMargin: 10
                source:"./images/icon-pulse.svg"
            }

            Text{
                id:pwmTitle
                text: "Pulse"
                font.pixelSize: parent.height/4
                color: textColor
                anchors.top:parent.top
                anchors.topMargin:5
                anchors.left:pwmIcon.right
                anchors.leftMargin: 20
            }

            Text{
                id:pwmSubtitle
                text: "2 Channel PWM RGB Control"
                font.pixelSize: parent.height/14
                color: secondaryTextColor
                anchors.top:pwmTitle.bottom
                anchors.topMargin:-5
                anchors.left:pwmTitle.left
            }

            SGSwitch{
                id:pwmSwitch
                anchors.left:parent.left
                anchors.leftMargin: leftSwitchMargin
                anchors.verticalCenter: parent.verticalCenter
                grooveFillColor:windowsDarkBlue
                grooveColor:"black"
                checked:platformInterface.set_pulse_colors_notification.enabled

                onToggled:{
                    console.log("pulse switch value changed")
                    platformInterface.set_pulse_colors.update(pwmSwitch.checked,
                                                              platformInterface.set_pulse_colors_notification.channel1_color,
                                                              platformInterface.set_pulse_colors_notification.channel2_color);
                }
            }

            RoundButton{
                id:pulseScrim
                anchors.left: parent.left
                anchors.leftMargin:leftScrimOffset
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right:parent.right
                visible:!pwmSwitch.checked
                opacity:1
                z:5

                onVisibleChanged:{
                    if (visible){
                        pulseScrimToOpaque.start()
                    }
                    else{
                        pulseScrimToTransparent.start()
                    }
                }

                OpacityAnimator{
                    id:pulseScrimToOpaque
                    target:pulseScrim
                    from: 0
                    to: 1
                    duration:1000
                    running:false
                }

                OpacityAnimator{
                    id:pulseScrimToTransparent
                    target:pulseScrim
                    from: 1
                    to: 0
                    duration:1000
                    running:false
                }

                background:Rectangle{
                    color:"transparent"
                    radius:5
                }

                LinearGradient {
                       anchors.fill: parent
                       start: Qt.point(0, 0)
                       end: Qt.point(parent.width, 0)
                       gradient: Gradient {
                           GradientStop { position: 0.0; color: "#00000000"}
                           GradientStop { position: .15; color: "#66000000" }
                           GradientStop { position: .5; color: "#BB000000" }

                       }
                   }
            }

            Text{
                id:channel1Title
                text: "1"
                font.pixelSize: parent.height *1.2
                color: secondaryTextColor
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:pwmSwitch.right
                anchors.leftMargin: 220
                opacity:.2
            }

            Rectangle {
                id: ledControlContainer
                height: childrenRect.height + 10
                width: 200
                color: "transparent"

                Layout.fillWidth: true
                Layout.minimumWidth: 50

                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 0
                    left:channel1Title.right
                    leftMargin: 0
                    right: leftPWMlights.left
                    rightMargin: 25
                }

                SGHueSlider {

                    id: hueSlider
                    label: ""
                    labelLeft: true
                    value: {
                        var theColorString = platformInterface.set_pulse_colors_notification.channel1_color;

                        //convert the rgb color to a hsv color
                        var r = parseInt(theColorString.substr(0, 2), 16)
                        var g = parseInt(theColorString.substr(2, 2), 16)
                        var b = parseInt(theColorString.substr(4, 2), 16)
                        //console.log("r,g,b=",r,g,b);
                        var hsl = rgbToHsl(r, g, b)
                        //console.log("h,s,v=",hsl.h,hsl.s,hsl.l)

                        //The returned value is between 0 and 1, so scale to match the slider's range
                        return hsl.h * 255;
                    }
                    sliderHeight:50
                    anchors {
                        left: ledControlContainer.left
                        leftMargin: 10
                        right: ledControlContainer.right
                        rightMargin: 10
                        top: ledControlContainer.top
                        topMargin: 10
                    }

                    onUserSet: {
                        var colorString = hueSlider.hexvalue.substring(1,7); //remove the # from the start of the string

                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      colorString,
                                                                      colorString);
                        }
                        else{
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      colorString,
                                                                      platformInterface.set_pulse_colors_notification.channel2_color);
                        }
                    }

                }

                Text {
                    id:colorButtonsText
                    text:"Set to:"
                    color:secondaryTextColor
                    font.pixelSize: 12

                    anchors.left:hueSlider.left
                    anchors.top: hueSlider.bottom
                    anchors.topMargin: 10
                }

                Button {
                    id:whiteButton
                    height:24
                    width:24
                    anchors.left:colorButtonsText.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: colorButtonsText.verticalCenter

                    background: Rectangle {
                            id: whiteButtonBackgroundRect
                            implicitWidth: 24
                            implicitHeight: 24
                            radius: 12
                            anchors.fill: parent
                            color: "white"
                    }

                    onClicked: {
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  "FFFFFF",
                                                                  "FFFFFF");
                        }
                        else{
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  "FFFFFF",
                                                                  platformInterface.set_pulse_colors_notification.channel2_color);
                        }
                    }
                }

                Button {
                    id:blackButton
                    height:26
                    width:26
                    anchors.left:whiteButton.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: colorButtonsText.verticalCenter

                    background: Rectangle {
                            id: blackButtonBackgroundRect
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            anchors.fill: parent
                            color: "black"
                    }

                    onClicked: {
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  "000000",
                                                                  "000000");
                        }
                        else{
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  "000000",
                                                                  platformInterface.set_pulse_colors_notification.channel2_color);
                        }
                    }
                }



                SGSubmitInfoBox{
                    id:pwmColorBox1
                    anchors.right:hueSlider.right
                    anchors.rightMargin: 10
                    anchors.top: hueSlider.bottom
                    anchors.topMargin: 10
                    infoBoxWidth:65
                    height:20
                    textColor:"white"
                    realNumberValidation: true
                    value: platformInterface.set_pulse_colors_notification.channel1_color

                    onApplied:{
                        sendValue();
                    }

                    function sendValue(){
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      pwmColorBox1.value,
                                                                      pwmColorBox1.value);
                        }
                        else{
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  pwmColorBox1.value,
                                                                  platformInterface.set_pulse_colors_notification.channel2_color);
                        }
                    }
                }


            }



            Button{
                id:topGroupButton
                anchors.left:leftPWMlights.left
                anchors.leftMargin: 10
//                anchors.top:parent.top
//                anchors.topMargin: 15
                anchors.right:rightPWMlights.right
                anchors.rightMargin: 15
                anchors.bottom:leftPWMlights.top
                height:25
                checkable:true
                opacity: checked ? 1 : .2
                checked: root.pulseColorsLinked

                contentItem: Image {
                        source:"./images/connectionBracket.svg"
                    }

                background: Rectangle {
                        id: topGroupButtonBackgroundRect
                        radius: 2
                        anchors.fill: parent
                        color: "transparent"
                }

                onClicked:{
                    //when this button is turned on:
                    //• send a command to the platform that the color for both sides should be the left color
                    if (root.pulseColorsLinked){
                        root.pulseColorsLinked = false;
                    }
                    else{
                        root.pulseColorsLinked = true;
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  pwmColorBox1.value,
                                                                  pwmColorBox1.value);
                    }

                }
            }

            Column{
                id:leftPWMlights
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 75*widthRatio
                //anchors.left: ledControlContainer.right
                //anchors.leftMargin: 25
                width:50
                spacing:10

                LEDIndicator{
                    id: pwmLED1
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel1_color
                        theColor = "#"+theColor
                        return theColor
                    }

                    height: root.height * .05
                }
                LEDIndicator{
                    id: pwmLED2
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel1_color
                        theColor = "#"+theColor
                        return theColor
                    }
                    //height: 40
                    height: root.height * .05
                }
                LEDIndicator{
                    id: pwmLED3
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel1_color
                        theColor = "#"+theColor
                        return theColor
                    }
                    //height: 40
                    height: root.height * .05
                }
            }

            Column{
                id:rightPWMlights
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: leftPWMlights.right
                anchors.leftMargin: 10
                width:50
                spacing:10

                LEDIndicator{
                    id: pwmLED4
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel2_color
                        theColor = "#"+theColor
                        return theColor
                    }
                    //height: 40
                    height: root.height * .05
                }
                LEDIndicator{
                    id: pwmLED5
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel2_color
                        theColor = "#"+theColor
                        return theColor
                    }
                    //height: 40
                    height: root.height * .05
                }
                LEDIndicator{
                    id: pwmLED6
                    ledColor: {
                        var theColor = platformInterface.set_pulse_colors_notification.channel2_color
                        theColor = "#"+theColor
                        return theColor
                    }
                    //height: 40
                    height: root.height * .05
                }
            }

            Button{
                id:bottomGroupButton
                anchors.left:leftPWMlights.left
                anchors.leftMargin: 10
                anchors.top:leftPWMlights.bottom
                anchors.right:rightPWMlights.right
                anchors.rightMargin: 15
//                anchors.bottom:parent.bottom
//                anchors.bottomMargin: 15
                height:25
                checkable:true
                opacity: checked ? 1 : .2
                checked: root.pulseColorsLinked

                contentItem: Image {
                        source:"./images/connectionBracketFlipped.svg"
                    }

                background: Rectangle {
                        id: bottomGroupButtonBackgroundRect
                        radius: 2
                        anchors.fill: parent
                        color: "transparent"
                }


                onClicked:{
                    //when this button is turned on:
                    //• send a command to the platform that the color for both sides should be the left color
                    if (root.pulseColorsLinked){
                        root.pulseColorsLinked = false;
                    }
                    else{
                        root.pulseColorsLinked = true;
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  pwmColorBox1.value,
                                                                  pwmColorBox1.value);
                    }

                }
            }



            Rectangle {
                id: ledControlContainer2
                height: childrenRect.height + 10
                color: "transparent"
                anchors {
                    verticalCenter: parent.verticalCenter
                    right:channel2Title.left
                    rightMargin: 0
                    left: rightPWMlights.right
                    leftMargin: 25
                }

                SGHueSlider {
                    property color theColor: "white"

                    id: hueSlider2
                    label: ""
                    labelLeft: true
                    value: {
                        var theColorString = platformInterface.set_pulse_colors_notification.channel2_color;

                        //convert the rgb color to a hsv color
                        var r = parseInt(theColorString.substr(0, 2), 16)
                        var g = parseInt(theColorString.substr(2, 2), 16)
                        var b = parseInt(theColorString.substr(4, 2), 16)
                        var hsl = rgbToHsl(r, g, b)

                        //The returned value is between 0 and 1, so scale to match the slider's range
                        return hsl.h * 255;
                    }
                    sliderHeight:50
                    anchors {
                        left: ledControlContainer2.left
                        leftMargin: 10
                        right: ledControlContainer2.right
                        rightMargin: 10
                        top: ledControlContainer2.top
                        topMargin: 10
                    }

                    onUserSet: {
                         var colorString = hueSlider2.hexvalue.substring(1,7); //remove the # from the start of the string

                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      colorString,
                                                                      colorString);
                        }
                        else{
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  platformInterface.set_pulse_colors_notification.channel1_color,
                                                                  colorString);
                        }
                    }
                }

                Text {
                    id:colorButtonsText2
                    text:"Set to:"
                    color:secondaryTextColor
                    font.pixelSize: 12

                    anchors.left:hueSlider2.left
                    anchors.top: hueSlider2.bottom
                    anchors.topMargin: 10
                }

                Button {
                    id:whiteButton2
                    height:24
                    width:24
                    anchors.left:colorButtonsText2.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: colorButtonsText2.verticalCenter

                    background: Rectangle {
                            id: whiteButtonBackgroundRect2
                            implicitWidth: 24
                            implicitHeight: 24
                            radius: 12
                            anchors.fill: parent
                            color: "white"
                    }

                    onClicked: {
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      "FFFFFF",
                                                                      "FFFFFF");
                        }
                        else{
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  platformInterface.set_pulse_colors_notification.channel1_color,
                                                                  "FFFFFF");
                        }
                    }
                }

                Button {
                    id:blackButton2
                    height:26
                    width:26
                    anchors.left:whiteButton2.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: colorButtonsText2.verticalCenter

                    background: Rectangle {
                            id: blackButtonBackgroundRect2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            anchors.fill: parent
                            color: "black"
                    }

                    onClicked: {
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      "000000",
                                                                      "000000");
                        }
                        else{
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  platformInterface.set_pulse_colors_notification.channel1_color,
                                                                  "000000");
                        }
                    }
                }



                SGSubmitInfoBox{
                    id:pwmColorBox2
                    anchors.right:ledControlContainer2.right
                    anchors.rightMargin: 10
                    anchors.top: hueSlider2.bottom
                    anchors.topMargin: 10

                    infoBoxWidth:65
                    height:20
                    textColor:"white"
                    realNumberValidation: true
                    value:platformInterface.set_pulse_colors_notification.channel2_color

                    onApplied:{
                        if (root.pulseColorsLinked){
                            platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                      pwmColorBox2.value,
                                                                      pwmColorBox2.value);
                        }
                        else{
                        platformInterface.set_pulse_colors.update(platformInterface.set_pulse_colors_notification.enabled,
                                                                  platformInterface.set_pulse_colors_notification.channel1_color,
                                                                  pwmColorBox2.value);
                        }
                    }
                }


            }



            Text{
                id:channel2Title
                text: "2"
                font.pixelSize: parent.height *1.2
                color: secondaryTextColor
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: rightInset

                opacity:.2
            }

            Rectangle {
                id:divider1
                color: dividerColor
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.bottom:parent.bottom
                height:1
            }

        }

//----------------------------------------------------------------------------------------
//                      Linear
//----------------------------------------------------------------------------------------
        Rectangle{
            id:linearContainer
            anchors.left:parent.left
            anchors.right:parent.right
            anchors.top:pwmContainer.bottom
            height: parent.height/4
            color:"transparent"

            Image{
                id:linearIcon
                height:parent.height/4
                width:parent.height/4
                mipmap:true
                anchors.top:parent.top
                anchors.topMargin: 15
                anchors.left:parent.left
                anchors.leftMargin: 10
                source:"./images/icon-linear.svg"
            }

            Text{
                id:linearTitle
                text: "Linear"
                font.pixelSize: parent.height/4
                color: textColor
                anchors.top:parent.top
                anchors.topMargin:5
                anchors.left:linearIcon.right
                anchors.leftMargin: 20
            }

            Text{
                id:linearSubtitle
                text: "1 Channel Linear RGB Control"
                font.pixelSize: parent.height/14
                color: secondaryTextColor
                anchors.top:linearTitle.bottom
                anchors.topMargin:-5
                anchors.left:linearTitle.left
            }


            SGSwitch{
                id:linearSwitch
                anchors.left:parent.left
                anchors.leftMargin: leftSwitchMargin
                anchors.verticalCenter: parent.verticalCenter
                grooveFillColor:windowsDarkBlue
                grooveColor:switchGrooveColor
                checked:platformInterface.set_linear_color_notification.enabled

                onToggled:{
                    platformInterface.set_linear_color.update(linearSwitch.checked,
                                                              platformInterface.set_linear_color_notification.color);
                }
            }


            RoundButton{
                id:linearScrim
                anchors.left: parent.left
                anchors.leftMargin:leftScrimOffset
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right:parent.right
                visible:!linearSwitch.checked
                z:5
                opacity:1

                onVisibleChanged:{
                    if (visible){
                        linearScrimToOpaque.start()
                    }
                    else{
                        linearScrimToTransparent.start()
                    }
                }

                OpacityAnimator{
                    id:linearScrimToOpaque
                    target:linearScrim
                    from: 0
                    to: 1
                    duration:1000
                    running:false
                }

                OpacityAnimator{
                    id:linearScrimToTransparent
                    target:linearScrim
                    from: 1
                    to: 0
                    duration:1000
                    running:false
                }

                background:Rectangle{
                    color:"transparent"
                    radius:5
                }

                LinearGradient {
                       anchors.fill: parent
                       start: Qt.point(0, 0)
                       end: Qt.point(parent.width, 0)
                       gradient: Gradient {
                           GradientStop { position: 0.0; color: "#00000000"}
                           GradientStop { position: .15; color: "#66000000" }
                           GradientStop { position: .5; color: "#BB000000" }
                       }
                   }
            }

            Rectangle {
                id: linearControlContainer
                height: childrenRect.height + 10
                color: "transparent"
                anchors {
                    left:parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 0
                    right:linearPWMlights.left
                    rightMargin: 100
                }

                SGHueSlider {
                    property color theColor:"white"

                    id: linearHueSlider
                    label: ""
                    labelLeft: true
                    value: {
                        var theColorString = platformInterface.set_linear_color_notification.color;

                        //convert the rgb color to a hsv color
                        var r = parseInt(theColorString.substr(0, 2), 16)
                        var g = parseInt(theColorString.substr(2, 2), 16)
                        var b = parseInt(theColorString.substr(4, 2), 16)
                        //console.log("linear color=",theColorString,"rgb=",r,g,b)
                        var hsl = rgbToHsl(r, g, b)

                        //The returned value is between 0 and 1, so scale to match the slider's range
                        return hsl.h * 255;
                    }
                    sliderHeight:50
                    anchors {
                        //verticalCenter: whiteButton.verticalCenter
                        left: linearControlContainer.left
                        leftMargin: 10
                        right: linearControlContainer.right
                        rightMargin: 10
                        top: linearControlContainer.top
                        topMargin: 10
                    }

                    onUserSet: {
                        var colorString = linearHueSlider.hexvalue.substring(1,7); //remove the # from the start of the string

                        platformInterface.set_linear_color.update(platformInterface.set_linear_color_notification.enabled,
                                                                  colorString);
                    }


                }

                Text {
                    id:linearColorButtonsText
                    text:"Set to:"
                    color:secondaryTextColor
                    font.pixelSize: 12

                    anchors.left: linearHueSlider.left
                    anchors.top: linearHueSlider.bottom
                    anchors.topMargin: 10
                }

                Button {
                    id:linearWhiteButton
                    height:24
                    width:24
                    anchors.left:linearColorButtonsText.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: linearColorButtonsText.verticalCenter

                    background: Rectangle {
                            id: linearWhiteButtonBackgroundRect
                            implicitWidth: 24
                            implicitHeight: 24
                            radius: 12
                            anchors.fill: parent
                            color: "white"
                    }


                    onClicked: {
                        platformInterface.set_linear_color.update(platformInterface.set_linear_color_notification.enabled,
                                                                  "FFFFFF");
                    }
                }

                Button {
                    id:linearBlackButton
                    height:26
                    width:26
                    anchors.left:linearWhiteButton.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: linearColorButtonsText.verticalCenter

                    background: Rectangle {
                            id: linearBlackButtonBackgroundRect
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            anchors.fill: parent
                            color: "black"
                    }

                    onClicked: {
                        platformInterface.set_linear_color.update(platformInterface.set_linear_color_notification.enabled,
                                                                  "000000");
                    }
                }


                SGSubmitInfoBox{
                    id:linearColorBox
                    anchors.right:linearControlContainer.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: linearWhiteButton.verticalCenter
                    infoBoxWidth:65
                    height:20
                    textColor:"white"
                    realNumberValidation: true
                    value:platformInterface.set_linear_color_notification.color

                    onApplied:{
                        platformInterface.set_linear_color.update(platformInterface.set_linear_color_notification.enabled,
                                                                  linearColorBox.value);
                    }
                }


            }



            Column{
                id:linearPWMlights
                anchors.top:parent.top
                anchors.topMargin: parent.height/8
                anchors.right: parent.right
                anchors.rightMargin: rightInset
                width:50
                spacing:10

                LEDIndicator{
                    id: linearLED1
                    ledColor: {
                        var theColor = platformInterface.set_linear_color_notification.color
                        theColor = "#"+theColor
                        return theColor
                    }
                    height: root.height * .05
                }
                LEDIndicator{
                    id: linearLED2
                    ledColor: {
                        var theColor = platformInterface.set_linear_color_notification.color
                        theColor = "#"+theColor
                        return theColor
                    }
                    height: root.height * .05
                }
                LEDIndicator{
                    id: linearLED3
                    ledColor: {
                        var theColor = platformInterface.set_linear_color_notification.color
                        theColor = "#"+theColor
                        return theColor
                    }
                    height: root.height * .05
                }
            }

            Rectangle {
                id:divider2
                color: dividerColor
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.bottom:parent.bottom
                height:1
            }
        }

//----------------------------------------------------------------------------------------
//                      Buck
//----------------------------------------------------------------------------------------
        Rectangle{
            id:buckContainer
            anchors.left:parent.left
            anchors.right:parent.right
            anchors.top:linearContainer.bottom
            height: parent.height/4
            color:"transparent"

            Image{
                id:buckIcon
                height:parent.height/4
                width:parent.height/4
                mipmap:true
                anchors.top:parent.top
                anchors.topMargin: 15
                anchors.left:parent.left
                anchors.leftMargin: 10
                source:"./images/icon-buck.svg"
            }

            Text{
                id:buckTitle
                text: "Buck"
                font.pixelSize: parent.height/4
                color: textColor
                anchors.top:parent.top
                anchors.topMargin:5
                anchors.left:buckIcon.right
                anchors.leftMargin: 20
            }

            Text{
                id:buckSubtitle
                text: "High Current AECQ Buck"
                font.pixelSize: parent.height/14
                color: secondaryTextColor
                anchors.top:buckTitle.bottom
                anchors.topMargin: -5
                anchors.left:buckTitle.left
            }

            SGSwitch{
                id:buckSwitch
                anchors.left:parent.left
                anchors.leftMargin: leftSwitchMargin
                anchors.verticalCenter: parent.verticalCenter
                grooveFillColor:windowsDarkBlue
                grooveColor:switchGrooveColor
                checked:platformInterface.set_buck_intensity_notification.enabled

                onToggled:{
                    platformInterface.set_buck_intensity.update(buckSwitch.checked,
                                                              platformInterface.set_buck_intensity_notification.intensity);
                }
            }

            RoundButton{
                id:buckScrim
                anchors.left: parent.left
                anchors.leftMargin:leftScrimOffset
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right:parent.right
                visible:!buckSwitch.checked
                opacity:1
                z:5

                onVisibleChanged:{
                    if (visible){
                        buckScrimToOpaque.start()
                    }
                    else{
                        buckScrimToTransparent.start()
                    }
                }

                OpacityAnimator{
                    id:buckScrimToOpaque
                    target:buckScrim
                    from: 0
                    to: 1
                    duration:1000
                    running:false
                }

                OpacityAnimator{
                    id:buckScrimToTransparent
                    target:buckScrim
                    from: 1
                    to: 0
                    duration:1000
                    running:false
                }

                background:Rectangle{
                    color:"transparent"
                    radius:5
                }

                LinearGradient {
                       anchors.fill: parent
                       start: Qt.point(0, 0)
                       end: Qt.point(parent.width, 0)
                       gradient: Gradient {
                           GradientStop { position: 0.0; color: "#00000000"}
                           GradientStop { position: .15; color: "#66000000" }
                           GradientStop { position: .5; color: "#BB000000" }
                       }
                   }
            }

            PortInfo{
                id:buckTelemetry
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: buckSwitch.right
                anchors.leftMargin: 240
                width:275
                boxHeight:60

                property int theRunningTotal: 0
                property int theEfficiencyCount: 0
                property int theEfficiencyAverage: 0

                property var periodicValues: platformInterface.power_notification

                Component.onCompleted: {
                        theRunningTotal = 0;
                    }

                onPeriodicValuesChanged: {
                    var theInputPower = platformInterface.power_notification.buck_input_voltage * platformInterface.power_notification.buck_input_current;
                    var theOutputPower = (platformInterface.power_notification.buck_input_voltage - platformInterface.power_notification.buck_output_voltage) * platformInterface.power_notification.buck_output_current;

                    var theEfficiency
                    //sum eight values of the efficency and average before displaying
                    //if the input power is 0 (probably because input_current is 0) then assume efficiency of 0
                    if (theInputPower === 0)
                        theEfficiency = 0
                      else{
                        theEfficiency = Math.round((theOutputPower/theInputPower) *100)
                    }

                    theRunningTotal += theEfficiency;
                    //console.log("new efficiency value=",theEfficiency,"new total is",theRunningTotal,theEfficiencyCount);
                    theEfficiencyCount++;

                    if (theEfficiencyCount === 8){
                        theEfficiencyAverage = theRunningTotal/8;
                        theEfficiencyCount = 0;
                        theRunningTotal = 0

                        //console.log("publishing new efficency",theEfficiencyAverage);
                    }

                }

                inputVoltage:{
                    return (platformInterface.power_notification.buck_input_voltage).toFixed(1);
                }
                outputVoltage:{
                    return (platformInterface.power_notification.buck_input_voltage - platformInterface.power_notification.buck_output_voltage).toFixed(1);
                }
                inputCurrent:{
                    return (platformInterface.power_notification.buck_input_current).toFixed(0)
                }
                outputCurrent:{
                    return (platformInterface.power_notification.buck_output_current).toFixed(0)
                }
                temperature:{
                    return (platformInterface.power_notification.buck_temperature).toFixed(0)
                }
                efficiency: {
                    return theEfficiencyAverage;
                }
            }

            SGSlider {
                id: ledIntensity
                width:330
                label: "Intensity:"
                value: platformInterface.set_buck_intensity_notification.intensity
                labelTopAligned: true
                startLabel: "0%"
                endLabel: "100%"
                grooveColor: "dimgrey"
                grooveFillColor: windowsDarkBlue
                textColor: "white"
                from: 0
                to: 100
                stepSize: 1
                anchors {
                    left: buckTelemetry.right
                    leftMargin: 30
                    verticalCenter: parent.verticalCenter
                    right:buckLED1.left
                    rightMargin: 140
                }

                onUserSet:{
                    //console.log("new value:",ledIntensity.value);
                    platformInterface.set_buck_intensity.update(platformInterface.set_buck_intensity_notification.enabled,
                                                              ledIntensity.value);
                }

            }

            LEDIndicator{
                id: buckLED1
                ledColor: {
                    var thePercentage = platformInterface.set_buck_intensity_notification.intensity/100
                    var theColor = parseInt((255 * (thePercentage)).toFixed(0))
                    //console.log("boost color value is",theColor)
                    var theHexValue = theColor.toString(16).toUpperCase();
                    if (theHexValue.length % 2) {
                      theHexValue = '0' + theHexValue;
                    }

                    var theHexColor ="#" + theHexValue + theHexValue + theHexValue
                    return theHexColor
                }
                height: root.height * .05
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: rightInset + 10
            }

            Rectangle {
                id:divider3
                color: dividerColor
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.bottom:parent.bottom
                height:1
            }
        }

//----------------------------------------------------------------------------------------
//                      Boost
//----------------------------------------------------------------------------------------
        Rectangle{
            id:boostContainer
            height: parent.height/4
            anchors.left:parent.left
            anchors.right:parent.right
            anchors.top:buckContainer.bottom
            anchors.bottom:parent.bottom
            color:"transparent"

            Image{
                id:boostIcon
                height:parent.height/4
                width:parent.height/4
                mipmap:true
                anchors.top:parent.top
                anchors.topMargin: 15
                anchors.left:parent.left
                anchors.leftMargin: 10
                source:"./images/icon-boost.svg"
            }

            Text{
                id:boostTitle
                text: "Boost"
                font.pixelSize: parent.height/4
                color: textColor
                anchors.top:parent.top
                anchors.topMargin:5
                anchors.left:boostIcon.right
                anchors.leftMargin: 20
            }

            Text{
                id:boostSubtitle
                text: "Controller for LED Backlighting"
                font.pixelSize: parent.height/14
                color: secondaryTextColor
                anchors.top:boostTitle.bottom
                anchors.topMargin: -5
                anchors.left:boostTitle.left
            }


            SGSwitch{
                id:boostSwitch
                anchors.left:parent.left
                anchors.leftMargin: leftSwitchMargin
                anchors.verticalCenter: parent.verticalCenter
                grooveFillColor:windowsDarkBlue
                grooveColor:switchGrooveColor
                checked:platformInterface.set_boost_intensity_notification.enabled

                onToggled:{
                    platformInterface.set_boost_intensity.update(checked,
                                                              platformInterface.set_boost_intensity_notification.intensity);
                }
            }

            RoundButton{
                id:boostScrim
                anchors.left: parent.left
                anchors.leftMargin:leftScrimOffset
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right:parent.right
                visible:!boostSwitch.checked
                z:5

                onVisibleChanged:{
                    if (visible){
                        boostScrimToOpaque.start()
                    }
                    else{
                        boostScrimToTransparent.start()
                    }
                }

                OpacityAnimator{
                    id:boostScrimToOpaque
                    target:boostScrim
                    from: 0
                    to: 1
                    duration:1000
                    running:false
                }

                OpacityAnimator{
                    id:boostScrimToTransparent
                    target:boostScrim
                    from: 1
                    to: 0
                    duration:1000
                    running:false
                }

                LinearGradient {
                       anchors.fill: parent
                       start: Qt.point(0, 0)
                       end: Qt.point(parent.width, 0)
                       gradient: Gradient {
                           GradientStop { position: 0.0; color: "#00000000"}
                           GradientStop { position: .15; color: "#66000000" }
                           GradientStop { position: .5; color: "#BB000000" }
                       }
                   }

                background:Rectangle{
                    color:"transparent"
                    radius:5
                }
            }

            BoostPortInfo{
                id:boostTelemetry
                //anchors.top: parent.top
                //anchors.topMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -40
                anchors.left: boostSwitch.right
                anchors.leftMargin: 240
                width:275
                boxHeight:60

                inputVoltage:{
                    return (platformInterface.power_notification.boost_input_voltage).toFixed(1);
                }
                outputVoltage:{
                    return (platformInterface.power_notification.boost_output_voltage).toFixed(1);
                }

            }

            SGSlider {
                id: boostIntensity
                label: "Intensity:"
                width: 350
                value: {
                    //console.log("boost intensity set to",platformInterface.set_boost_intensity_notification.intensity)
                    return platformInterface.set_boost_intensity_notification.intensity
                }
                labelTopAligned: true
                startLabel: "0%"
                endLabel: "100%"
                grooveColor:"dimgrey"
                grooveFillColor: windowsDarkBlue
                textColor: "white"
                from: 0
                to: 100
                stepSize: 1
                anchors {
                    left: boostTelemetry.right
                    leftMargin: 30
                    verticalCenter: parent.verticalCenter
                    right: boostPWMlights.left
                    rightMargin: 25
                }

                onUserSet:{
                    //setBoostLEDs();
                    platformInterface.set_boost_intensity.update(platformInterface.set_boost_intensity_notification.enabled,
                                                              boostIntensity.value);
                }

                Component.onCompleted:{
                    //setBoostLEDs();
                }



            }


            Column{
                id:boostPWMlights
                anchors.top:parent.top
                anchors.topMargin: parent.height/8
                anchors.right: boostPWMlights2.left
                anchors.rightMargin: 10
                width:50
                spacing:10

                function setBoostLEDs(){
                    var thePercentage = platformInterface.set_boost_intensity_notification.intensity/100
                    var theColor = parseInt((255 * (thePercentage)).toFixed(0))
                    //console.log("boost color value is",theColor)
                    var theHexValue = theColor.toString(16).toUpperCase();
                    if (theHexValue.length % 2) {
                      theHexValue = '0' + theHexValue;
                    }

                    var hexvalue ="#" + "00" + theHexValue + "00"

                    //console.log("new value:",hexvalue);
                    boostLED1.ledColor = hexvalue;
                    boostLED2.ledColor = hexvalue;
                    boostLED3.ledColor = hexvalue;
                    boostLED4.ledColor = hexvalue;
                    boostLED5.ledColor = hexvalue;
                    boostLED6.ledColor = hexvalue;
                    boostLED7.ledColor = hexvalue;
                    boostLED8.ledColor = hexvalue;
                    boostLED9.ledColor = hexvalue;
                }

                property var boostIntensity: platformInterface.set_boost_intensity_notification.intensity

                onBoostIntensityChanged:{
                    setBoostLEDs();
                }

                LEDIndicator{
                    id: boostLED1
                    ledColor: "green"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED2
                    ledColor: "green"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED3
                    ledColor: "green"
                    height: root.height * .05
                }
            }

            Column{
                id:boostPWMlights2
                anchors.top:parent.top
                anchors.topMargin: parent.height/8
                anchors.right: boostPWMlights3.left
                anchors.rightMargin: 10
                width:50
                spacing:10

                LEDIndicator{
                    id: boostLED4
                    ledColor: "white"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED5
                    ledColor: "white"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED6
                    ledColor: "white"
                    height: root.height * .05
                }
            }

            Column{
                id:boostPWMlights3
                anchors.top:parent.top
                anchors.topMargin: parent.height/8
                anchors.right: parent.right
                anchors.rightMargin: rightInset
                width:50
                spacing:10

                LEDIndicator{
                    id: boostLED7
                    ledColor: "white"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED8
                    ledColor: "white"
                    height: root.height * .05
                }
                LEDIndicator{
                    id: boostLED9
                    ledColor: "white"
                    height: root.height * .05
                }
            }
        }


    }



}

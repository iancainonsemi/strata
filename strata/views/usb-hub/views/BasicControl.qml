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
import QtGraphicalEffects 1.0
import "qrc:/views/usb-hub/sgwidgets"
import "qrc:/views/usb-hub/views/basic-partial-views"

Item {
    id: root

    property bool debugLayout: false
    property real ratioCalc: root.width / 1200
    property int transitionStepTime: 5000
    property int tabTransitionTime: transitionStepTime
    property int tabTransitionTimePhase2: transitionStepTime

    property int basicPortWidth: 160
    property int advancedPortWidth: 240

    property int basicDeviceWidth: 160
    property int advancedDeviceWidth: 240

    property int basicThinPortWidth: 170
    property int advancedThinPortWidth: 170

    property int basicPortHeight: 344

    property int advancedUSBAPortHeight: 240
    property int advancedAudioPortHeight: 157
    property int advancedDisplayPortPortHeight: 157

    property int basicTopMargin: 95
    property int advancedTopMargin: 10

    width: parent.width / parent.height > initialAspectRatio ? parent.height * initialAspectRatio : parent.width
    height: parent.width / parent.height < initialAspectRatio ? parent.width / initialAspectRatio : parent.height



    Rectangle{
        id:background
        anchors.fill:parent
        color:"#145A74"
    }

    PlugAnimation {
        id: upstreamAnimation
        anchors.horizontalCenter: upstreamDevice.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: upstreamDevice.verticalCenter
        anchors.bottomMargin: -20
    }

    PlugAnimation {
        id: port1Animation
        anchors.horizontalCenter: port1Device.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: port1Device.verticalCenter
        anchors.bottomMargin: -20
    }

    PlugAnimation {
        id: port2Animation
        anchors.horizontalCenter: port2Device.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: port2Device.verticalCenter
        anchors.bottomMargin: -20
    }

    PlugAnimation {
        id: port3Animation
        anchors.horizontalCenter: port3Device.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: port3Device.verticalCenter
        anchors.bottomMargin: -20
    }

    PlugAnimation {
        id: port4Animation
        anchors.horizontalCenter: port4Device.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: port4Device.verticalCenter
        anchors.bottomMargin: -10
    }

    PlugAnimation {
        id: displayPortAnimation
        anchors.horizontalCenter: videoIcon.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: videoIcon.verticalCenter
        anchors.bottomMargin: -20
    }

    PlugAnimation {
        id: audioAnimation
        anchors.horizontalCenter: audioIcon.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: audioIcon.verticalCenter
        anchors.bottomMargin: -20
    }

    function switchToAdvancedView(){
        tabTransitionTime = 0
        transitionToAdvancedView();
    }

    //called upon completion of the switch to advanced animation
    function toAdvancedAnimationFinished(){
        tabTransitionTime = transitionStepTime;  //reset tab transition time if needed
    }

    function transitionToAdvancedView(){


        portsAndBackgroundToAdvanced.start()

        //portsToAdvanced.start();
        //devicesToAdvanced.start();
        audioPort.transitionToAdvancedView();
        displayPort.transitionToAdvancedView();
        upstreamPort.transitionToAdvancedView();
        port1.transitionToAdvancedView();
        port2.transitionToAdvancedView();
        port3.transitionToAdvancedView();
        port4.transitionToAdvancedView();

    }

    SequentialAnimation{
        id:portsAndBackgroundToAdvanced

        ParallelAnimation{
            id: backgroundToAdvanced
            running: false

            PropertyAnimation{
                target:deviceBackground
                property: "anchors.topMargin"
                to:(root.height)/32
                duration: tabTransitionTime
            }

            PropertyAnimation{
                target:deviceBackground
                property: "height"
                to: (23*parent.height)/32
                duration: tabTransitionTime
            }

            onStopped:{
                //unanchor parts of the ports that will be rearranged in the next step
//                port4.anchors.bottom = undefined;
//                port4.anchors.bottomMargin = 0
//                port4.anchors.left = undefined;
//                port4.anchors.leftMargin = 0
//                port4.anchors.top = undefined
//                port4.anchors.topMargin = 0
//                port4.anchors.right = undefined
//                port4.anchors.rightMargin = 0

//                displayPort.anchors.top = undefined;
//                displayPort.anchors.bottom = undefined;
                displayPort.anchors.left = undefined;
                  displayPort.anchors.left = port3.right;
                displayPort.anchors.leftMargin = port4.width + 7;

//                audioPort.anchors.top = undefined;
//                audioPort.anchors.bottom = undefined;
                audioPort.anchors.left = undefined;
                audioPort.anchors.left = port3.right;
                audioPort.anchors.leftMargin = port4.width + displayPort.width + 7 + 7;

            }
        }

        ParallelAnimation{
            //here the heights and positions of the USB-A, Audio and Video ports
            id:adjustRightThreePortHeightsAndPositions

            PropertyAnimation{
                //usb-A port
                target:port4
                property: "width"
                to: advancedThinPortWidth
                duration: tabTransitionTime
            }

            PropertyAnimation{
                //usb-A port
                target:port4
                property: "anchors.bottomMargin"
                to: advancedDisplayPortPortHeight + advancedAudioPortHeight + 10
                duration: tabTransitionTime
            }


            PropertyAnimation{
                target:audioPort
                property: "width"
                to: advancedThinPortWidth
                duration: tabTransitionTime
            }
            PropertyAnimation{
                target:audioPort
                property: "anchors.topMargin"
                to: advancedUSBAPortHeight + 10
                duration: tabTransitionTime
            }
            PropertyAnimation{
                target:audioPort
                property: "anchors.bottomMargin"
                to: advancedDisplayPortPortHeight  + 10 + 10
                duration: tabTransitionTime
            }

            PropertyAnimation{
                target:displayPort
                property: "width"
                to: advancedThinPortWidth
                duration: tabTransitionTime
            }
            PropertyAnimation{
                target:displayPort
                property: "anchors.topMargin"
                to: advancedUSBAPortHeight + advancedAudioPortHeight + 10 + 10 + 10
                duration: tabTransitionTime
            }


        }

        ParallelAnimation{
            id:upstreamPortToAdvanced

            PropertyAnimation{
                target:upstreamPort
                property: "width"
                to: advancedPortWidth
                duration: tabTransitionTime
            }

            PropertyAnimation{
                target:displayPort
                property: "anchors.leftMargin"
                to: -port4.width;
                duration: tabTransitionTime
            }

            PropertyAnimation{
                target:audioPort
                property: "anchors.leftMargin"
                to: -port4.width;
                duration: tabTransitionTime
            }

        }

        ParallelAnimation{
            id:port1ToAdvanced

            PropertyAnimation{
                target:port1
                property: "width"
                to: advancedPortWidth
                duration: tabTransitionTime
            }

            PropertyAnimation{
                target:displayPort
                property: "anchors.leftMargin"
                to: -(advancedPortWidth - basicPortWidth) ;
                duration: tabTransitionTime
            }

//            PropertyAnimation{
//                target:audioPort
//                property: "anchors.leftMargin"
//                to: (advancedPortWidth - basicPortWidth);
//                duration: tabTransitionTime
//            }

        }

//        ParallelAnimation{
//            id:port2ToAdvanced

//            PropertyAnimation{
//                target:port2
//                property: "width"
//                to: advancedPortWidth
//                duration: tabTransitionTime
//            }

//            PropertyAnimation{
//                target:displayPort
//                property: "anchors.leftMargin"
//                to: -port4.width;
//                duration: tabTransitionTime
//            }

//            PropertyAnimation{
//                target:audioPort
//                property: "anchors.leftMargin"
//                to: -port4.width;
//                duration: tabTransitionTime
//            }

//        }

//        ParallelAnimation{

//            id:port3ToAdvanced
//            PropertyAnimation{
//                target:port3
//                property: "width"
//                to: advancedPortWidth
//                duration: tabTransitionTime
//            }

 //       }

        onStopped:{
            devicesToAdvanced.start()
        }
    }  //end sequential animation





    //--------------------------------------------------------------------
    //  Device Animations
    //--------------------------------------------------------------------
    ParallelAnimation{
        id: devicesToAdvanced
        PropertyAnimation{
            target: upstreamDevice
            property: "width"
            to: advancedDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Device
            property: "width"
            to: advancedDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Device
            property: "width"
            to: advancedDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Device
            property: "width"
            to: advancedDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: upstreamDevice
            property: "anchors.topMargin"
            to: advancedTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Device
            property: "anchors.topMargin"
            to: advancedTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Device
            property: "anchors.topMargin"
            to: advancedTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Device
            property: "anchors.topMargin"
            to: advancedTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port4Device
            property: "anchors.topMargin"
            to: advancedTopMargin
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target: port4Device
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: videoIcon
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: audioIcon
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: upstreamAnimation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Animation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Animation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Animation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port4Animation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: displayPortAnimation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: audioAnimation
            property: "opacity"
            to: 0
            duration: tabTransitionTime
        }

        onStopped:{
            toAdvancedAnimationFinished();
        }

    }

    //----------------------------------------------------------------------------------------
    //                      Animation to Basic View
    //----------------------------------------------------------------------------------------

    function switchToBasicView(){
        tabTransitionTime = 0
        transitionToBasicView();
    }

    //called upon completion of the switch to basic animation
    function toBasicAnimationFinished(){
        tabTransitionTime = transitionStepTime;  //reset tab transition time if needed
    }

    function transitionToBasicView(){

        //unanchor parts of the ports that will be rearranged
        port4.anchors.bottom = undefined;
        port4.anchors.left = undefined;
        audioPort.anchors.top = undefined;
        audioPort.anchors.bottom = undefined;
        audioPort.anchors.left = undefined;
        displayPort.anchors.top = undefined;
        displayPort.anchors.bottom = undefined;
        displayPort.anchors.left = undefined;

        audioPort.transitionToBasicView();
        displayPort.transitionToBasicView();
        upstreamPort.transitionToBasicView();
        port1.transitionToBasicView();
        port2.transitionToBasicView();
        port3.transitionToBasicView();
        //port4.transitionToBasicView();

        //this timer will give the above animations time to run
        portContentAnimationTimer.start()
        //when finished the ports and devices will resize
        //when that's finished the background will resize

    }

    Timer{
        //give the content of the ports time to rearrange themselves
        //with a timer
        id:portContentAnimationTimer
        running: false
        interval: tabTransitionTime

        onTriggered: {
            //then rearrange the port and devices outline
            portsToBasic.start();
            devicesToBasic.start();
        }
    }

    ParallelAnimation{
        id: backgroundToBasic
        running: false

        PropertyAnimation{
            target:deviceBackground
            property: "anchors.topMargin"
            to:(3*root.height)/32
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:deviceBackground
            property: "height"
            to: (7*parent.height)/16
            duration: tabTransitionTime
        }

    }

    ParallelAnimation{
        //changing the background will expand the ports as well, since they're anchored together
        //we will have to alter size and position of the USB-A, Audio and DisplayPort ports here
        id:portsToBasic
        PropertyAnimation{
            target:upstreamPort
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:port1
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:port2
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:port3
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            //usb-A port
            target:port4
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }

        PropertyAnimation{
            //usb-A port
            target:port4
            property: "height"
            to: basicPortHeight
            duration: tabTransitionTime
        }
        PropertyAnimation{
            //usb-A port
            target:port4
            property: "x"
            to: background.x  + (4* basicPortWidth) + (5*7)
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:audioPort
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:audioPort
            property: "height"
            to: basicPortHeight
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:audioPort
            property: "x"
            to: background.x  + (6* basicPortWidth) + (7*7)
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:audioPort
            property: "y"
            to: background.y+10
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:displayPort
            property: "width"
            to: basicPortWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target:displayPort
            property: "x"
            to: background.x  + (5* basicPortWidth) + (6*7)
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:displayPort
            property: "y"
            to: background.y+10
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target:displayPort
            property: "height"
            to: basicPortHeight
            duration: tabTransitionTime
        }

        onStopped: {
            //port 4 (USB-A) was special, because it was shrunk.
            //Thus we allow that port to resize to normal height before we rearrange its content
            port4.transitionToBasicView();
            backgroundToBasic.start()
        }
    }

    //--------------------------------------------------------------------
    //  Device Animations
    //--------------------------------------------------------------------
    ParallelAnimation{
        id: devicesToBasic
        PropertyAnimation{
            target: upstreamDevice
            property: "width"
            to: basicDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Device
            property: "width"
            to: basicDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Device
            property: "width"
            to: basicDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Device
            property: "width"
            to: basicDeviceWidth
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: upstreamDevice
            property: "anchors.topMargin"
            to: basicTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Device
            property: "anchors.topMargin"
            to: basicTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Device
            property: "anchors.topMargin"
            to: basicTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Device
            property: "anchors.topMargin"
            to: basicTopMargin
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port4Device
            property: "anchors.topMargin"
            to: basicTopMargin
            duration: tabTransitionTime
        }

        PropertyAnimation{
            target: port4Device
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: videoIcon
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: audioIcon
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: upstreamAnimation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port1Animation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port2Animation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port3Animation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: port4Animation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: displayPortAnimation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }
        PropertyAnimation{
            target: audioAnimation
            property: "opacity"
            to: 1
            duration: tabTransitionTime
        }

        onStopped:{
            toBasicAnimationFinished();
        }

    }

//----------------------------------------------------------------------------------------
//                      Views
//----------------------------------------------------------------------------------------


    Rectangle{
        id:deviceBackground
        color:"darkgrey"
        radius:5
        height:(7*parent.height)/16
        anchors.left:root.left
        anchors.leftMargin: 12
        anchors.right: root.right
        anchors.rightMargin: 12
        anchors.top:root.top
        anchors.topMargin: (3*root.height)/32

        PortInfo{
            id:upstreamPort
            portName:"Upstream"
            portNumber:1
            portConnected: false
            anchors.left: deviceBackground.left
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        PortInfo{
            id:port1
            portName:"Port 1"
            portNumber:2
            portConnected: false
            anchors.left: upstreamPort.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        PortInfo{
            id:port2
            portName:"Port 2"
            portNumber:3
            portConnected: false
            anchors.left: port1.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        PortInfo{
            id:port3
            portName:"Port 3"
            portNumber:4
            portConnected: false
            anchors.left: port2.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        USBAPortInfo{
            id:port4
            portName:"Port 4"
            portSubtitle: "USB-A"
            portNumber:5
            portConnected: false
            isUSBAPort: true
            anchors.left: port3.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        VideoPortInfo{
            id:displayPort
            portName:"DisplayPort"
            portConnected: false
            anchors.left: port4.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }

        AudioPortInfo{
            id:audioPort
            portName:"Audio"
            portConnected: false
            anchors.left: displayPort.right
            anchors.leftMargin: 7
            anchors.top:deviceBackground.top
            anchors.topMargin: 10
            anchors.bottom: deviceBackground.bottom
            anchors.bottomMargin: 5
            width:basicPortWidth
        }
    }

    DeviceInfo{
        id:upstreamDevice
        anchors.top:deviceBackground.bottom
        anchors.topMargin: 95
        anchors.left:root.left
        anchors.leftMargin: 20
        height:145
        width:160

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!upstreamAnimation.pluggedIn) {
                    upstreamAnimation.source = "images/cord.gif"
                    upstreamAnimation.currentFrame = 0
                    upstreamAnimation.playing = true
                    upstreamAnimation.pluggedIn = !upstreamAnimation.pluggedIn
                    upstreamPort.portConnected = true
                    upstreamDevice.connected = true
                } else {
                    upstreamAnimation.source = "images/cordReverse.gif"
                    upstreamAnimation.currentFrame = 0
                    upstreamAnimation.playing = true
                    upstreamAnimation.pluggedIn = !upstreamAnimation.pluggedIn
                    upstreamPort.portConnected = false
                    upstreamDevice.connected = false
                }
            }
        }

    }

    DeviceInfo{
        id:port1Device
        anchors.top:deviceBackground.bottom
        anchors.topMargin: 95
        anchors.left:upstreamDevice.right
        anchors.leftMargin: 7
        height:145
        width:160

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!port1Animation.pluggedIn) {
                    port1Animation.source = "images/cord.gif"
                    port1Animation.currentFrame = 0
                    port1Animation.playing = true
                    port1Animation.pluggedIn = !port1Animation.pluggedIn
                    port1.portConnected = true
                    port1Device.connected = true
                } else {
                    port1Animation.source = "images/cordReverse.gif"
                    port1Animation.currentFrame = 0
                    port1Animation.playing = true
                    port1Animation.pluggedIn = !port1Animation.pluggedIn
                    port1.portConnected = false
                    port1Device.connected = false
                }
            }
        }


    }

    DeviceInfo{
        id:port2Device
        anchors.top:deviceBackground.bottom
        anchors.topMargin: 95
        anchors.left:port1Device.right
        anchors.leftMargin: 7
        height:145
        width:160

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!port2Animation.pluggedIn) {
                    port2Animation.source = "images/cord.gif"
                    port2Animation.currentFrame = 0
                    port2Animation.playing = true
                    port2Animation.pluggedIn = !port2Animation.pluggedIn
                    port2.portConnected = true
                    port2Device.connected = true
                } else {
                    port2Animation.source = "images/cordReverse.gif"
                    port2Animation.currentFrame = 0
                    port2Animation.playing = true
                    port2Animation.pluggedIn = !port2Animation.pluggedIn
                    port2.portConnected = false
                    port2Device.connected = false
                }
            }
        }
    }

    DeviceInfo{
        id:port3Device
        anchors.top:deviceBackground.bottom
        anchors.topMargin: 95
        anchors.left:port2Device.right
        anchors.leftMargin: 7
        height:145
        width:160

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!port3Animation.pluggedIn) {
                    port3Animation.source = "images/cord.gif"
                    port3Animation.currentFrame = 0
                    port3Animation.playing = true
                    port3Animation.pluggedIn = !port3Animation.pluggedIn
                    port3.portConnected = true
                    port3Device.connected = true
                } else {
                    port3Animation.source = "images/cordReverse.gif"
                    port3Animation.currentFrame = 0
                    port3Animation.playing = true
                    port3Animation.pluggedIn = !port3Animation.pluggedIn
                    port3.portConnected = false
                    port3Device.connected = false
                }
            }
        }
    }

    DeviceInfo{
        id:port4Device
        anchors.top:deviceBackground.bottom
        anchors.topMargin: 95
        anchors.left:port3Device.right
        anchors.leftMargin: 7
        height:145
        width:160

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!port4Animation.pluggedIn) {
                    port4Animation.source = "images/usbACord.gif"
                    port4Animation.currentFrame = 0
                    port4Animation.playing = true
                    port4Animation.pluggedIn = !port4Animation.pluggedIn
                    port4.portConnected = true
                    port4Device.connected = true
                } else {
                    port4Animation.source = "images/usbACordReverse.gif"
                    port4Animation.currentFrame = 0
                    port4Animation.playing = true
                    port4Animation.pluggedIn = !port4Animation.pluggedIn
                    port4.portConnected = false
                    port4Device.connected = false
                }
            }
        }
    }

    Image{
        id:videoIcon
        source:"./images/videoIcon.png"
        anchors.verticalCenter: port4Device.verticalCenter
        anchors.left:port4Device.right
        anchors.leftMargin: 40
        fillMode:Image.PreserveAspectFit
        opacity: displayPort.portConnected ? 1 : .5

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!displayPortAnimation.pluggedIn) {
                    displayPortAnimation.source = "images/DisplayPortAnim.gif"
                    displayPortAnimation.currentFrame = 0
                    displayPortAnimation.playing = true
                    displayPortAnimation.pluggedIn = !displayPortAnimation.pluggedIn
                    displayPort.portConnected = true
                } else {
                    displayPortAnimation.source = "images/DisplayPortAnimReverse.gif"
                    displayPortAnimation.currentFrame = 0
                    displayPortAnimation.playing = true
                    displayPortAnimation.pluggedIn = !displayPortAnimation.pluggedIn
                    displayPort.portConnected = false
                }
            }
        }
    }

    Image{
        id:audioIcon
        source:"./images/headphonesIcon.png"
        anchors.verticalCenter: port4Device.verticalCenter
        anchors.left:videoIcon.right
        anchors.leftMargin: 80
        fillMode:Image.PreserveAspectFit
        opacity: audioPort.portConnected ? 1 : .5

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if (!audioAnimation.pluggedIn) {
                    audioAnimation.source = "images/AudioAnim.gif"
                    audioAnimation.currentFrame = 0
                    audioAnimation.playing = true
                    audioAnimation.pluggedIn = !audioAnimation.pluggedIn
                    audioPort.portConnected = true
                } else {
                    audioAnimation.source = "images/AudioAnimReverse.gif"
                    audioAnimation.currentFrame = 0
                    audioAnimation.playing = true
                    audioAnimation.pluggedIn = !audioAnimation.pluggedIn
                    audioPort.portConnected = false
                }
            }
        }
    }



    Image{
        source:"./images/FourPortWireframeBasicView.png"
        anchors.fill:root
        opacity: .2
        visible: false
    }

//    Text{
//        id:placeholderText
//        text: "hub basic view"
//        anchors.centerIn: root
//        font.pixelSize: 24
//    }



//    Image {
//        id: name
//        anchors {
//            fill: root
//        }
//        source: "images/basic-background.png"
//    }

 /*   GraphDrawer {
        id: graphDrawer
        z: 10
    }

    PlugAnimation {
        id: port1Animation
        x: 748 * ratioCalc
        y: 63 * ratioCalc
    }

    PlugAnimation {
        id: port2Animation
        x: 748 * ratioCalc
        y: 255 * ratioCalc
    }

    PlugAnimation {
        id: port3Animation
        x: 748 * ratioCalc
        y: 447 * ratioCalc
    }

    PlugAnimation {
        id: port4Animation
        x: 748 * ratioCalc
        y: 639 * ratioCalc
    }

    Item {
        id: inputColumn
        width: 310 * ratioCalc
        height: root.height
        anchors {
            left: root.left
            leftMargin: 80 * ratioCalc
        }

        Rectangle {
            id: combinedPortStats
            color: "#eee"
            anchors {
                top: inputColumn.top
                topMargin: 35 * ratioCalc
                left: inputColumn.left
                right: inputColumn.right
            }
            height: 300 * ratioCalc

            Rectangle{
                id:combinedStatsBackgroundRect
                color:"#ddd"
                anchors.top:combinedPortStats.top
                anchors.left:combinedPortStats.left
                anchors.right:combinedPortStats.right
                height:combinedPortStats.height/6

                Text{
                    id:combinedStatsText
                    text:"COMBINED PORT STATISTICS"
                    font.pixelSize: 17
                    color: "#bbb"
                    anchors.centerIn: combinedStatsBackgroundRect
                }
            }




            PortStatBox {

                property var inputVoltage:platformInterface.request_usb_power_notification.input_voltage;
                property real port1Voltage:0;
                property real port2Voltage:0;
                property real port3Voltage:0;
                property real port4Voltage:0;

                onInputVoltageChanged: {
                     if (platformInterface.request_usb_power_notification.port ===1)
                         port1Voltage = platformInterface.request_usb_power_notification.input_voltage;
                     else if (platformInterface.request_usb_power_notification.port ===2)
                         port2Voltage = platformInterface.request_usb_power_notification.input_voltage;
                     else if (platformInterface.request_usb_power_notification.port ===3)
                         port3Voltage = platformInterface.request_usb_power_notification.input_voltage;
                     else if (platformInterface.request_usb_power_notification.port ===4)
                         port4Voltage = platformInterface.request_usb_power_notification.input_voltage;
                }

                id:combinedInputVoltageBox
                label: "INPUT VOLTAGE"
                value: Math.round((port1Voltage + port2Voltage + port3Voltage + port4Voltage) *100)/100
                valueSize: 32
                icon: "../images/icon-voltage.svg"
                unit: "V"
                anchors.top: combinedStatsBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: combinedPortStats.horizontalCenter
                height: combinedPortStats.height/5
                width: combinedPortStats.width/2
            }

            PortStatBox {

                property var inputVoltage: platformInterface.request_usb_power_notification.input_voltage;
                property var inputCurrent: platformInterface.request_usb_power_notification.input_current;
                property real inputPower: inputVoltage * inputCurrent;

                property real port1Power:0;
                property real port2Power:0;
                property real port3Power:0;
                property real port4Power:0;

                onInputPowerChanged: {
                    if (platformInterface.request_usb_power_notification.port ===1)
                        port1Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===2)
                        port2Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===3)
                        port3Power = inputPower;
                    else if (platformInterface.request_usb_power_notification.port ===4)
                        port4Power = inputPower;
                }

                id:combinedInputPowerBox
                label: "INPUT POWER"
                value: Math.round((port1Power + port2Power + port3Power + port4Power) *100)/100
                valueSize: 32
                icon: "../images/icon-voltage.svg"
                unit: "W"
                anchors.top: combinedInputVoltageBox.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: combinedPortStats.horizontalCenter
                height: combinedPortStats.height/5
                width: combinedPortStats.width/2
                //visible: combinedPortStats.inputPowerConnected
            }
        }

        Rectangle {
            id: inputConversionStats
            color: combinedPortStats.color
            anchors {
                top: combinedPortStats.bottom
                topMargin: 20 * ratioCalc
                left: inputColumn.left
                right: inputColumn.right
            }
            height: 428 * ratioCalc

            property bool inputPowerConnected: true

            Rectangle{
                id:topBackgroundRect
                color:"#ddd"
                anchors.top:inputConversionStats.top
                anchors.left:inputConversionStats.left
                anchors.right:inputConversionStats.right
                height:inputConversionStats.height/6
            }

            Text{
                id:powerConverterText
                text:"POWER CONVERTER"
                font.pixelSize: 17
                color: "#bbb"
                anchors.top: inputConversionStats.top
                anchors.topMargin:10
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }

            Text{
                id:converterNameText
                text:"ON Semiconductor NCP4060A"
                visible: inputConversionStats.inputPowerConnected
                font.pixelSize: 20
                //color: "#bbb"
                anchors.top: powerConverterText.bottom
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
            }

            PortStatBox {
                id:maxPowerBox
                label: "MAX CAPACITY"
                value: "200"
                icon: "../images/icon-max.svg"
                //portColor: root.portColor
                valueSize: 32
                unit: "W"
                anchors.top: topBackgroundRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
                height: inputConversionStats.height/8
                width: inputConversionStats.width/2
                visible: inputConversionStats.inputPowerConnected
            }

            PortStatBox {
                id:voltageOutBox
                label: "VOLTAGE OUTPUT"
                value: "100"
                icon: "../images/icon-voltage.svg"
                //portColor: root.portColor
                valueSize: 32
                unit: "V"
                anchors.top: maxPowerBox.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: inputConversionStats.horizontalCenter
                height: inputConversionStats.height/8
                width: inputConversionStats.width/2
                visible: inputConversionStats.inputPowerConnected
            }

            Image{
                id:powerConverterIcon
                source:"./images/powerconverter.png"
                opacity:.5
                fillMode:Image.PreserveAspectFit
                anchors.top:voltageOutBox.bottom
                anchors.topMargin:40
                anchors.bottom:inputConversionStats.bottom
                anchors.bottomMargin:40
                anchors.left:inputConversionStats.left
                anchors.right: inputConversionStats.right
            }



        }

        SGLayoutDebug {
            visible: debugLayout
        }
    }

    Item {
        id: portColumn
        width: 330 * ratioCalc
        height: root.height
        anchors {
            left: inputColumn.right
            leftMargin: 20 * ratioCalc
        }

        PortInfo {
            id: portInfo1
            height: 172 * ratioCalc
            anchors {
                top: portColumn.top
                topMargin: 35 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portConnected: false
            portNumber: 1
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo1.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                   return Math.round(platformInterface.request_usb_power_notification.maximum_power *100)/100
                }
                else{
                    return portInfo1.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return Math.round(platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current * 100)/100
                }
                else{
                    return portInfo1.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current * 100)/100
                }
                else{
                    return portInfo1.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage *100)/100
                }
                else{
                    return portInfo1.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 1){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10
                }
                else{
                    return portInfo1.portTemperature;
                }
            }
            efficency: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current;

                if (platformInterface.request_usb_power_notification.port === 1){
                    if (theInputPower == 0){    //division by 0 would normally give "nan"
                        return "—"
                    }
                    else{
                        return "—"
                        //return Math.round((theOutputPower/theInputPower) * 100)/100
                    }
                }
                else{
                    return portInfo1.efficency;
                }
            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo1.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo1.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        PortInfo {
            id: portInfo2
            height: portInfo1.height
            anchors {
                top: portInfo1.bottom
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 2
            portConnected: false
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo2.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return Math.round(platformInterface.request_usb_power_notification.maximum_power *100)/100
                }
                else{
                    return portInfo2.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return Math.round(platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current *100)/100
                }
                else{
                    return portInfo2.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current *100)/100
                }
                else{
                    return portInfo2.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage *100)/100
                }
                else{
                    return portInfo2.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 2){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                    return portInfo2.portTemperature;
                }
            }
            efficency: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current

                if (platformInterface.request_usb_power_notification.port === 2){
                    if (theInputPower == 0){    //division by 0 would normally give "nan"
                        return "—"
                    }
                    else{
                        return "—"
                        //return Math.round((theOutputPower/theInputPower) *100)/100
                    }
                }
                else{
                    return portInfo2.efficency
                }
            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo2.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo2.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        PortInfo {
            id: portInfo3
            height: portInfo1.height
            anchors {
                top: portInfo2.bottom
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 3
            portConnected: false
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return platformInterface.request_usb_power_notification.negotiated_voltage
                }
                else{
                    return portInfo3.advertisedVoltage;
                }
                }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.maximum_power *100)/100
                }
                else{
                    return portInfo3.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current *100)/100
                }
                else{
                    return portInfo3.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current *100)/100
                }
                else{
                    return portInfo3.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage *100)/100
                }
                else{
                    return portInfo3.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 3){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                    return portInfo3.portTemperature;
                }
            }
            efficency: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current

                if (platformInterface.request_usb_power_notification.port === 3){
                    if (theInputPower == 0){    //division by 0 would normally give "nan"
                        return "—"
                    }
                    else{
                        //return Math.round((theOutputPower/theInputPower) *100)/100
                        return "—"
                    }
                }
                else{
                  return portInfo3.efficency;
                    }
            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo3.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo3.portConnected = false;
                     }
                 }
            }
            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        PortInfo {
            id: portInfo4
            height: portInfo1.height
            anchors {
                top: portInfo3.bottom
                topMargin: 20 * ratioCalc
                left: portColumn.left
                right: portColumn.right
            }
            portNumber: 4
            portConnected: false
            advertisedVoltage:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return platformInterface.request_usb_power_notification.negotiated_voltage;
                }
                else{
                   return portInfo4.advertisedVoltage;
                }
            }
            maxPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.maximum_power *100)/100
                }
                else{
                    return portInfo4.maxPower;
                }
            }
            inputPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current *100)/100
                }
                else{
                   return portInfo4.inputPower;
                }
            }
            outputPower:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current *100)/100
                }
                else{
                   return portInfo4.outputPower;
                }
            }
            outputVoltage:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.output_voltage *100)/100
                }
                else{
                   return portInfo4.outputVoltage;
                }
            }
            portTemperature:{
                if (platformInterface.request_usb_power_notification.port === 4){
                    return Math.round(platformInterface.request_usb_power_notification.temperature*10)/10;
                }
                else{
                   return portInfo4.portTemperature;
                }
            }
            efficency: {
                var theInputPower = platformInterface.request_usb_power_notification.input_voltage * platformInterface.request_usb_power_notification.input_current;
                var theOutputPower = platformInterface.request_usb_power_notification.output_voltage * platformInterface.request_usb_power_notification.output_current

                if (platformInterface.request_usb_power_notification.port === 4)
                    if (theInputPower == 0){    //division by 0 would normally give "nan"
                        return "—"
                    }
                    else{
                        //return Math.round((theOutputPower/theInputPower) *100)/100
                        return "—"
                    }
                else{
                    return portInfo4.efficency;
                }
            }

            property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
            property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

             onDeviceConnectedChanged: {
//                 console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
//                             "state=",platformInterface.usb_pd_port_connect.connection_state);

                 if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                     if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                         portInfo4.portConnected = true;
                     }
                 }
             }

             onDeviceDisconnectedChanged:{

                 if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                     if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                         portInfo4.portConnected = false;
                     }
                 }
            }

            onShowGraph: {
                graphDrawer.portNumber = portNumber;
                graphDrawer.open();
            }
        }

        SGLayoutDebug {
            visible: debugLayout
        }
    }

    Item {
        id: deviceColumn
        width: 280 * ratioCalc
        height: root.height
        anchors {
            left: portColumn.right
            leftMargin: 160 * ratioCalc
        }

        Column {
            anchors {
                top: deviceColumn.top
                topMargin: 35 * ratioCalc
                right: deviceColumn.right
            }

            width: parent.width - (100 * ratioCalc)
            spacing: 20 * ratioCalc

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_1"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port1Animation.source = "images/cord.gif"
                                 port1Animation.currentFrame = 0
                                 port1Animation.playing = true
                                 port1Animation.pluggedIn = !port1Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_1"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port1Animation.source = "images/cordReverse.gif"
                                 port1Animation.currentFrame = 0
                                 port1Animation.playing = true
                                 port1Animation.pluggedIn = !port1Animation.pluggedIn
                             }
                         }
                    }

                    onClicked: {
                        if (!port1Animation.pluggedIn) {
                            port1Animation.source = "images/cord.gif"
                            port1Animation.currentFrame = 0
                            port1Animation.playing = true
                            port1Animation.pluggedIn = !port1Animation.pluggedIn
                        } else {
                            port1Animation.source = "images/cordReverse.gif"
                            port1Animation.currentFrame = 0
                            port1Animation.playing = true
                            port1Animation.pluggedIn = !port1Animation.pluggedIn
                        }
                    }
                }
            }

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_2"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port2Animation.source = "images/cord.gif"
                                 port2Animation.currentFrame = 0
                                 port2Animation.playing = true
                                 port2Animation.pluggedIn = !port2Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                          //           "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_2"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port2Animation.source = "images/cordReverse.gif"
                                 port2Animation.currentFrame = 0
                                 port2Animation.playing = true
                                 port2Animation.pluggedIn = !port2Animation.pluggedIn
                             }
                         }
                    }
                    onClicked: {
                        if (!port2Animation.pluggedIn) {
                            port2Animation.source = "images/cord.gif"
                            port2Animation.currentFrame = 0
                            port2Animation.playing = true
                            port2Animation.pluggedIn = !port2Animation.pluggedIn
                        } else {
                            port2Animation.source = "images/cordReverse.gif"
                            port2Animation.currentFrame = 0
                            port2Animation.playing = true
                            port2Animation.pluggedIn = !port2Animation.pluggedIn
                        }
                    }
                }
            }

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_3"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port3Animation.source = "images/cord.gif"
                                 port3Animation.currentFrame = 0
                                 port3Animation.playing = true
                                 port3Animation.pluggedIn = !port3Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                          //           "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_3"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port3Animation.source = "images/cordReverse.gif"
                                 port3Animation.currentFrame = 0
                                 port3Animation.playing = true
                                 port3Animation.pluggedIn = !port3Animation.pluggedIn
                             }
                         }
                    }
                    onClicked: {
                        if (!port3Animation.pluggedIn) {
                            port3Animation.source = "images/cord.gif"
                            port3Animation.currentFrame = 0
                            port3Animation.playing = true
                            port3Animation.pluggedIn = !port3Animation.pluggedIn
                        } else {
                            port3Animation.source = "images/cordReverse.gif"
                            port3Animation.currentFrame = 0
                            port3Animation.playing = true
                            port3Animation.pluggedIn = !port3Animation.pluggedIn
                        }
                    }
                }
            }

            DeviceInfo {
                height: portInfo1.height
                width: parent.width

                MouseArea {
                    anchors {
                        fill: parent
                    }

                    property var deviceConnected: platformInterface.usb_pd_port_connect.connection_state
                    property var deviceDisconnected: platformInterface.usb_pd_port_disconnect.connection_state

                     onDeviceConnectedChanged: {
                         //console.log("device connected message received in basicControl. Port=",platformInterface.usb_pd_port_connect.port_id,
                         //            "state=",platformInterface.usb_pd_port_connect.connection_state);

                         if (platformInterface.usb_pd_port_connect.port_id === "USB_C_port_4"){
                             if (platformInterface.usb_pd_port_connect.connection_state === "connected"){
                                 port4Animation.source = "images/cord.gif"
                                 port4Animation.currentFrame = 0
                                 port4Animation.playing = true
                                 port4Animation.pluggedIn = !port4Animation.pluggedIn
                             }
                         }
                     }

                     onDeviceDisconnectedChanged:{
                         //console.log("device disconnected message received in basicControl. Port=",platformInterface.usb_pd_port_disconnect.port_id,
                         //            "state=",platformInterface.usb_pd_port_disconnect.connection_state);

                         if (platformInterface.usb_pd_port_disconnect.port_id === "USB_C_port_4"){
                             if (platformInterface.usb_pd_port_disconnect.connection_state === "disconnected"){
                                 port4Animation.source = "images/cordReverse.gif"
                                 port4Animation.currentFrame = 0
                                 port4Animation.playing = true
                                 port4Animation.pluggedIn = !port4Animation.pluggedIn
                             }
                         }
                    }
                    onClicked: {
                        if (!port4Animation.pluggedIn) {
                            port4Animation.source = "images/cord.gif"
                            port4Animation.currentFrame = 0
                            port4Animation.playing = true
                            port4Animation.pluggedIn = !port4Animation.pluggedIn
                        } else {
                            port4Animation.source = "images/cordReverse.gif"
                            port4Animation.currentFrame = 0
                            port4Animation.playing = true
                            port4Animation.pluggedIn = !port4Animation.pluggedIn
                        }
                    }
                }
            }
        }

        SGLayoutDebug {
            visible: debugLayout
        }
    }
    */
}

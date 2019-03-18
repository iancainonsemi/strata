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
import QtQuick.Window 2.3
import "qrc:/js/core_platform_interface.js" as CorePlatformInterface

Item {
    id: platformInterface

    // -------------------
    // Notification Messages
    //
    // define and document incoming notification messages
    //  the properties of the message must match with the UI elements using them
    //  document all messages to clearly indicate to the UI layer proper names

    // @notification request_usb_power_notification
    //
    property var power_notification : {
        "buck_input_voltage": 0.0,
        "buck_output_voltage":0.0,
        "buck_input_current": 0.0,
        "buck_output_current":0.0,
        "buck_temperature": 0.0,
        "boost_input_voltage": 0.0,
        "boost_output_voltage":0.0
    }

    property var enable_power_telemetry_notification:{
          "enabled":true                             // or 'false' if disabling periodic notifications
           }


   property var set_pulse_colors_notification:{
        "enabled":true,                              // or 'false' if disabling the pulse LED
        "channel1_color":"46B900",                   //a six digit hex value (R,G,B)
        "channel2_color":"3A00C5"
    }

   property var set_linear_color_notification:{
        "enabled":true,                                // or 'false' if disabling the linear LED
        "color":"008888"                              //a six digit hex value (R,G,B)
    }

   property var set_buck_intensity_notification:{
         "enabled":true,                             // or 'false' if disabling the buck LED
         "intensity":1                               //0-100%
    }




    property var set_boost_intensity_notification:{
               "enabled":true,                 // or 'false' if disabling the boost LED
                "intensity":50                  //0-100%
    }



    // --------------------------------------------------------------------------------------------
    //          Commands
    //--------------------------------------------------------------------------------------------

    property var requestPlatformId:({
                 "cmd":"request_platform_id",
                 "payload":{
                  },
                 send: function(){
                      CorePlatformInterface.send(this)
                 }
     })

   property var refresh:({
                "cmd":"request_platform_refresh",
                "payload":{
                 },
                send: function(){
                     CorePlatformInterface.send(this)
                }
    })

    property var enable_power_telemetry:({
                 "cmd":"enable_power_telemetry",
                 "payload":{
                    "enabled":true                        // or 'false' if disabling periodic notifications
                    },
                 update: function(enabled){
                   this.set(enabled)
                   CorePlatformInterface.send(this)
                 },
                 set: function(inEnabled){
                   this.payload.enabled = inEnabled;
                  },
                 send: function(){
                   CorePlatformInterface.send(this)
                  }
     })

    property var set_pulse_colors:({
                "cmd":"set_pulse_colors",
                "payload":{
                    "enabled":true ,              // or 'false' if disabling the pulse LED
                    "channel1_color":"FFFFFF",      //a six digit hex value (R,G,B)
                    "channel2_color":"FFFFFF"
                     },
                update: function(enabled,color1,color2){
                    this.set(enabled,color1,color2)
                    CorePlatformInterface.send(this)
                },
                set: function(inEnabled,inColor1,inColor2){
                    this.payload.enabled = inEnabled;
                    this.payload.channel1_color = inColor1;
                    this.payload.channel2_color = inColor2;
                },
                send: function(){
                    CorePlatformInterface.send(this)
                },
                show: function(){
                    CorePlatformInterface.show(this)
                }
    })
    
    property var set_linear_color:({
               "cmd":"set_linear_color",
               "payload":{
                  "enabled":true,            // or 'false' if disabling the pulse LED
                  "color":"FFFFFF"          //a six digit hex value (R,G,B)
               },
                update: function(enabled,color){
                    this.set(enabled,color)
                    CorePlatformInterface.send(this)
                },
                set: function(enabled,color){
                    this.payload.enabled = enabled;
                    this.payload.color = color;
                },
                send: function(){
                    CorePlatformInterface.send(this)
                },
                show: function(){
                    CorePlatformInterface.show(this)
                }
    })

    property var set_buck_intensity :({
                "cmd":"set_buck_intensity",
                "payload":{
                    "enabled":true,            // or 'false' if disabling the pulse LED
                    "intensity":50            //between 0 and 100%
                 },
                 update: function(enabled,intensity){
                      this.set(enabled,intensity)
                      CorePlatformInterface.send(this)
                      },
                 set: function(enabled,intensity){
                      this.payload.enabled = enabled;
                     this.payload.intensity = intensity;
                      },
                 send: function(){
                       CorePlatformInterface.send(this)
                      },
                show: function(){
                      CorePlatformInterface.show(this)
                      }
    })

    property var  set_boost_intensity:({
                  "cmd":"set_boost_intensity",
                  "payload":{
                        "enabled":false,  // or true
                        "intensity":0,    //between 0 and 100%
                       },
                   update: function(enabled,intensity){
                        this.set(enabled,intensity)
                        CorePlatformInterface.send(this)
                        },
                   set: function(enabled,intensity){
                        this.payload.enabled = enabled;
                        this.payload.intensity = intensity;
                        },
                   send: function(){
                        CorePlatformInterface.send(this)
                        },
                   show: function(){
                        CorePlatformInterface.show(this)
                        }
    })



    // -------------------  end commands

    // NOTE:
    //  All internal property names for PlatformInterface must avoid name collisions with notification/cmd message properties.
    //   naming convention to avoid name collisions;
    // property var _name


    // -------------------------------------------------------------------
    // Connect to CoreInterface notification signals
    //
    Connections {
        target: coreInterface
        onNotification: {
            if (!payload.includes("power_notification")){
                console.log("**** Notification",payload);
            }
            CorePlatformInterface.data_source_handler(payload)
        }
    }




   /*     // DEBUG - TODO: Faller - Remove before merging back to Dev
    Window {
        id: debug
        visible: true
        width: 225
        height: 200

        function randomColor(){
            var red1 = Math.floor((Math.random()*255));
            var red1Hex = red1.toString(16).toUpperCase()
            if (red1Hex.length % 2) {
              red1Hex = '0' + red1Hex;
            }

            var green1 = Math.floor(Math.random()*255);
            green1 = green1.toString(16)
            var green1Hex = green1.toString(16).toUpperCase()
            if (green1Hex.length % 2) {
              green1Hex = '0' + green1Hex;
            }

            var blue1 = Math.floor(Math.random()*255);
            var blue1Hex = blue1.toString(16).toUpperCase()
            if (blue1Hex.length % 2) {
              blue1Hex = '0' + blue1Hex;
            }

            return(red1Hex + green1Hex + blue1Hex);
        }

        Button {
            id: leftButton1
            text: "disable pulse"
            onClicked: {
                var color1 = debug.randomColor();
                var color2 = debug.randomColor();
                //console.log("random color 1 is:",red1Hex, green1Hex, blue1Hex, color1);
                CorePlatformInterface.data_source_handler('{
                                   "value":"set_pulse_colors_notification",
                                   "payload": {
                                            "enabled": false,
                                            "channel1_color":"'+ color1 +'",
                                            "channel2_color":"'+color2+'"
                                        }
                                    }')
            }
        }

        Button {
            id: button1
            text: "enable/set pulse"
            anchors.left: leftButton1.right
            onClicked: {
                var color1 = debug.randomColor();
                var color2 = debug.randomColor();
                //console.log("random color 1 is:",red1Hex, green1Hex, blue1Hex, color1);
                CorePlatformInterface.data_source_handler('{
                                   "value":"set_pulse_colors_notification",
                                   "payload": {
                                            "enabled": true,
                                            "channel1_color":"'+ color1 +'",
                                            "channel2_color":"'+color2+'"
                                        }
                                    }')
            }
        }

        Button {
            id: leftButton2
            anchors { top: button1.bottom }
            text: "disable linear"
            onClicked: {
                var theRandomColor = debug.randomColor();
                CorePlatformInterface.data_source_handler('{
                    "value":"set_linear_color_notification",
                    "payload":{
                                "enabled":false,
                                "color":"'+theRandomColor+'"
                               }
                             }')
            }
        }

        Button {
            id: button2
            anchors.top: button1.bottom
            anchors.left: leftButton2.right
            text: "enable/set linear"
            onClicked: {
                var theRandomColor = debug.randomColor();
                CorePlatformInterface.data_source_handler('{
                    "value":"set_linear_color_notification",
                    "payload":{
                                "enabled":true,
                                "color":"'+theRandomColor+'"
                               }
                             }')
            }
        }


        Button {
            id:leftButton3
            anchors { top: button2.bottom }
            text: "disable buck"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"set_buck_intensity_notification",
                            "payload":{
                                    "enabled":false,
                                     "intensity":'+ (Math.random()*100).toFixed(0) +'
                            }
                    }')
            }
        }

        Button {
            id:button3
            anchors.top: button2.bottom
            anchors.left:leftButton2.right
            text: "enable/set buck"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"set_buck_intensity_notification",
                            "payload":{
                                    "enabled":true,
                                     "intensity":'+ (Math.random()*100).toFixed(0) +'
                            }
                    }')
            }
        }


        Button {
            id:leftButton4
            anchors { top: button3.bottom }
            text: "disable boost"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"set_boost_intensity_notification",
                            "payload":{
                                    "enabled":false,
                                     "intensity":'+ (Math.random()*100).toFixed(0) +'
                            }
                    }')
            }
        }

        Button {
            id:button4
            anchors.top: button3.bottom
            anchors.left: leftButton4.right
            text: "enable/set boost"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"set_boost_intensity_notification",
                            "payload":{
                                    "enabled":true,
                                     "intensity":'+ (Math.random()*100).toFixed(0) +'
                            }
                    }')
            }
        }


        Button {
            id:button5
            anchors { top: button4.bottom }
            text: "update buck telemetry"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"led_buck_power_notification",
                            "payload":{
                                    "input_voltage":'+ (Math.random() + 12).toFixed(1) +',
                                     "output_voltage":'+ (Math.random() + 9).toFixed(2) +',
                                    "input_current":'+ (Math.random() + 100).toFixed(0) +',
                                    "output_current":'+ (Math.random() + 100).toFixed(0) +',
                                    "temperature":'+ (Math.random()*5 + 40).toFixed(0) +'
                            }
                    }')
            }
        }
    }
    */
}

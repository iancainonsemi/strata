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

    // @notification read_voltage_current
    // @description: read values
    //
    property var status_voltage_current : {
                "vin":	0,		//in Volts
                "vout": 0,   		//in Volts
                "vcc": 0,   		//in Volts
                "vb": 0,   		//in Volts
                "vout": 0,   		//in Volts
                "vboost": 0,   	//in Volts
                "iin":	0,    		//in A
                "iout": 0,     		//in A
                "efficiency": 0,	// in percentage
                "power_dissipated": 0, // in mW
                "output_power": 0, // in mW
                "vingood":	""
    }

    // @notification read_temperature_sensor
    // @description: Read temperature
    //
    property var status_temperature_sensor : {
        "temperature":	0
    }

    property var status_enable: {
        "enable": " "
    }

    property var initial_status: {
       "enable_status":"",
        "soft_start_status":"",
        "vout_selector_status":0,
        "ocp_threshold_status":0,
        "mode_index_status":0
    }

    // -------------------  end notification messages


    // -------------------
    // Commands
    // TO SEND A COMMAND DO THE FOLLOWING:
    // EXAMPLE: To send the motor speed: platformInterface.set_enable.update("on")

    // TO SYNCHRONIZE THE SPEED ON ALL THE VIEW DO THE FOLLOWING:
    // EXAMPLE: platformInterface.enabled

    property var read_initial_status: ({ "cmd" : "read_initial_status",

                                         update: function () {
                                             CorePlatformInterface.send(this)
                                         },
                                         send: function () { CorePlatformInterface.send(this) },
                                         show: function () { CorePlatformInterface.show(this) }

                                     })

    property var read_enable_state: ({ "cmd" : "read_enable",

                                         update: function () {
                                             CorePlatformInterface.send(this)
                                         },
                                         send: function () { CorePlatformInterface.send(this) },
                                         show: function () { CorePlatformInterface.show(this) }

                                     })

    property var set_enable: ({
                                  "cmd" : "set_enable",
                                  "payload": {
                                      "enable": " ",
                                  },

                                  // Update will set and send in one shot
                                  update: function (enabled) {
                                      this.set(enabled)
                                      CorePlatformInterface.send(this)
                                  },
                                  // Set can set single or multiple properties before sending to platform
                                  set: function (enabled) {
                                      this.payload.enable = enabled;
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }

                              })

    property var set_mode: ({
                                  "cmd" : "set_mode",
                                  "payload": {
                                      "mode_index": 0,
                                  },

                                  // Update will set and send in one shot
                                  update: function (mode_index) {
                                      this.set(mode_index)
                                      CorePlatformInterface.send(this)
                                  },
                                  // Set can set single or multiple properties before sending to platform
                                  set: function (mode_index) {
                                      this.payload.mode_index = mode_index;
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }

                              })

    property var set_soft_start: ({
                                  "cmd" : "set_soft_start",
                                  "payload": {
                                      "soft_start":"",
                                  },

                                  // Update will set and send in one shot
                                  update: function (soft_start) {
                                      this.set(soft_start)
                                      CorePlatformInterface.send(this)
                                  },
                                  // Set can set single or multiple properties before sending to platform
                                  set: function (soft_start) {
                                      this.payload.soft_start = soft_start;
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }

                              })

    property var select_output_voltage: ({
                                  "cmd" : "select_output_voltage",
                                  "payload": {
                                      "output_voltage": 0,
                                  },

                                  // Update will set and send in one shot
                                  update: function (output_voltage) {
                                      this.set(output_voltage)
                                      CorePlatformInterface.send(this)
                                  },
                                  // Set can set single or multiple properties before sending to platform
                                  set: function (output_voltage) {
                                      this.payload.output_voltage = output_voltage;
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }

                              })

    property var select_ocp_threshold: ({
                                  "cmd" : "select_ocp_threshold",
                                  "payload": {
                                      "ocp_threshold": 0,
                                  },

                                  // Update will set and send in one shot
                                  update: function (ocp_threshold) {
                                      this.set(ocp_threshold)
                                      CorePlatformInterface.send(this)
                                  },
                                  // Set can set single or multiple properties before sending to platform
                                  set: function (ocp_threshold) {
                                      this.payload.ocp_threshold = ocp_threshold;
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }

                              })

    //Tejashree: This is a HACK implementation
    property var pause_periodic: ({
                                  "cmd" : "pause_periodic",
                                  "payload": {
                                      "pause_flag": "",
                                  },

                                  // Set can set single or multiple properties before sending to platform
                                  set: function (pause_flag) {
                                      this.payload.pause_flag = pause_flag;
                                  },

                                  // Update will set and send in one shot
                                  update: function (pause_flag) {
                                      this.set(pause_flag)
                                      CorePlatformInterface.send(this)
                                  },
                                  send: function () { CorePlatformInterface.send(this) },
                                  show: function () { CorePlatformInterface.show(this) }
                              })


    // -------------------  end commands
    // NOTE:
    //  All internal property names for PlatformInterface must avoid name collisions with notification/cmd message properties.
    //  naming convention to avoid name collisions;
    //  property var _name


    // -------------------------------------------------------------------
    // Connect to CoreInterface notification signals
    // -------------------------------------------------------------------
    Connections {
        target: coreInterface
        onNotification: {
            CorePlatformInterface.data_source_handler(payload)
        }
    }

    property bool enabled: false

    property int soft_start: 0

    property int vout: 0

    property int ocp_threshold: 0

    property int mode: 0

    property bool advertise;

    //        // DEBUG Window for testing motor vortex UI without a platform
    //    Window {
    //        id: debug
    //        visible: true
    //        width: 200
    //        height: 200

    //        Button {
    //            id: button2
    //         //   anchors { top: button1.bottom }
    //            text: "send vin"
    //            onClicked: {
    //                CorePlatformInterface.data_source_handler('{
    //                    "value":"read_voltage_current",
    //                    "payload":{
    //                                "vin":'+ (Math.random()*5+10).toFixed(2) +',
    //                                "vout": '+ (Math.random()*5+10).toFixed(2) +',
    //                                "iin": '+ (Math.random()*5+10).toFixed(2) +',
    //                                "iout": '+ (Math.random()*5+10).toFixed(2) +',
    //                                "vin_bad": "off"

    //                               }
    //                             }')
    //            }
    //        }
    //        Button {
    //            anchors { top: button2.bottom }
    //            text: "send"
    //            onClicked: {
    //                CorePlatformInterface.data_source_handler('{
    //                            "value":"read_temperature_sensor",
    //                            "payload":{
    //                                     "temperature": '+ (Math.random()*100).toFixed(0) +'
    //                            }
    //                    }
    //            ')
    //            }
    //        }
    //    }
}

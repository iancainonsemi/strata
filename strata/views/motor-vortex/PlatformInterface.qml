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

    // @notification pi_stats
    // @description: show motor statistics.
    //
    property var pi_stats : {
        "speed_target": 1500,
                "current_speed": 0,
                "error": 0,
                "sum": 0.5,
                "duty_now": 0.5
    }

    // @notification input_voltage_notification
    // @description: updates voltage
    //
    property var input_voltage_notification : {
        "vin": 0
    }

    // @notification system_error
    // @description: updates faults in AdvancedControl and FAEControl
    //
    property var system_error: {
        "error_and_warnings" : [ ]
    }

    property var motor_off: {
        "enable" : ""
    }

    property var set_mode: {
        "system_mode" : ""
    }

    // System mode radio buttons can be set by the user on UI or from the notification as well.
    // This is because system mode setting is tied to a harware switch on the platform.
    // Following property allows us to update the RadioButtons based on the notification and
    // not get stuck in the recursive loop.
    property var systemModeNotification: platformInterface.set_mode.system_mode;
    onSystemModeNotificationChanged: {
        if(systemModeNotification === "manual") {
            systemMode = true
            console.log("platform setting Manual")
        }
        else if(systemModeNotification === "automation"){
            systemMode = false
            console.log("platform setting Auto")
        }
    }

    // -------------------  end notification messages


    // -------------------
    // Commands
    // TO SEND A COMMAND DO THE FOLLOWING:
    // EXAMPLE: To send the motor speed: platformInterface.motor_speed.update(motorSpeedSliderValue)
    // where motorSpeedSliderValue is the value set as speed and send to platform.
    // motor_speed is the command and update is the function in the command which sends the
    // notification

    // TO SYNCHRONIZE THE SPEED ON ALL THE VIEW DO THE FOLLOWING:
    // EXAMPLE: platformInterface.motorSpeedSliderValue

    property var motor_speed : ({
                                    "cmd" : "speed_input",
                                    "payload": {
                                        "speed_target": 1500 // default value
                                    },

                                    // Update will set and send in one shot
                                    update: function (speed) {
                                        this.set(speed)
                                        CorePlatformInterface.send(this)
                                    },
                                    // Set can set single or multiple properties before sending to platform
                                    set: function (speed) {
                                        this.payload.speed_target = speed;
                                    },
                                    send: function () { CorePlatformInterface.send(this) },
                                    show: function () { CorePlatformInterface.show(this) }
                                })

    /*
       system_mode_selection Command
     */
    property var system_mode_selection: ({
                                             "cmd" : "set_system_mode",
                                             "payload": {
                                                 "system_mode":" " // "automation" or "manual"
                                             },

                                             // Update will set and send in one shot
                                             update: function (system_mode) {
                                                 this.set(system_mode)
                                                 CorePlatformInterface.send(this)
                                             },
                                             // Set can set single or multiple properties before sending to platform
                                             set: function (system_mode) {
                                                 this.payload.system_mode = system_mode;
                                             },
                                             send: function () { CorePlatformInterface.send(this) },
                                             show: function () { CorePlatformInterface.show(this) }
                                         })

    /*
      set_drive_mode
    */
    property var set_drive_mode: ({
                                      "cmd" : "set_drive_mode",
                                      "payload": {
                                          "drive_mode" : " ",
                                      },

                                      // Update will set and send in one shot
                                      update: function (drive_mode) {
                                          this.set(drive_mode)
                                          CorePlatformInterface.send(this)
                                      },
                                      // Set can set single or multiple properties before sending to platform
                                      set: function (drive_mode) {
                                          this.payload.drive_mode = drive_mode;
                                      },
                                      send: function () { CorePlatformInterface.send(this) },
                                      show: function () { CorePlatformInterface.show(this) }
                                  })

    /*
      Set Phase Angle
    */
    property var set_phase_angle: ({
                                       "cmd" : "set_phase_angle",
                                       "payload": {
                                           "phase_angle" : 0,
                                       },

                                       // Update will set and send in one shot
                                       update: function (phase_angle) {
                                           this.set(phase_angle)
                                           CorePlatformInterface.send(this)
                                       },
                                       // Set can set single or multiple properties before sending to platform
                                       set: function (phase_angle) {
                                           this.payload.phase_angle = phase_angle;
                                       },
                                       send: function () { CorePlatformInterface.send(this) },
                                       show: function () { CorePlatformInterface.show(this) }

                                   })


    /*
      Set Motor State
    */
    property var set_motor_on_off: ({
                                        "cmd" : "set_motor_on_off",
                                        "payload": {
                                            "enable": 0,
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

    /*
      Set Ramp Rate
    */
    property var set_ramp_rate: ({
                                     "cmd": "set_ramp_rate",
                                     "payload" : {
                                         "ramp_rate": ""
                                     },

                                     // Update will set and send in one shot
                                     update: function (ramp_rate) {
                                         this.set(ramp_rate)
                                         CorePlatformInterface.send(this)
                                     },
                                     // Set can set single or multiple properties before sending to platform
                                     set: function (ramp_rate) {
                                         this.payload.ramp_rate = ramp_rate;
                                     },
                                     send: function () { CorePlatformInterface.send(this) },
                                     show: function () { CorePlatformInterface.show(this) }
                                 })

    /*
      Set Reset mcu
    */
    property var set_reset_mcu: ({
                                     "cmd": "reset_mcu",
                                     // Update will send in one shot
                                     update: function () {
                                         CorePlatformInterface.send(this)
                                     },
                                     send: function () { CorePlatformInterface.send(this) },
                                     show: function () { CorePlatformInterface.show(this) }
                                 })


    /*
      Set LED Color Mixing
    */
    property var set_color_mixing : ({
                                         "cmd":"set_color_mixing",
                                         "payload":{
                                             "color1": "red", // color can be "red"/"green"/"blue"
                                             "color_value1": 128,// color_value varies from 0 to 255
                                             "color2": "green", // color can be "red"/"green"/"blue"
                                             "color_value2": 127, // color_value varies from 0 to 255
                                         },
                                         // Update will set and send in one shot
                                         update: function (color_1,color_value_1,color_2,color_value_2) {
                                             this.set(color_1,color_value_1,color_2,color_value_2)
                                             CorePlatformInterface.send(this)
                                         },
                                         // Set can set single or multiple properties before sending to platform
                                         set: function (color_1,color_value_1,color_2,color_value_2) {
                                             this.payload.color1 = color_1;
                                             this.payload.color_value1 = color_value_1;
                                             this.payload.color2 = color_2;
                                             this.payload.color_value2 = color_value_2;
                                         },
                                         send: function () { CorePlatformInterface.send(this) },
                                         show: function () { CorePlatformInterface.show(this) }
                                     })

    /*
      Set Single Color LED
    */
    property var set_single_color: ({
                                        "cmd":"set_single_color",
                                        "payload":{
                                            "color": "red" ,// color can be "red"/"green"/"blue"
                                            "color_value": 120, // color_value varies from 0 to 255
                                        },
                                        // Update will set and send in one shot
                                        update: function (color,color_value) {
                                            this.set(color,color_value)
                                            CorePlatformInterface.send(this)
                                        },
                                        set: function (color,color_value) {
                                            this.payload.color = color;
                                            this.payload.color_value = color_value;
                                        },
                                        send: function () { CorePlatformInterface.send(this) },
                                        show: function () { CorePlatformInterface.show(this) }
                                    })

    /*
      set Blink0 Frequency
     */
    property var set_blink0_frequency: ({
                                            "cmd":"set_blink0_frequency",
                                            "payload":{
                                                "blink0_frequency": 2
                                            },
                                            // Update will set and send in one shot
                                            update: function (blink_0_frequency) {
                                                this.set(blink_0_frequency)
                                                CorePlatformInterface.send(this)
                                            },
                                            set: function (blink_0_frequency) {
                                                this.payload.blink0_frequency = blink_0_frequency
                                            },
                                            send: function () { CorePlatformInterface.send(this) },
                                            show: function () { CorePlatformInterface.show(this) }
                                        })

    /*
      set_led_output_on_off
     */
    property var set_led_outputs_on_off:({
                                             "cmd":"set_led_outputs_on_off",
                                             "payload":{
                                                 "led_output": "white"       // "white" for turning all LEDs ON
                                                 // "off" to turn off all the LEDs.
                                             },
                                             update: function (led_output) {
                                                 this.set(led_output)
                                                 CorePlatformInterface.send(this)
                                             },
                                             set: function (led_output) {
                                                 this.payload.led_output = led_output
                                             },
                                             send: function () { CorePlatformInterface.send(this) },
                                             show: function () { CorePlatformInterface.show(this) }
                                         })

    // -------------------  end commands


    // NOTE:
    //  All internal property names for PlatformInterface must avoid name collisions with notification/cmd message properties.
    //   naming convention to avoid name collisions;
    // property var _name


    // -------------------------------------------------------------------
    // Connect to CoreInterface notification signals
    // -------------------------------------------------------------------
    Connections {
        target: coreInterface
        onNotification: {
            CorePlatformInterface.data_source_handler(payload)
        }
    }

    //-------------------------------------
    // add all syncrhonized controls here
    //-----------------------------------------
    property int motorSpeedSliderValue: 1500
    onMotorSpeedSliderValueChanged: {
        motor_speed.update(motorSpeedSliderValue)
    }

    property bool sliderUpdateSignal: false
    property int rampRateSliderValue: 3
    onRampRateSliderValueChanged: {
        set_ramp_rate.update(rampRateSliderValue)
    }

    property int rampRateSliderValueForFae: 3
    onRampRateSliderValueForFaeChanged: {
        set_ramp_rate.update(rampRateSliderValueForFae)
    }

    property int phaseAngle : 15
    onPhaseAngleChanged: {
        set_phase_angle.update(phaseAngle)
    }

    property real ledSlider: 128
    onLedSliderChanged: {
        console.log("in signal control")
    }

    property bool turnOffChecked: false
    property real singleLEDSlider :  0
    property int ledPulseSlider: 150
    onLedPulseSliderChanged:  {
        set_blink0_frequency.update(ledPulseSlider)
    }

    property bool driveModePseudoSinusoidal: false
    onDriveModePseudoSinusoidalChanged: {
        if(driveModePseudoSinusoidal === true) {
            set_drive_mode.update(1)
        }
    }

    property bool driveModePseudoTrapezoidal: true
    onDriveModePseudoTrapezoidalChanged: {
        if(driveModePseudoTrapezoidal === true) {
            set_drive_mode.update(0)
        }
    }

    property bool systemMode: true
    onSystemModeChanged: {
        if(systemMode){
            console.log("manual signal mode")
            system_mode_selection.update("manual")
        }
        else{
            console.log("auto signal mode")
            system_mode_selection.update("automation")
        }
    }

    property bool motorState: false
    onMotorStateChanged: {
        console.log("in motor state")
        if(motorState === true) {
            set_motor_on_off.update(0)
        }
        else  {
            /*
              Tanya: To fast on mac and we lose the first command send.
              Works on Windows. Would need a Timer in Mac
            */
            motor_speed.update(motorSpeedSliderValue);
            set_motor_on_off.update(1);
        }
    }

    property bool advertise;

    /*    // DEBUG Window for testing motor vortex UI without a platform
    Window {
        id: debug
        visible: true
        width: 200
        height: 200

        Button {
            id: button2
            anchors { top: button1.bottom }
            text: "send vin"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                    "value":"pi_stats",
                    "payload":{
                                "speed_target":3216,
                                "current_speed": '+ (Math.random()*2000+3000).toFixed(0) +',
                                "error":-1104,
                                "sum":-0.01,
                                "duty_now":0.67,
                                "mode":"manual"
                               }
                             }')
            }
        }
        Button {
            anchors { top: button2.bottom }
            text: "send"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                            "value":"input_voltage_notification",
                            "payload":{
                                     "vin":'+ (Math.random()*5+10).toFixed(2) +'
                            }
                    }
            ')
            }
        }
    }*/
}

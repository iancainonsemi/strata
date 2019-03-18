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
    // @description: shows relevant data for a single port.
    //
    property var request_usb_power_notification : {
        "port": 1,
        "device": "PD",
        "advertised_maximum_current": 0.0,
        "negotiated_current": 0.0,
        "negotiated_voltage": 0.0,
        "input_voltage": 0.0,
        "output_voltage":0.0,
        "input_current": 0.0,
        "output_current":0.0,
        "temperature": 0.0,
        "maximum_power":0.0
    }

    onRequest_usb_power_notificationChanged: {
//        console.log("port",request_usb_power_notification.port,"input current=",request_usb_power_notification.input_current);

//        console.log("output voltage=",request_usb_power_notification.output_voltage,
//                    "output current=",request_usb_power_notification.output_current,
//                    "power=",request_usb_power_notification.output_voltage * request_usb_power_notification.output_current);
    }


    // @notification usb_pd_port_connect
    // @description: sent when a device is connected or disconnected
    //
    property var usb_pd_port_connect : {
        "port_id": "",
        "connection_state":"unknown"
    }
    onUsb_pd_port_connectChanged: {
        console.log("usb_pd_port_connect changed. port_id=",usb_pd_port_connect.port_id," connection_state=",usb_pd_port_connect.connection_state);
    }

    property var usb_pd_port_disconnect:{
        "port_id": "unknown",
        "connection_state": "unknown"
    }

    property var usb_pd_protection_action:{
         "action":"shutdown"     // or "nothing" or "retry"
    }


   property var input_under_voltage_notification:{
          "state":"below",                                        // if the input voltage decreases to below the voltage limit, "above" otherwise.
          "minimum_voltage":0                                     // Voltage limit in volts
    }

//    onInput_under_voltage_notificationChanged: {
//        console.log("input voltage is",input_under_voltage_notification.state,
//                    " minimum voltage = ",input_under_voltage_notification.minimum_voltage);

//    }

    property var set_maximum_temperature_notification:{
            "maximum_temperature":0                         // degrees C
            }

   property var over_temperature_notification:{
           "port":"USB_C_port_1",                                // or any USB C port
           "state":"below",                                      // if the temperature crossed from under temperature to over temperature, "below" otherwise.
           "maximum_temperature":200                             // Temperature limit in degrees C
    }

        //consider the values held by this property to be the master ones, which will be current when needed for calling
        //the API to set the input voltage foldback
    property var foldback_input_voltage_limiting_event:{
            "input_voltage":0,
            "foldback_minimum_voltage":0,
            "foldback_minimum_voltage_power":15,
            "input_voltage_foldback_enabled":false,
            "input_voltage_foldback_active":false
    }

//  onFoldback_input_voltage_limiting_eventChanged: {
//        console.log("input voltage foldback values updated");
//        console.log("input voltage event notification. values are ",foldback_input_voltage_limiting_refresh.foldback_minimum_voltage,
//                                                                    foldback_input_voltage_limiting_refresh.foldback_minimum_voltage_power,
//                                                                    foldback_input_voltage_limiting_refresh.input_voltage_foldback_enabled,
//                                                                    foldback_input_voltage_limiting_refresh.input_voltage_foldback_active);
//        }

    property var foldback_input_voltage_limiting_refresh:{
            "input_voltage":0,
            "foldback_minimum_voltage":0,
            "foldback_minimum_voltage_power":15,
            "input_voltage_foldback_enabled":false,
            "input_voltage_foldback_active":false
    }

    //keep the refresh and event notification properties in synch
    onFoldback_input_voltage_limiting_refreshChanged: {
        //console.log("input voltage refresh notification. minimum voltage = ",foldback_input_voltage_limiting_refresh.foldback_minimum_voltage);

            //update the variables for foldback limiting
        platformInterface.foldback_input_voltage_limiting_event.input_voltage = foldback_input_voltage_limiting_refresh.input_voltage;

        platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage = foldback_input_voltage_limiting_refresh.foldback_minimum_voltage;
        platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power = foldback_input_voltage_limiting_refresh.foldback_minimum_voltage_power;
        console.log(" foldback minimum power = ",platformInterface.foldback_input_voltage_limiting_event.foldback_minimum_voltage_power);
        platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_enabled = foldback_input_voltage_limiting_refresh.input_voltage_foldback_enabled;
        platformInterface.foldback_input_voltage_limiting_event.input_voltage_foldback_active = foldback_input_voltage_limiting_refresh.input_voltage_foldback_active;
    }

    //consider the values held by this property to be the master ones, which will be current when needed for calling
    //the API to set the input temperature foldback
    property var foldback_temperature_limiting_event:{
            "port":0,
            "current_temperature":0,
            "foldback_maximum_temperature":135,
            "foldback_maximum_temperature_power":15,
            "temperature_foldback_enabled":true,
            "temperature_foldback_active":true,
            "maximum_power":0
    }

    property var foldback_temperature_limiting_refresh:{
            "port":0,
            "current_temperature":0,
            "foldback_maximum_temperature":135,
            "foldback_maximum_temperature_power":15,
            "temperature_foldback_enabled":true,
            "temperature_foldback_active":true,
            "maximum_power":0
    }
    //keep the refresh and event notification properties in synch
    onFoldback_temperature_limiting_refreshChanged: {
        //update the corresponding variables
        foldback_temperature_limiting_event.port = foldback_input_voltage_limiting_refresh.port;
        foldback_temperature_limiting_event.current_temperature = foldback_temperature_limiting_refresh.current_temperature;
        foldback_temperature_limiting_event.foldback_maximum_temperature = foldback_temperature_limiting_refresh.foldback_maximum_temperature;
        foldback_temperature_limiting_event.foldback_maximum_temperature_power = foldback_temperature_limiting_refresh.foldback_maximum_temperature_power;
        foldback_temperature_limiting_event.temperature_foldback_enabled = foldback_temperature_limiting_refresh.temperature_foldback_enabled;
        foldback_temperature_limiting_event.temperature_foldback_active = foldback_temperature_limiting_refresh.temperature_foldback_active;
        foldback_temperature_limiting_event.maximum_power = foldback_temperature_limiting_refresh.maximum_power;
    }

    property var usb_pd_maximum_power:{
        "port":0,                            // up to maximum number of ports
        "current_max_power":0,               // 15 | 27 | 36 | 45 | 60 | 100
        "default_max_power":0,               // 15 | 27 | 36 | 45 | 60 | 100
        "commanded_max_power":0
    }

    property var request_over_current_protection_notification:{
        "port":0,                           // 1, 2, ... maximum port number
        "current_limit":0,                  // amps - output current  exceeds this level
        "exceeds_limit":false,              // or false
        "action":"nothing",                 // "retry" or "shutdown" or "nothing"
        "enabled":false                     // or false
    }

    property var get_cable_loss_compensation:{
        "port":0,                           // Same port as in the command above.
        "output_current":0,                 // Amps
        "bias_voltage":0,                   // Volts
    }

    property var usb_pd_advertised_voltages_notification:{
        "port":0,                            // The port number that this applies to
        "maximum_power":45,                  // watts
        "number_of_settings":7,              // 1-7
        "settings":[]                        // each setting object includes
                                             // "voltage":5,                // Volts
                                             // "maximum_current":3.0,      // Amps
    }

    property var request_reset_notification :{
         "reset_status":true                   // only one value : true since only sent at the start
    }

    //when the platform sends a reset notification, the host must make a platformId call to initialize communication
    //and a Refresh() command to synchronize settings with the platform
    onRequest_reset_notificationChanged: {
        console.log("Requesting Refresh")
        platformInterface.refresh.send() //ask the platform for all the current values
    }

    //this call doesn't exist yet in the API. This is a placeholder
    property var power_negotiation :{
         "negotiation_type":"dynamic"           // or "first_come_first_served" or "priority"
    }

    property var sleep_mode :{
         "mode":"manual"           // or "automatic"
    }

    property var manual_sleep_mode :{
         "mode":"on"           // or "off"
    }

    property var maximum_board_power :{
         "watts":30          // 30-300
    }

    property var ac_power_supply_connection:{
        "state":"connected",  // or "disconnected"
        "power":200          // maximum supply power in watts
    }

    property var assured_power_port:{
        "port":1,          // port to enable/disable for assured power
        "enabled":true,     // or 'false' if disabling assured port
        "port":1,              // or any USB C port id
        "voltage":12,          // One of the available voltages
        "maximum_current":100  // in milliamps
    }

    property var output_current_exceeds_maximum:{
        "port":1,              // 1, 2, ... maximum port number
        "current_limit":15,    // amps - output current  exceeds this level
        "exceeds_limit":true,  // or false
        "action":"retry",      // "retry" or "shutdown" or "nothing"
        "enabled":true         // or false
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

    property var set_protection_action:({
                "cmd":"request_protection_action",
                "payload":{
                        "action":"shutdown"         // "shutdown" or "retry" or "nothing"
                     },
                update: function(protectionAction){
                    this.set(protectionAction)
                    CorePlatformInterface.send(this)
                },
                set: function(protectionAction){
                    this.payload.action = protectionAction;
                },
                send: function(){
                    CorePlatformInterface.send(this)
                },
                show: function(){
                    CorePlatformInterface.show(this)
                }
    })
    
    property var set_minimum_input_voltage:({
               "cmd":"request_set_minimum_voltage",
               "payload":{
                    "value":0    // 0 - 20v
               },
                update: function(minimumVoltage){
                    this.set(minimumVoltage)
                    CorePlatformInterface.send(this)
                },
                set: function(minimumVoltage){
                    this.payload.value = minimumVoltage;
                },
                send: function(){
                    CorePlatformInterface.send(this)
                },
                show: function(){
                    CorePlatformInterface.show(this)
                }
    })

    property var set_maximum_temperature :({
                "cmd":"request_set_maximum_temperature",
                "payload":{
                       "value":200    // 0 - 127 degrees C
                 },
                 update: function(maximumTemperature){
                      this.set(maximumTemperature)
                      CorePlatformInterface.send(this)
                      },
                 set: function(maximumTemperature){
                      this.payload.value = maximumTemperature;
                      },
                 send: function(){
                       CorePlatformInterface.send(this)
                      },
                show: function(){
                      CorePlatformInterface.show(this)
                      }
    })

    property var  set_input_voltage_foldback:({
                  "cmd":"request_voltage_foldback",
                  "payload":{
                        "enabled":false,  // or true
                        "voltage":0,    // in Volts
                         "power":45      // in Watts
                       },
                   update: function(enabled,voltage,watts){
                       //console.log("input voltage foldback update: enabled=",enabled,"voltage=",voltage,"watts=",watts);
                       //set the notification property values, as the platform won't send a notification in response to this
                       //command, and those properties are used by controls to see what the value of other controls should be.
                       foldback_input_voltage_limiting_event.input_voltage_foldback_enabled = enabled;
                       foldback_input_voltage_limiting_event.foldback_minimum_voltage = voltage;
                       foldback_input_voltage_limiting_event.foldback_minimum_voltage_power = watts;
                        this.set(enabled,voltage,watts)
                        CorePlatformInterface.send(this)
                        },
                   set: function(enabled,voltage,watts){
                        this.payload.enabled = enabled;
                        this.payload.voltage = voltage;
                        this.payload.power = watts;
                        },
                   send: function(){
                        CorePlatformInterface.send(this)
                        },
                   show: function(){
                        CorePlatformInterface.show(this)
                        }
    })

    property var  set_temperature_foldback:({
                  "cmd":"request_temperature_foldback",
                  "payload":{
                        "enabled":false,  // or true
                        "temperature":0,    // in °C
                        "power":45      // in Watts
                       },
                   update: function(enabled,temperature,watts){
                       //update the variables for this action
//                       foldback_temperature_limiting_event.foldback_maximum_temperature = temperature;
//                       foldback_temperature_limiting_event.foldback_maximum_temperature_power = watts;
//                       foldback_temperature_limiting_event.temperature_foldback_enabled = enabled;
                        this.set(enabled,temperature,watts)
                        CorePlatformInterface.send(this)
                        },
                   set: function(enabled,temperature,watts){
                        this.payload.enabled = enabled;
                        this.payload.temperature = temperature;
                        this.payload.power = watts;
                        },
                   send: function(){
                        CorePlatformInterface.send(this)
                        },
                   show: function(){
                        CorePlatformInterface.show(this)
                        }
    })

    property var set_usb_pd_maximum_power : ({
                    "cmd":"request_usb_pd_maximum_power",
                    "payload":{
                         "port":0,      // up to maximum number of ports
                         "watts":0      // 15 | 27 | 36 | 45 | 60 | 100
                         },
                    update: function (port, watts){
                        this.set(port,watts);
                        CorePlatformInterface.send(this);
                    },
                    set: function(port,watts){
                        this.payload.port = port;
                        this.payload.watts = watts;
                    },
                    send: function () { CorePlatformInterface.send(this) },
                    show: function () { CorePlatformInterface.show(this) }
    })

    property var set_over_current_protection:({
                    "cmd":"request_over_current_protection",
                    "payload":{
                        "port":0,                    // 1, 2, 3, ... up to maximum number of ports
                        "enabled":true,           // or false
                        "maximum_current":12,    // amps
                      },
                      update: function (port, maxCurrent){
                          this.set(port,maxCurrent);
                          CorePlatformInterface.send(this);
                          },
                      set: function(port,maxCurrent){
                           this.payload.port = port;
                           this.payload.enabled = true;    //the UI currently has no way to disable over current protection
                           this.payload.maximum_current = maxCurrent;
                                                  },
                      send: function () { CorePlatformInterface.send(this) },
                      show: function () { CorePlatformInterface.show(this) }
    })

    property var set_cable_loss_compensation:({
                    "cmd":"set_cable_loss_compensation",
                    "payload":{
                        "port":1,                   // 1, 2, 3, ... up to maximum number of ports
                        "output_current":0,         // amps
                        "bias_voltage":0            // Volts
                      },
                      update: function (portNumber, outputCurrent, biasVoltage){
                          this.set(portNumber,outputCurrent,biasVoltage);
                          CorePlatformInterface.send(this);
                          },
                      set: function(portNumber,outputCurrent,biasVoltage){
                           this.payload.port = portNumber;

                           this.payload.output_current = outputCurrent;
                           this.payload.bias_voltage = biasVoltage;
                                                  },
                      send: function () { CorePlatformInterface.send(this) },
                      show: function () { CorePlatformInterface.show(this) }
    })

    property var set_power_negotiation:({
                    "cmd":"set_power_negotiation",
                    "payload":{
                    "negotiation_type":"dynamic",    // or firstComeFirstServed or priority
                      },
                      update: function (type){
                          this.set(type);
                          CorePlatformInterface.send(this);
                          },
                      set: function(type){
                           this.payload.negotiation_type = type;
                           },
                      send: function () { CorePlatformInterface.send(this) },
                      show: function () { CorePlatformInterface.show(this) }
    })

    property var set_sleep_mode:({
                    "cmd":"set_sleep_mode",
                    "payload":{
                        "mode":"manual",    // or automatic
                      },
                      update: function (mode){
                          this.set(mode);
                          CorePlatformInterface.send(this);
                          },
                      set: function(mode){
                           this.payload.mode = mode;
                           },
                      send: function () { CorePlatformInterface.send(this) },
                      show: function () { CorePlatformInterface.show(this) }
    })

    property var set_manual_sleep_mode:({
                    "cmd":"set_manual_sleep_mode",
                    "payload":{
                        "mode":"on",    // or off
                      },
                      update: function (mode){
                          this.set(mode);
                          CorePlatformInterface.send(this);
                          },
                      set: function(mode){
                           this.payload.mode = mode;
                           },
                      send: function () { CorePlatformInterface.send(this) },
                      show: function () { CorePlatformInterface.show(this) }
    })

    property var set_maximum_board_power:({
                    "cmd":"set_maximum_board_power",
                    "payload":{
                        "watts":0      // value between 30 and 200
                      },
                      update: function (inPower){
                          console.log("setting max power to ",inPower);
                          this.set(inPower);
                          CorePlatformInterface.send(this);
                          },
                      set: function(power){
                           this.payload.watts = power;
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
    //
    Connections {
        target: coreInterface
        onNotification: {
            if (!payload.includes("request_usb_power_notification")){
                console.log("**** Notification",payload);
            }
            CorePlatformInterface.data_source_handler(payload)
        }
    }




    /*    // DEBUG - TODO: Faller - Remove before merging back to Dev
    Window {
        id: debug
        visible: true
        width: 200
        height: 200

        // This button sends 2 notifications in 1 JSON, future possible implementation
        Button {
            id: button1
            text: "send pi_stats and voltage"
            onClicked: {
                CorePlatformInterface.data_source_handler('{
                                        "input_voltage_notification": {
                                            "vin": '+ (Math.random()*5+10).toFixed(2) +'
                                        },
                                        "pi_stats": {
                                            "speed_target": 3216,
                                            "current_speed": '+ (Math.random()*2000+3000).toFixed(0) +',
                                            "error": -1104,
                                            "sum": -0.01,
                                            "duty_now": 0.67,
                                            "mode": "manual"
                                        }
                                    }')
            }
        }

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

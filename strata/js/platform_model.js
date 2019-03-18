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

.pragma library
.import "platform_selection.js" as PlatformSelection
.import "uuid_map.js" as UuidMap

///////////
//
//  This is a hardcoded list of platforms that will function until HCS can serve this information to UI from PRT and Deployment Portal
//
///////////

//TODO: when CoreInterface makes this obsolete, uncomment populatePlatforms() calls so the CoreInterface list is used (main.qml, sgstatusbar.qml)

var platforms = { "list":
    [
        {
            "on_part_number": "STR-LOGIC-GATES-EVK",
            "verbose_name": "Multi-function Logic Gate with GUI Control",
            "description": "Two individual 7-in-1 logic gates with simple GUI input and output state control/indication.",
            "image": "201.png",
            "application_icons": [
                "computing",
                "consumer"
            ],
            "product_icons": [
                "digital"
            ],
            "available":{
                "documents": true,
                "control": true
                       },
            "class_id": "201",
            "connection": "view"
        },

        {
            "on_part_number": "STR-USBC-2PORT-100W-EVK",
            "verbose_name": "USB Auto 2-Port 100W Source",
            "description": "The 2-Port USB-PD Source showcases ON Semiconductor's broad portfolio of USB-PD power solutions.",
            "image": "202.png",
            "application_icons": [
                "automotive",
                "consumer"
            ],
            "product_icons": [
                "connectivity",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
                       },
            "class_id": "202",
            "connection": "view"
        },

        {
            "on_part_number": "STR-USBC-4PORT-200W-EVK",
            "verbose_name": "USB AC-DC 4-Port 200W Source",
            "description": "The 4-Port USB-PD Source showcases ON Semiconductor's broad portfolio of USB-PD power solutions, including the FUSB307 PD Port Controller, the FUSB252 HV Protection Switch, and the NCP81231 buck controller.",
            "image": "203.png",
            "application_icons": [
                "computing",
                "consumer",
                "powersupply"
            ],
            "product_icons": [
                "ac",
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
                       },
            "class_id": "203",
            "connection": "view"
        },

        {
            "on_part_number": "STR-4LED-SOL-EVAL-EVK",
            "verbose_name": "Multi-solution LED board with GUI Control",
            "description": "Four solution LED Evaluation Board providing high-power buck, boost, and RGB solutions",
            "image": "209.png",
            "application_icons": [
                "automotive",
                "consumer",
                "industrial",
                "ledlighting",
                "whitegoods"
            ],
            "product_icons": [
                "analog",
                "dc",
                "digital",
                "discrete",
                "led"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "209",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCP110-EVK",
            "verbose_name": "NCP110 - 200mA LDO",
            "description": "The STR-NCP110-EVK provides an evaluation kit for the NCP110 series of 200 mA low noise and high PSRR XDFN4 package LDOs.",
            "image": "210.png",
            "application_icons": [
                "computing",
                "consumer",
                "powersupply",
                "wirelessiot"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "210",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCP115-EVK",
            "verbose_name": "NCP115 - 300mA LDO",
            "description": "The STR-NCP115-EVK provides an evaluation kit for the NCP115 series of 300 mA low quiescent current XDFN4 package LDOs.",
            "image": "210.png",
            "application_icons": [
                "computing",
                "consumer",
                "powersupply",
                "wirelessiot"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "211",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCV8163-NCP163-EVK",
            "verbose_name": "NCV8163/NCP163 - 250mA LDO",
            "description": "The STR-NCV8163-NCP163-EVK provides an evaluation kit for the NCV8163 and NCP163 series of 250 mA ultra-low noise and high PSRR XDFN4 package LDOs.",
            "image": "210.png",
            "application_icons": [
                "automotive",
                "computing",
                "consumer",
                "industrial",
                "powersupply"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "214",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCV8170-NCP170-EVK",
            "verbose_name": "NCV8170/NCP170 - 150mA LDO",
            "description": "The STR-NCV8170-NCP170-EVK provides an evaluation kit for the NCV8170 and NCP170 series of 150 mA CMOS ultra-low quiescent current XDFN4 package LDOs.",
            "image": "210.png",
            "application_icons": [
                "automotive",
                "computing",
                "consumer",
                "industrial",
                "powersupply"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "212",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCV6356-EVK",
            "verbose_name": "GUI Controlled NCV6356 5A AOT Step Down Converter",
            "description": "The STR-NCV6356-EVK provides an evaluation kit for the NCV6356 configurable 5.0 A Adaptive-On-Time (AOT) step down converter a with I2C programmable output voltage.",
            "image": "notFound.png",
            "application_icons": [
                "automotive",
                "computing",
                "consumer",
                "industrial",
                "powersupply"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "215",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCV6357-EVK",
            "verbose_name": "GUI Controlled NCV6357 5A AOT Step Down Converter",
            "description": "The STR-NCV6357-EVK provides an evaluation kit for the NCV6357 configurable 5.0 A Adaptive-On-Time (AOT) step down converter a with I2C programmable output voltage.",
            "image": "notFound.png",
            "application_icons": [
                "automotive",
                "computing",
                "consumer",
                "industrial",
                "powersupply"
            ],
            "product_icons": [
                "analog",
                "dc",
                "discrete"
            ],
            "available":{
                "documents": true,
                "control": true
            },
            "class_id": "216",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCP3231-EVK",
            "verbose_name": "NCP3231 18V INPUT, 25A SWITCHER",
            "description": "Voltage mode, synchronous buck converter, which operates from 4.5V to 18 Vin and generates outputs as lows as 0.6V at 25A of continuous current",
            "image": "207.png",
            "application_icons": [
                "computing",
                "industrial",
                "networkingtelecom",
                "powersupply"
            ],
            "product_icons": [
                "dc",
                "analog"
            ],
            "available":{
                "documents": false,
                "control": false
            },
            "class_id": "207",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCP3232N-EVK",
            "verbose_name": "NCP3232N 21V INPUT, 15A SWITCHER",
            "description": "Voltage mode, synchronous buck converter, which operates from 4.5V to 21 Vin and generates outputs as lows as 0.6V at 15A of continuous current",
            "image": "207.png",
            "application_icons": [
                "computing",
                "industrial",
                "networkingtelecom",
                "powersupply"
            ],
            "product_icons": [
                "dc",
                "analog"
            ],
            "available":{
                "documents": false,
                "control": false
            },
            "class_id": "207",
            "connection": "view"
        },

        {
            "on_part_number": "STR-NCP3235-EVK",
            "verbose_name": "NCP3235 23V INPUT, 15A SWITCHER",
            "description": "Voltage mode, synchronous buck converter, which operates from 4.5V to 23 Vin and generates outputs as lows as 0.6V at 15A of continuous current",
            "image": "207.png",
            "application_icons": [
                "computing",
                "industrial",
                "networkingtelecom",
                "powersupply"
            ],
            "product_icons": [
                "dc",
                "analog"
            ],
            "available":{
                "documents": false,
                "control": false
            },
            "class_id": "207",
            "connection": "view"
        },

           // Listed as Demo in most recent docs sent to me by Oatman
//        {
//            "on_part_number": "STR-NCP171-EVK",
//            "verbose_name": "NCP171 - 80mA Dual Power Mode LDO",
//            "description": "The STR-NCP171-EVK provides an evaluation kit for the NCP171 series of 80 mA dual mode XDFN4 package LDOs.",
//            "image": "210.png",
//            "application_icons": [
//                "computing",
//                "consumer",
//                "powersupply"
//            ],
//            "product_icons": [
//                "analog",
//                "dc",
//                "discrete"
//            ],
//            "available":{
//                "documents": false,
//                "control": false
//            },
//            "class_id": "217",
//            "connection": "view"
//        },

        {
            "on_part_number": "STR-SENSORS-EVK",
            "verbose_name": "Touch, Proximity, Light and Temperature Sensors",
            "description": "Evaluate the portfolio of various sensors used for touch or proximity detection, ambient light, and thermal detection.",
            "image": "notFound.png",
            "application_icons": [
                "consumer",
                "industrial",
                "whitegoods",
                "wirelessiot"
            ],
            "product_icons": [
                "connectivity",
                "digital",
                "sensor"
            ],
            "available":{
                "documents": false,
                "control": false
            },
            "class_id": "213",
            "connection": "view"
        },

//        {   // Platform is not publicly available
//            "on_part_number": "STR-VORTEX-FOUNTAIN-DEMO",
//            "verbose_name": "Vortex Fountain Motor Platform Demo",
//            "description": "This demo uses sensor-less 3 phase BLDC motor controller LV8907 to drive the pump which creates a water voretx and is lit with color mixing LEDs driven by CAT9532.",
//            "image": "204.png",
//            "application_icons": [
//                "consumer",
//                "industrial",
//                "ledlighting",
//                "motorcontrol",
//                "powersupply"
//            ],
//            "product_icons": [
//                "dc",
//                "digital",
//                "discrete",
//                "led"
//            ],
//            "available":{
//                "documents": false,
//                "control": false
//                       },
//            "class_id": "204",
//            "connection": "view"
//        },

//        {
//            "on_part_number": "STR-Strata",
//            "verbose_name": "Example Platform",
//            "description": "This example platform is just a template that keeps a record of all the available icons and also show a 'coming soon' platform",
//            "image": "notFound.png",
//            "application_icons": [
//                "automotive",
//                "computing",
//                "consumer",
//                "industrial",
//                "ledlighting",
//                "medical",
//                "militaryaerospace",
//                "motorcontrol",
//                "networkingtelecom",
//                "powersupply",
//                "whitegoods",
//                "wirelessiot"
//            ],
//            "product_icons": [
//                "ac",
//                "analog",
//                "audio",
//                "connectivity",
//                "dc",
//                "digital",
//                "discrete",
//                "esd",
//                "imagesensors",
//                "infrared",
//                "led",
//                "mcu",
//                "memory",
//                "optoisolator",
//                "pm",
//                "sensor",
//                "video"
//            ],
//            "available":{
//                "documents": false,
//                "control": false
//            },
//            "class_id": "209",
//            "connection": "view"
//        }
    ]
}


var cachedShortCircuitDocuments
var cachedShortCircuitControl

function shortCircuit (platform_list_json) {
    try {
        var platform_list = JSON.parse(platform_list_json)
        var connected = false
        for (var i = 0; i < platform_list.list.length; i ++){
            var class_idPattern = new RegExp('^[0-9]{3,10}$');
            var class_id = String(platform_list.list[i].class_id);
            if (class_idPattern.test(class_id) && class_id !== "undefined" && UuidMap.uuid_map.hasOwnProperty(class_id) && platform_list.list[i].connection === "connected") {
                // for every connected listing in plat_list (should only be 1), and check against platformListModel for match, and update the model entry to connected
                for (var j = 0; j < PlatformSelection.platformListModel.count; j ++) {
                    if (platform_list.list[i].class_id === PlatformSelection.platformListModel.get(j).class_id ) {

                        PlatformSelection.platformListModel.currentIndex = j
                        PlatformSelection.platformListModel.get(j).connection = "connected"

                        // cache old hard-coded model values
                        cachedShortCircuitDocuments = PlatformSelection.platformListModel.get(j).available.documents
                        cachedShortCircuitControl = PlatformSelection.platformListModel.get(j).available.control
                        PlatformSelection.platformListModel.get(j).available = {
                            "documents": true,
                            "control": true
                        }
                        PlatformSelection.platformListModel.selectedClass_id = platform_list.list[i].class_id
                        PlatformSelection.platformListModel.selectedName = UuidMap.uuid_map[class_id]
                        PlatformSelection.platformListModel.selectedConnection = platform_list.list[i].connection
                        connected = true
                    }
                }

                if (!connected) {
                    // In scenario where hardcoded platform doesn't exist (ie motor vortex is unlisted on purpose), create entry for it
                    var platform_info = {
                        "verbose_name" : "Unlisted Platform: " + platform_list.list[i].name,
                        "name" : UuidMap.uuid_map[class_id],
                        "connection" : "connected",
                        "class_id" : platform_list.list[i].class_id,
                        "on_part_number": "",
                        "description": "Unlisted platform was connected, with class_id: " + platform_list.list[i].class_id,
                        "image": "notFound.png",
                        "available": { "control": true, "documents": true }
                    }

                    cachedShortCircuitDocuments = false
                    cachedShortCircuitControl = false

                    PlatformSelection.platformListModel.selectedClass_id = platform_info.class_id
                    PlatformSelection.platformListModel.selectedName = platform_info.name
                    PlatformSelection.platformListModel.selectedConnection = platform_info.connection

                    PlatformSelection.platformListModel.append(platform_info)
                    PlatformSelection.platformListModel.currentIndex = (PlatformSelection.platformListModel.count - 1)

                    connected = true
                }
                break;
            }
        }
        // if no connected platforms were detected, find previously connected plaform and reset its statuses
        if (!connected) {
            for (var k = 0; k < PlatformSelection.platformListModel.count; k ++){
                if (PlatformSelection.platformListModel.get(k).connection === "connected") {
                    // restore cached values
                    PlatformSelection.platformListModel.get(k).available = {
                        "documents": cachedShortCircuitDocuments,
                        "control": cachedShortCircuitControl
                    }
                    PlatformSelection.platformListModel.get(k).connection = "view"
                    break;
                }
            }
            PlatformSelection.deselectPlatform()
        } else {
            PlatformSelection.sendSelection()
        }
    } catch(err) {
        console.log("SHORTCIRCUIT error:", err.toString())
        PlatformSelection.platformListModel.clear()
        PlatformSelection.platformListModel.append({ "verbose_name" : "Error! No platforms available" })
    }
}

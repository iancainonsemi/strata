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
.import QtQuick 2.0 as QtQuickModule
.import "metrics.js" as Metrics
.import "uuid_map.js" as UuidMap

/*
    Data that will likely be needed for platform views
*/
var context = {
    "user_id" : "",
    "class_id" : "",
    "is_logged_in" : false,
    "platform_state" : ""
}

/*
  Mapping of verbose_name to file directory structure.
*/
var screens = {
    LOGIN_SCREEN: "qrc:/SGLoginScreen.qml",
    WELCOME_SCREEN : "qrc:/SGWelcome.qml",
    CONTENT_SCREEN : "qrc:/Content.qml",
    STATUS_BAR: "qrc:/SGStatusBar.qml"
}

/*
  All states handled by navigation_state_
*/
var states = {
    UNINITIALIZED: 1,       // Init() has not been called
    LOGIN_STATE: 2,         // User needs to login
    CONTROL_STATE: 3,       // Platform is connected and we are ready for control
}

/*
    All events to handle by navigation state machine
*/
var events = {
    PROMPT_LOGIN_EVENT:             1,
    LOGIN_SUCCESSFUL_EVENT:         2,
    LOGOUT_EVENT:                   3,
    PLATFORM_DISCONNECTED_EVENT:    4,
    SHOW_CONTROL_EVENT:             5,
    OFFLINE_MODE_EVENT:             6,
    NEW_PLATFORM_CONNECTED_EVENT:   7,
    TOGGLE_CONTROL_CONTENT:         8,
    SHOW_CONTROL:                   9,
    SHOW_CONTENT:                   10,
}

/*
 Navigation Members
*/
var navigation_state_ = states.UNINITIALIZED
var control_container_ = null
var content_container_ = null
var status_bar_container_ = null
var flipable_parent_= null

/*
    Retrieve the qml file in the templated file structure
*/
var PREFIX = "qrc:/views/"
function getQMLFile(class_id, filename) {

    // eventually dirname should === class_id and this UUIDmap will be unnecessary
    var dir_name = UuidMap.uuid_map[class_id]
    //console.log(class_id, "-", filename, "qml file requested.")

    // Build the file name - ./view/<class_id>/filename.qml
    if (filename.search(".qml") < 0){
        //console.log("adding extension to filename: ", filename)
        filename = filename + ".qml"
    }

    var qml_file_name = PREFIX + dir_name + "/" + filename
    console.log("Locating at ", qml_file_name)

    return qml_file_name
}

/*
  Navigation must be initialized with parent container
  that will hold control views
*/
function init(flipable_parent, control_parent, content_parent, bar_parent)
{
    // Create metrics object to track usage
    Metrics.init(context)

    flipable_parent_    = flipable_parent
    control_container_ = control_parent
    content_container_ = content_parent
    status_bar_container_ = bar_parent
    updateState(events.PROMPT_LOGIN_EVENT)
}

/*
  Dynamically load qml controls by qml filename
*/
function createView(name, parent)
{
    //console.log("createView: name =", name, ", parameters =", JSON.stringify(context))

    var component = Qt.createComponent(name, QtQuickModule.Component.PreferSynchronous, parent);

    if (component.status === QtQuickModule.Component.Error) {
        console.log("ERROR: Cannot createComponent(", name, "), parameters=", JSON.stringify(context));
        console.log("errString: ", component.errorString())
    }

    /*
        In some cases we have 'indestructible' children.
        This seems to occur when a qml is being loaded and while executing tries to destroy itself.
        Having auto selection enabled on the WelcomeScreen will cause this scenario. Catch the error here
        output an error. When it errors the child will eventually get destroyed on subsequent view creation
        TODO: Modify autoselect so it doesn't try to destroy itself on load.
    */
    try {
        // Remove children from container before creating another instance
        removeView(parent)
    }
    catch(err){
        console.log("ERROR: Could not destroy child")
    }

    var object = component.createObject(parent,context)
    if (object === null) {
        console.log("Error creating object: name=", name, ", parameters=", JSON.stringify(context));
    }

    return object;
}

/*
  Remove children from a container
*/
function removeView(parent)
{
    if (parent.children.length > 0){
        //console.log("Destroying view")
        for (var x in parent.children){
            parent.children[x].destroy()
        }
    }
}

/*
  A catch-all for events that are required to be handled for default event behaviors
  or handle events that were not caught in the main state machine handler
*/
function globalEventHandler(event,data)
{

    switch(event)
    {
    case events.PROMPT_LOGIN_EVENT:
        //console.log("Updated state to Login:", states.LOGIN_STATE)
        navigation_state_ = states.LOGIN_STATE

        // Update both containers
        removeView(content_container_)
        createView(screens.LOGIN_SCREEN, control_container_)

        // Remove StatusBar at Login
        removeView(status_bar_container_)
        status_bar_container_.visible = false
        break;

    case events.LOGOUT_EVENT:
        updateState(events.SHOW_CONTROL)

        context.is_logged_in = false;
        context.user_id = ""

        removeView(content_container_)
        removeView(control_container_)

        // Set login state before disconnect event, so global event happens, not control_state version
        navigation_state_ = states.LOGIN_STATE
        updateState(events.PLATFORM_DISCONNECTED_EVENT)

        // Show Login Screen
//        console.log("Logging user out. Displaying Login screen")
        updateState(events.PROMPT_LOGIN_EVENT)
        break;

    case events.NEW_PLATFORM_CONNECTED_EVENT:
        // Cache platform name until we are ready to view
        //console.log("Platform connected. Caching platform: ", data.class_id)
        context.class_id = data.class_id
        context.platform_state = true;
        break;

    case events.PLATFORM_DISCONNECTED_EVENT:
        // Disconnected
//        console.log("Platform disconnected in global event handler")
        context.class_id = "";
        context.platform_state = false;
        break;

    default:
        console.log("Unhandled signal, ", event, " in state ", navigation_state_)
        break;
    }
}

/*
  Navigator state machine event handler with no data
*/
function updateState(event)
{
    updateState(event,null)
}

/*
  Main state machine event handler.
  Any navigation request must use this function to attempt a navigation change.
  This includes SGXXX.qml as well as the platform specific Control/Content.qmls
  This state machine determines what is shown (or not shown) on the:
  1. Statusbar container
  2. Flipable Control container
  3. Flipable Content container
*/
function updateState(event, data)
{
    //console.log("Received event: ", event)

    switch(navigation_state_){
        case states.UNINITIALIZED:
            switch(event)
            {

            default:
                globalEventHandler(event,data)
            break;
            }

        break;

        case states.LOGIN_STATE:
            switch(event)
            {
            case events.LOGIN_SUCCESSFUL_EVENT:
                context.user_id = data.user_id
                context.is_logged_in = true;

                // Update StatusBar
                status_bar_container_.visible = true
                var statusBar = createView(screens.STATUS_BAR, status_bar_container_)

                // Update Control by next state
                navigation_state_ = states.CONTROL_STATE
                updateState(events.SHOW_CONTROL_EVENT,null)

                 // Populate platforms only after all UI components are complete
                statusBar.loginSuccessful()
            break;

            default:
                globalEventHandler(event,data)
            break;

            }
        break;
        case states.CONTROL_STATE:
            switch(event)
            {
            case events.SHOW_CONTROL_EVENT:
                // Refresh Control View based on conditions
                if (context.platform_state){
                    // Show control when connected
                    var qml_control = getQMLFile(context.class_id, "Control")
                    createView(qml_control, control_container_)

                    // Restart timer of control
                    Metrics.restartTimer()
                }
                else {
                    // Disconnected; Show detection page
                    createView(screens.WELCOME_SCREEN, control_container_)
                }

                // Show content when we have a platform clasS_id; doesn't have to be actively connected
                if(context.class_id !== ""){
                    var qml_content = getQMLFile(context.class_id, "Content")
                    var contentObject = createView(qml_content, content_container_)

                    // Insert Listener
                    Metrics.injectEventToTree(contentObject)
                    Metrics.restartTimer()
                }
                else {
                    // Otherwise; no platform has been connected or chosen
                    removeView(content_container_)
                }
                break;

            case events.NEW_PLATFORM_CONNECTED_EVENT:
                // Cache platform name until we are ready to view
                console.log("new platform connected data:", data.class_id)
                context.class_id = data.class_id
                context.platform_state = true;
                // Refresh
                updateState(events.SHOW_CONTROL_EVENT)
                break;

            case events.PLATFORM_DISCONNECTED_EVENT:
                context.platform_state = false;
                context.class_id = "";
                // Refresh
                updateState(events.SHOW_CONTROL_EVENT)
                break;

            case events.OFFLINE_MODE_EVENT:
                // Offline mode just keeps platform_state as false
                console.log("Entering offline mode for ", data.class_id)
                context.class_id = data.class_id
                context.platform_state = false;
                updateState(events.SHOW_CONTROL_EVENT)
                break;

            case events.TOGGLE_CONTROL_CONTENT:
                // Send request to metrics service when entering and leaving platform control view
                var pageName = '';
                if(flipable_parent_.flipped===false){
                    console.log("In flipable ",context.class_id)
                    pageName = context.class_id +' Control'
                }else {
                    var currentTabName = Metrics.getCurrentTab()
                    pageName = context.class_id +' '+ currentTabName
                }

                Metrics.sendMetricsToCloud(pageName)

                // Flip to show control/content
                flipable_parent_.flipped = !flipable_parent_.flipped

                break;

            case events.SHOW_CONTROL:
                if (flipable_parent_.flipped) {
                    updateState(events.TOGGLE_CONTROL_CONTENT)
                }
                break;

            case events.SHOW_CONTENT:
                if (!flipable_parent_.flipped) {
                    updateState(events.TOGGLE_CONTROL_CONTENT)
                }
                break;

            default:
                globalEventHandler(event,data)
            break;
            }
        break;

        default:
            globalEventHandler(event,data)
            break;
    }
}

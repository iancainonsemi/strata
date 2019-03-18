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
.import "navigation_control.js" as NavigationControl

var window
var current_class_id
var current_tour_targets
var tour_running = false
var tour_count = 0
var internal_tour_index
var views = [ ]

/*******
   Including help library:
        import "qrc:/js/help_layout_manager.js" as Help

   API for adding help tour targets (stops on a help tour) in Component.onCompleted:
        Help.registerTarget(Target, "Description", Index Number, "nameOfHelpTour")
   Example: Help.registerTarget(startButton, "this button starts the motor", 0, "motorVortexHelp")

   API for starting the tour when help icon is clicked:
        Help.startHelpTour("nameOfHelpTour")
   Example:  Help.startHelpTour("motorVortexHelp")
*******/

// Runs up to 2 help views: 1 for Strata, and 1 for the current plaform listed in nav_control
// Each view can run any number of help tours, assuming their names are unique to that view

function registerTarget(helpTarget, targetDescription, index, tourName) {
    var class_id

    if (NavigationControl.context.class_id === "") {
        // strata help registers before any platforms are connected
        class_id = "strataMain"
    } else {
        class_id = NavigationControl.context.class_id
    }

    var tourIndices = null;

    if (current_class_id !== class_id) {
        // incoming target registration belongs to new class_id, needs new tour initialized

        if (views.length >1) {
            // new class_id is replacing a disconnected platform (strataMain is views[0]); older help needs to be removed
            // console.log("Deleting previous help", current_class_id, class_id, views.length)
            killView(1)
        }

        // console.log("CREATING HELP VIEW and TOUR", class_id, tourName)
        current_class_id = class_id
        tourIndices = createView(class_id, tourName)
    } else {
        // find view and tour to append target to
        tourIndices = locateTour(class_id, tourName)
    }

    var tourTargetList = views[tourIndices[0]].view_tours[tourIndices[1]].tour_targets

    var component = Qt.createComponent("qrc:/statusbar-partial-views/help-tour/SGPeekThroughOverlay.qml");
    var tourStop = component.createObject(window);
    tourStop.index = index
    tourStop.description = targetDescription
    var tourTarget = {"index": index, "target": helpTarget, "description": targetDescription, "helpObject": tourStop}

    for (var i=0; i<tourTargetList.length; i++) {
        if (tourTargetList[i].index === index) {
            // update tourTarget if it already exists (occurs when same platform disconnected and reconnected - must update object references)
            tourTargetList[i] = tourTarget
            return
        }
    }

    // otherwise append as new target
    tourTargetList.push(tourTarget)
}

function createView(class_id, tourName) {
    var view = {
        "view_id": class_id,
        "view_tours" : [
            {
                "tour_name": tourName,
                "tour_targets": []
            }
        ]
    }
    views.push(view)
    return [views.length-1, 0]
}

function createTour(viewNumber, tourName) {
    var tour = {
        "tour_name": tourName,
        "tour_targets": []
    }
    views[viewNumber].view_tours.push(tour)
    return views[viewNumber].view_tours.length-1
}

function locateTour(class_id, tourName) {
    for (var i=0; i<views.length; i++) {
        if (views[i].view_id === class_id) {
            for (var j=0; j<views[i].view_tours.length; j++) {
                if (views[i].view_tours[j].tour_name === tourName) {
                    return [i, j]
                }
            }
            // create tour in view if view found, but no tour found
            // console.log("CREATING TOUR", tourName, "for VIEW", current_class_id)
            var newTourIndex = createTour(i, tourName)
            return [i, newTourIndex]
        }
    }
    return [null, null]
}

function startHelpTour(tourName, class_id) {
    if (class_id !== "strataMain") {
        class_id = NavigationControl.context.class_id
    }

    var tourIndices = locateTour(class_id, tourName)

    current_tour_targets = views[tourIndices[0]].view_tours[tourIndices[1]].tour_targets

    // tour_count initializes the x/y tour counter
    tour_count = current_tour_targets.length

    for (var i = 0; i < tour_count; i++){
        if (current_tour_targets[i]["index"] === 0 ) {
            tour_running = true
            internal_tour_index = i
        }
    }

    refreshView(internal_tour_index)
    current_tour_targets[internal_tour_index]["helpObject"].visible = true
}

function next(currentIndex) {
    for (var i = 0; i < current_tour_targets.length; i++){
        if (current_tour_targets[i]["index"] === currentIndex) {
            current_tour_targets[i]["helpObject"].visible = false
            if (current_tour_targets[i]["index"] === tour_count - 1) { //if last, end tour
                tour_running = false
                break
            }
        } else if (current_tour_targets[i]["index"] === currentIndex+1) {
            refreshView(i)
            current_tour_targets[i]["helpObject"].visible = true
            internal_tour_index = i
        }
    }
}

function prev(currentIndex) {
    if (currentIndex > 0) {
        for (var i = 0; i < current_tour_targets.length; i++){
            if (current_tour_targets[i]["index"] === currentIndex) {
                current_tour_targets[i]["helpObject"].visible = false
            } else if (current_tour_targets[i]["index"] === currentIndex-1) {
                refreshView(i)
                current_tour_targets[i]["helpObject"].visible = true
                internal_tour_index = i
            }
        }
    }
}

function closeTour() {
    current_tour_targets[internal_tour_index]["helpObject"].visible = false
    tour_running = false
}

function registerWindow(windowTarget) {
    window = windowTarget.contentItem
    windowTarget.widthChanged.connect(liveResize)
    windowTarget.heightChanged.connect(liveResize)
}

function refreshView (i) {
     // set the target sizing on load
    current_tour_targets[i]["helpObject"].setTarget(current_tour_targets[i]["target"], window);
}

function liveResize() {
    // refresh the target sizing on window resize
    if (tour_running) {
        current_tour_targets[internal_tour_index]["helpObject"].setTarget(current_tour_targets[internal_tour_index]["target"], window);
    }
}

function destroyHelp() {
    // only called on strata destruction, remove all dynamically created objects
    for (var i=views.length-1; i>=0; i--) {
        killView(i)
    }
}

function killView(index) {
    for (var i=0; i<views[index].view_tours.length; i++) {
//        console.log("Destroying", views[index].view_tours[i].tour_name)
        for (var j=0; j<views[index].view_tours[i].tour_targets.length; j++) {
            views[index].view_tours[i].tour_targets[j].helpObject.destroy()
        }
    }
    views.pop()
}

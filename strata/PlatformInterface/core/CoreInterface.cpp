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

//----
// Core Framework
//
// WARNING : DO NOT EDIT THIS FILE UNLESS YOU ARE ON THE CORE FRAMEWORK TEAM
//
//  Platform Implementation is done in PlatformInterface/platforms/<type>/PlatformInterface.h/cpp
//
//

#include <PlatformInterface/core/CoreInterface.h>

using namespace std;
using namespace Spyglass;

CoreInterface::CoreInterface(QObject *parent) : QObject(parent)
{
    //qDebug() << "CoreInterface::CoreInterfaceQObject *parent) : QObject(parent) CTOR\n";

    hcc = new HostControllerClient;

    // [TODO] [prasanth] : need to be added in a better place
    // json command to ask the list of available platforms from hcs
    registerClient();

    // --------------------
    // Core Framework
    // install main notification notification handlers
    //
    // Main sources:
    // "notification"           // platform devices
    // "cloud::notification"    // cloud notifications
    //
    // from platform TODO [ian] make namespaced platform::notification
    registerNotificationHandler("notification",
                                bind(&CoreInterface::platformNotificationHandler,
                                     this, placeholders::_1));

    registerNotificationHandler("hcs::notification",
                                bind(&CoreInterface::platformListHandler,
                                     this, placeholders::_1));

    registerNotificationHandler("remote::notification",
                                bind(&CoreInterface::remoteSetupHandler,
                                     this, placeholders::_1));

    registerNotificationHandler("cloud::notification",
                                bind(&CoreInterface::cloudNotificationHandler,
                                     this, placeholders::_1));

    registerNotificationHandler("platform_id",
                                bind(&CoreInterface::platformIDNotificationHandler,
                                     this, placeholders::_1));

    registerNotificationHandler("platform_connection_change_notification",
                                bind(&CoreInterface::connectionChangeNotificationHandler,
                                     this, placeholders::_1));

    platform_state_ = false;
    notification_thread_running_ = false;
    notification_thread_= std::thread(&CoreInterface::notificationsThread,this);

}

CoreInterface::~CoreInterface()
{
    //qDebug() << "CoreInterface::~CoreInterface() DTOR\n";

    hcc->notificationSocket->close();
    hcc->sendCmdSocket->close();
    zmq_term(hcc->context);
    delete(hcc);
    notification_thread_.detach();
}

// @f notificationsThreadHandle
// @b main dispatch thread for notifications from Host Controller Service
//
//
void CoreInterface::notificationsThread()
{
    //qDebug () << "CoreInterface::notificationsThread - notification handling.";
    notification_thread_running_ = true;

    while(notification_thread_running_) {
        // Notification Message Architecture
        //
        //    {
        //        "notification": {
        //            "value": "platform_connection_change_notification",
        //            "payload": {
        //                "status": "disconnected"
        //            }
        //        }
        //    }
        //
        //    {
        //        "cloud::notification": {
        //        "type": "document",
        //        "name": "schematic",
        //        "documents": [
        //              {"data": "*******","filename": "schematic1.png"},
        //              {"data": "*******","filename": "schematic1.png"}
        //        ]
        //        }
        //   }
        //

        // TODO [ian] need to avoid uneeded std::string to QString conversion
        // TODO [ian] need to error check/validate json messages
        string message = hcc->receiveNotification();  // Host Controller Service

        QString n(message.c_str());



        // Debug; Some messages are too long to print (ex: cloud images)
        if (n.length() < 500) {
          qDebug() <<"[recv]" << n;
          emit pretendMetrics(n); // TODO: remove this (see pretendMetrics in CoreInterface.H)
        } else {
          qDebug() <<"[recv] Unprinted: Long Data Message Over 500 Chars";
          emit pretendMetrics("Cloud file download, over 500 chars"); // TODO: remove this (see pretendMetrics in CoreInterface.H)
        }

        QJsonDocument doc = QJsonDocument::fromJson(n.toUtf8());
        if(doc.isNull()) {
            // TODO [ian] fix the "ONSEMI" message from fouling up all this
            //qCritical()<<"ERROR: void CoreInterface::notificationsThreadHandle()."
            //             "Failed to create JSON doc. message=" << n.toStdString().c_str();
            continue;
        }

        QJsonObject notification_json = doc.object();
        if(notification_json.isEmpty() ) {
            qCritical()<<"ERROR: void CoreInterface::notificationsThreadHandle():"
                         "JSON is empty.";
            continue;
        }

        //[TODO: ack responses to setting a parameter have both an "ack" and a "payload", which generates an error here. How should that be fixed?]
        QStringList keys = notification_json.keys();
        if( keys.size() != 1 ) {
            //qCritical()<<"ERROR: void CoreInterface::notificationsThreadHandle():"
            //             " More then one key in notification message. Violates message architecture.";
            continue;
        }

        QString notification(keys.at(0)); // top level JSON keys

        auto handler = notification_handlers_.find(notification.toStdString());
        if( handler == notification_handlers_.end()) {
            qCritical("CoreInterface::notificationsThreadHandle()"
                      " ERROR: no handler exits for %s !!", notification.toStdString().c_str ());
            continue;
        }

        // dispatch handler for notification
        handler->second(notification_json[notification].toObject());
    }
}

// ---
// Core Framework Infrastructure Notification Handlers
//
void CoreInterface::platformIDNotificationHandler(QJsonObject payload)
{
    if (payload.contains("platform_id")) {
        QString platform_id = payload["platform_id"].toString();
        //qDebug() << "Received platform_id = " << platform_id;

        if(platform_id_ != platform_id ) {
            platform_id_ = platform_id;
            emit platformIDChanged(platform_id_);

            // also update platform connected state
            platform_state_ = true;
            emit platformStateChanged(platform_state_);
        }
    }
}

void CoreInterface::connectionChangeNotificationHandler(QJsonObject payload)
{
    QString state = payload["status"].toString();
    //qDebug() << "platform_state = " << state;

    if( state == "connected" ) {
        platform_state_ = true;
        emit platformStateChanged(platform_state_);
    }
    else {
        platform_state_ = false;
        platform_list_ = "{}";
        emit platformStateChanged(platform_state_);
    }
}

// @f platformNotificationHandler
// @b handle platform notifications
//
//  TODO [ian] change "value" to "name" of notification message
//    {
//        "notification": {
//            "value": "platform_connection_change_notification",
//            "payload": {
//                "status": "disconnected"
//            }
//        }
//    }

void CoreInterface::platformNotificationHandler(QJsonObject payload)
{
    //qDebug("ImplementationInterfaceBinding::platformmNotificationHandler: CALLED");

    if( payload.contains("value") == false ) {
        qCritical("CoreInterface::platformNotificationHandler()"
                  " ERROR: no name for notification!!");
        return;
    }

    if( payload.contains("payload") == false ) {
        qCritical("CoreInterface::platformNotificationHandler()"
                  " ERROR: no payload for notification!!");
        return;
    }

    QString value = payload["value"].toString();
    auto handler = notification_handlers_.find(value.toStdString());
    if( handler == notification_handlers_.end()) {
        QJsonDocument doc(payload);
        emit notification( doc.toJson(QJsonDocument::Compact));
        return;
    }

    handler->second(payload["payload"].toObject());
    QJsonDocument doc(payload);
    emit notification( doc.toJson(QJsonDocument::Compact));


}

// @f initialHandshakeHandler
// @b handle initial list of platform message
//
//    {
//        "handshake":
//          "list":[{
//            "verbose":"simulated-usb-pd",
//            "uuid":"P2.2017.1.1.0.0.cbde0519-0f42-4431-a379-caee4a1494af",
//             "remote":false
//            }
//        ]
//    }

void CoreInterface::platformListHandler(QJsonObject payload)
{
    QJsonDocument testdoc(payload);
    QString strJson_list(testdoc.toJson(QJsonDocument::Compact));

    if( platform_list_ != strJson_list ) {
        platform_list_ = strJson_list;
        //qDebug() << "initialHandshakeHandler: platform_list:" << platform_list_;
        emit platformListChanged(platform_list_);
    }
}


// @f remoteSetupHandler
// @b handles the messages required for remote connection
// advertise_platforms - gets the hcs token required for connection
// get_platforms - TO indicate if the hcs token entered is valid
void CoreInterface::remoteSetupHandler(QJsonObject payload)
{
    if( payload.contains("value") == false ) {
        qCritical("CoreInterface::platformNotificationHandler()"
                  " ERROR: no name for notification!!");
        return;
    }

    if( payload.contains("payload") == false ) {
        qCritical("CoreInterface::platformNotificationHandler()"
                  " ERROR: no payload for notification!!");
        return;
    }
    if(payload["value"].toString()=="advertise_platforms") {
        //qDebug("Parse success");
        bool status = payload["payload"].toObject()["status"].toBool();
        if(status) {
            hcs_token_ = payload["payload"].toObject()["hcs_id"].toString();
            //qDebug()<<hcs_token_;
        }
        else {
            hcs_token_ = "";
        }
        emit hcsTokenChanged(hcs_token_);
    }
    else if(payload["value"].toString()=="get_platforms") {
        //qDebug("Parse success");
        bool status = payload["payload"].toObject()["status"].toBool();
        if(status) {
            //qDebug("Remote response: token valid");
        }
        else {
            //qDebug("Remote response: token invalid");
        }
        emit remoteConnectionChanged(status);
    }
    else if(payload["value"].toString()=="remote_activity") {
        //qDebug("parse success");
        remote_user_activity_ = payload["payload"].toObject()["user_name"].toString();
        emit remoteActivityChanged(remote_user_activity_);
        //qDebug()<<remote_user_activity_;
    }
    else if(payload["value"].toString()=="remote_user_added") {
        //qDebug("parse success");
        remote_user_ = payload["payload"].toObject()["user_name"].toString();
        emit remoteUserAdded(remote_user_);
        //qDebug()<<remote_user_;
    }
    else if(payload["value"].toString()=="remote_user_removed") {
        //qDebug("parse success");
        remote_user_ = payload["payload"].toObject()["user_name"].toString();
        emit remoteUserRemoved(remote_user_);
        //qDebug()<<remote_user_;
    }
    //qDebug()<< payload;
}

// @f sendSelectedPlatform
// @b send the user selected platform to HCS to create the mapping
//
// TOOD connect is a better name
void CoreInterface::sendSelectedPlatform(QString verbose, QString connection_status)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "platform_select");
    cmdMessageObject.insert("platform_uuid",verbose);
    cmdMessageObject.insert("remote",connection_status);

    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    //qDebug()<<"parse to send"<<strJson;
    hcc->sendCmd(strJson.toStdString());
}

// @f sendCommand
// @b send json command to platform
//
void CoreInterface::sendCommand(QString cmd)
{
    hcc->sendCmd(cmd.toStdString());
}

// @f disconnectPlatform
// @b send disconnect command to HCS
//
void CoreInterface::disconnectPlatform()
{
    std::string cmd= "{\"hcs::cmd\":\"disconnect_platform\"}";
    hcc->sendCmd(cmd);
}

// @f registerClient
// @b send initial handshake to receive platform list
//
void CoreInterface::registerClient()
{
    std::string cmd= "{\"cmd\":\"register_client\"}";
    hcc->sendCmd(cmd);
}

// @f unregisterClient
// @b Unregister to remove any notifications from HCS
//
void CoreInterface::unregisterClient()
{
    std::string cmd= "{\"cmd\":\"unregister\"}";
    hcc->sendCmd(cmd);
}

// @f cloudNotificationHandler
// @b handle cloud service notifications
//
//
//  CLOUD JSON STRUCTURE
// {
//   "cloud::notification": {
//     "type": "document",
//     "name": "schematic",
//     "documents": [
//       {"data": "*******","filename": "schematic1.png"},
//       {"data": "*******","filename": "schematic1.png"}
//     ]
//   }
// }
//
// {
//   "cloud::notification": {
//     "type": "marketing",
//     "name": "adas_sensor_fusion",
//     "data": "raw html"
//  }
// }
//
void CoreInterface::cloudNotificationHandler(QJsonObject payload)
{
    // data source type: document_set, chat, marketing et al
    string type = payload.value("type").toString().toStdString();

    auto handler = data_source_handlers_.find(type);
    if( handler == data_source_handlers_.end()) {
        qCritical("CoreInterface::cloudNotification"
                  " ERROR: no handler exits for %s !!", type.c_str ());
        return;
    }

    handler->second(payload);  // dispatch handler for notification

}

bool CoreInterface::registerNotificationHandler(std::string notification, NotificationHandler handler)
{
    //qDebug("CoreInterface::registerNotificationHandler:"
    //          "source=%s", notification.c_str());

    auto search = notification_handlers_.find(notification);
    if( search != notification_handlers_.end()) {
        qCritical("CoreInterface::registerNotificationHandler:"
                  " ERROR: handler already exits for %s !!", notification.c_str ());
        return false;
    }

    notification_handlers_.emplace(std::make_pair(notification, handler));

    return true;
}

bool CoreInterface::registerDataSourceHandler(std::string source, DataSourceHandler handler)
{
    qDebug("CoreInterface::registerDataSourceHanlder:"
              "source=%s", source.c_str());

    auto search = data_source_handlers_.find(source);
    if( search != data_source_handlers_.end()) {
        qCritical("CoreInterface::registerDataSourceHanlder:"
                  " ERROR: handler already exits for %s !!", source.c_str ());
        return false;
    }

    data_source_handlers_.emplace(std::make_pair(source, handler));

    // notify Host Controller Service of the data source connection
    //    {
    //        "db::cmd":"connect_data_source",
    //        "db::payload":{
    //            "type":"documents"
    //        }
    //    }
    //
    QJsonObject cmd;
    QJsonObject payload;

    cmd.insert("db::cmd", "connect_data_source");
    payload.insert("type", source.c_str());
    cmd.insert("db::payload", payload);

    hcc->sendCmd(QString(QJsonDocument(cmd).toJson(QJsonDocument::Compact)).toStdString());
    return true;
}

#if CODE_SNIPPETS
//    auto message = R"(
//                {
//                    "notification": {
//                        "value": "platform_connection_change_notification",
//                        "payload": {
//                            "status": "disconnected"
//                        }
//                    }
//                }
//                )";

//    auto message = R"(
//                {
//                    "cloud::notification": {
//                        "value": "platform_connection_change_notification",
//                        "payload": {
//                            "status": "disconnected"
//                        }
//                    }
//                }
//                )";

//    QString n(message);
//    QJsonDocument doc = QJsonDocument::fromJson(n.toUtf8());
//    if(doc.isNull()){
//        qCritical()<<"ERROR: void ImplementationInterfaceBinding::notificationsThreadHandle(). Failed to create JSON doc.";
//        //continue;
//    }

//    QJsonObject notification_json = doc.object();
//    if(notification_json.isEmpty() ) {
//        qCritical()<<"ERROR: void ImplementationInterfaceBinding::notificationsThreadHandle(): JSON is empty.";
//        //continue;
//    }

//    // get keys from json object. Must only
//    QStringList keys = notification_json.keys();
//    if( keys.size() > 1 ) {
//        qCritical()<<"ERROR: void ImplementationInterfaceBinding::notificationsThreadHandle():"
//                     " More then one key in notification message. Violates message architecture.";
//        //continue;
//    }

//    QString notification(keys.at(0));

//    auto handler = notification_handlers_.find(notification.toStdString());
//    if( handler == notification_handlers_.end()) {
//        qCritical("ImplementationInterfaceBinding::notificationsThreadHandle()"
//                  " ERROR: no handler exits for %s !!", notification.toStdString().c_str ());
//        //return;
//    }
//    handler->second(notification_json);  // dispatch handler for notification
#endif

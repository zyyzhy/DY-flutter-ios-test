import 'package:flutter_app_ios/Common/eventBus/JpushBus.dart';
import 'package:flutter_app_ios/pages/ResultPage.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import '../../main.dart';
class JpushManager{
  static JPush jpush;
   static void initJpush(){
     jpush = new JPush();
     jpush.addEventHandler(
         onReceiveNotification: (Map<String, dynamic> message) async {
           print("flutter onReceiveNotification: $message");

         },
         onOpenNotification: (Map<String, dynamic> message) async {
           print("flutter onOpenNotification: $message");
           eventBus.fire(JPushMessageEvent(message));

        },
         onReceiveMessage: (Map<String, dynamic> message) async {
           print("flutter onReceiveMessage: $message");
         },
         onReceiveNotificationAuthorization: (Map<String, dynamic> message) async {
            print("flutter onReceiveNotificationAuthorization: $message");
        });
     jpush.setup(
       appKey: "077b2c5a5c2df74b677efb87",
       channel: "theChannel",
       production: false,
       debug: true,
     );
     jpush.applyPushAuthority(
         new NotificationSettingsIOS(sound: true, alert: true, badge: true));

     jpush.getRegistrationID().then((rid) {
       print("flutter get registration id : $rid");
     });

   }


}

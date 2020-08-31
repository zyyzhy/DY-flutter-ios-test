import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EventChannelManager {
  static const String EVENT_CHANNEL_NAME = "EventChannelPlugin";
  static EventChannelManager _manager;
  EventChannel _eventChannel;
  Set<StreamSubscription> subsList = Set();

  EventChannelManager._() {
    _eventChannel = EventChannel(EVENT_CHANNEL_NAME);
  }

  factory EventChannelManager.getInstance() {
    if (_manager == null) {
      _manager = EventChannelManager._();
    }
    return _manager;
  }

  void listen({@required void onMsg(var data), void onClose(), void onErr()}) {
    StreamSubscription subscription =
    _eventChannel.receiveBroadcastStream("arg").listen((data) {
      print("oc-flutter的数据---$data");
//      print("flutter-oc的参数---'arg'");
      onMsg(data);
    }, onError: (err) {

      onErr();
    }, onDone: () {

      onClose();
    });

    subsList.add(subscription);
  }

  void dispose() {
    if (subsList.length >= 0) {
      subsList.forEach((sub) {
        sub.cancel();
      });
    }
    subsList.clear();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ios/main.dart';
import 'package:flutter_app_ios/pages/ResultPage.dart';

class MethodChannelManager {
  static const METHOD_CHANNEL_NAME = "MethodChannelPlugin";
  static MethodChannelManager _manager = MethodChannelManager._();
  MethodChannel _channel;

  MethodChannelManager._() {
    _channel = MethodChannel(
      METHOD_CHANNEL_NAME,
    );
    _channel.setMethodCallHandler(handler);
  }

  factory MethodChannelManager.getInstance() {
    return _manager;
  }

  Future invoke({@required String methodName, String args}) {
    /// response = await _methodChannelPlugin.invokeMethod('send', value);
    return _channel.invokeMethod(methodName, args);
  }
  Future<dynamic> handler(MethodCall call) async {
    print("原生传至flutter方法+ ${call.method} + 参数：+${call.arguments}");
    switch (call.method) {
      case "goToFlutterResultPage":
        MyObserve.getNavigator()
            .pushNamed(ResultPage.ROUTER_NAME,);
      return call.method;
        break;
      default:
        return Future.value("no such method");
        break;
    }
  }
}

class MethodTypes {
//  TODO 方法名要和native同步
  static const GOTONATIVE = "goToNative";
  static const CLOSENATIVE = "closeNative";

}

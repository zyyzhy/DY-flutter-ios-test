
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ios/Common/eventBus/JpushBus.dart';
import 'package:flutter_app_ios/main.dart';
import 'package:flutter_app_ios/pages/ListPage.dart';
import 'package:flutter_app_ios/pages/ResultPage.dart';
import 'package:flutter_app_ios/pages/SearchPage.dart';
import 'package:flutter_app_ios/pages/SecondPage.dart';


class HomePage extends StatefulWidget {
  static const ROUTER_NAME = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  EventChannel batteryEventChannel = EventChannel("BatteryEventChannel", const StandardMethodCodec());
  StreamSubscription jPushMsgSubscription;

  String batteryLevel = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    batteryEventChannel
        .receiveBroadcastStream("init")
        .listen(_onEvent, onError: _onError);
    jPushMsgSubscription = eventBus.on<JPushMessageEvent>().listen((value) {
      print(value.message['aps']['alert']['body']);
      MyObserve.getNavigator()
          .pushNamed(ResultPage.ROUTER_NAME,);
    });


  }
  void _onEvent(Object value) {
    batteryLevel = value.toString();
    setState(() {

    });
  }
  // 错误处理
  void _onError(dynamic) {

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    jPushMsgSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body:new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("原生传至flutteriOS平台电量为："+ batteryLevel ,textAlign: TextAlign.center,),
            Container(
              height: 20,
            ),
            Text("跳转至第二页",textAlign: TextAlign.center,),
            RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, SecondPage.ROUTER_NAME);
              },
              child: Text("跳转"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, SearchPage.ROUTER_NAME);
              },
              child: Text("仿京东淘宝历史搜索"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            Container(
              height: 20,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, ListPage.ROUTER_NAME);
              },
              child: Text("列表"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ) ,
    );
  }
}

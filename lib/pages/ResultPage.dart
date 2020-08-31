
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ios/Tools/RoutersJump.dart';



class ResultPage extends StatefulWidget {
  static const ROUTER_NAME = "ResultPage";
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  EventChannel secondEventChannel = EventChannel("SecondEventChannel", const StandardMethodCodec());
  String passingToDart = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondEventChannel
        .receiveBroadcastStream("result")
        .listen(_onEvent, onError: _onError);
  }
  void _onEvent(Object value) {
    passingToDart = value.toString();
    setState(() {

    });
  }
  // 错误处理
  void _onError(dynamic) {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("结果页"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("结果页",textAlign: TextAlign.center,),
            Container(height: 20),
            Text("ocEventChannelToDart:"+ passingToDart,textAlign: TextAlign.center,),
            RaisedButton(
                onPressed: (){
                  NavigatorManager.goHomePage(context);
              },
              child: Text(
                "返回首页",
              ),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            new Container(
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "返回上一级页面",
                ),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

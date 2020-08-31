import 'package:flutter/material.dart';
import 'package:flutter_app_ios/Common/MethodChannelManager.dart';
class SecondPage extends StatefulWidget {
  static const ROUTER_NAME = "SecondPage";
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
        centerTitle: true,
      ),
      body:new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("跳转至第三页",textAlign: TextAlign.center,),
            RaisedButton(
              onPressed: (){
                MethodChannelManager.getInstance()
                    .invoke(methodName: MethodTypes.GOTONATIVE,args: "111111111");
              },
              child: Text("跳转"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),

    );
  }
}

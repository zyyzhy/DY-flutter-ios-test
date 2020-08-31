import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ios/pages/HomePage.dart';

class NavigatorManager{

 static  goHomePage(BuildContext context){
   ///跳转到起始页并关闭所有页面
   Navigator.pushAndRemoveUntil(
       context,
       new MaterialPageRoute(builder: (context) => new HomePage()),
           (route) => route == null);
 }

}
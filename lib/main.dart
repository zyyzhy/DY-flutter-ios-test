import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ios/Common/Jpush/JpushManager.dart';
import 'package:flutter_app_ios/pages/HomePage.dart';
import 'package:flutter_app_ios/pages/ListPage.dart';
import 'package:flutter_app_ios/pages/ResultPage.dart';
import 'package:flutter_app_ios/pages/SearchResultPage.dart';
import 'package:flutter_app_ios/pages/SecondPage.dart';
import 'package:flutter_app_ios/pages/SearchPage.dart';

void main() => runApp(Application());
EventBus eventBus = EventBus();


class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  var routesMap = {
//    先进入首页
       "/": (context) => HomePage(),
    SecondPage.ROUTER_NAME:(context) => SecondPage(),
    ResultPage.ROUTER_NAME:(context) => ResultPage(),
    SearchPage.ROUTER_NAME:(context) => SearchPage(),
    SearchResultPage.ROUTER_NAME:(context) => SearchResultPage(),
    ListPage.ROUTER_NAME:(context) => ListPage(),


  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    JpushManager.initJpush();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            elevation: 1.0,
            brightness: Brightness.light,
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            )
        ),
      ),
      initialRoute: "/",
      routes: routesMap,
      navigatorObservers:[
        MyObserve.getInstance(),
      ],
    );
  }
}
class MyObserve extends NavigatorObserver{
  @override

  static MyObserve _instance;


  MyObserve._();

  factory MyObserve.getInstance() {
    if (_instance == null) {
      _instance = MyObserve._();
    }
    return _instance;
  }

  static NavigatorState getNavigator() {
    return MyObserve.getInstance().navigator;
  }

}


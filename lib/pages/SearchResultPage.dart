
import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  static const ROUTER_NAME = "SearchResultPage";

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索列表"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.arguments),
      ),
    );
  }
}

import 'package:flutter/material.dart';

typedef TapCallBack = void Function(int num);

class TopTabbarButton extends StatefulWidget {
  final double height;
  final Color bgCColor;
  final Color selectedCColor;
  final Color selectedTColor;
  final Color normalTColor;
  final int num;
  final List titleArr;
  var selectedIndex;
  TapCallBack changeClick; //声明函数对象

  TopTabbarButton({Key key,
    @required this.height,
    @required this.bgCColor,
    @required this.selectedCColor,
    @required this.selectedTColor,
    @required this.normalTColor,
    @required this.num,
    @required this.titleArr,
    @required this.selectedIndex,
    @required this.changeClick,
  }) : super(key: key);
  @override
  _TopTabbarButtonState createState() => _TopTabbarButtonState();
}

class _TopTabbarButtonState extends State<TopTabbarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.bgCColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildItem(),
      ),
    );
  }

  List<Widget> buildItem() {
    List<Widget> widgetList = new List();
    for (int i = 0; i < widget.num; i++) {
      widgetList.add(getListItemWidget(i));
    }
    return widgetList;
  }

  Widget getListItemWidget(int i) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5,bottom: 5),
            child: Text(widget.titleArr[i], style: TextStyle(
              fontSize: 16,
              color: widget.selectedIndex == i ? widget.selectedTColor : widget
                  .normalTColor,
              ),
            ),
          ),
           Container(
              width: 40,
              height: 2,
              decoration: BoxDecoration(color: widget.selectedIndex == i ? widget.selectedCColor:widget.bgCColor,
                  borderRadius: BorderRadius.circular(1)),
            ),
        ],
      ),
      onTap: () {
          widget.changeClick(i);
      },
    );
  }
}


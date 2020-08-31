import 'package:flutter/material.dart';
import 'package:flutter_app_ios/Common/PrimaryButton.dart';
import 'package:flutter_app_ios/Common/SearchServices.dart';
import 'package:flutter_app_ios/Common/config/ComStyle.dart';
import 'package:flutter_app_ios/pages/SearchResultPage.dart';

final TextEditingController textEditingController = new TextEditingController();

//- 如果关联了对应的FocusNode， 直接调用focusNode.unfocus()即可
//- 如果没有关联， 直接用 FocusScope.of(context).requestFocus(FocusNode());

class SearchPage extends StatefulWidget {
  static const ROUTER_NAME = "SearchPage";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var keyWords;
  List _historyListData = [];

  final String spreadTitle = "展开";
  bool  spread = false;

  final ScrollController scrollController = new ScrollController();
  FocusNode focusNodeSearch = new FocusNode();

  @override
  void deactivate() {//pop到当前页时
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      _getHistoryData();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHistoryData();
  }

  _getHistoryData() async {
    var _historyListData = await SearchServices.getHistoryList();
    setState(() {
      this._historyListData=_historyListData;
    });
  }


  Widget historySearch(){
    if (_historyListData.length > 0){
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:
                  Container(
                    padding: EdgeInsets.only(left: 15,top: 10),
                    child: Text("历史搜索",style:CusTextStyle.GREY9_14
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15,right:15,top: 10),
                  child: InkWell(
                    onTap: (){
                      SearchServices.removeHistoryList();
                      this._getHistoryData();
                    },
                    child: Image.asset( "static/images/delete.png",),
                  ),
                )
              ],
            ),
           Container(
             child:Wrap(
              children: wrapTag(),
             ),
           ),
          ],
        ),
      );
    } else{
      return Text("");
    }
  }
  List<Widget> wrapTag() {

    List<Widget> widgetList = new List();

    if (_historyListData.length > 8 && spread == false){
      for (int i = 0; i < 7; i++) {
        widgetList.add(PrimaryTag(
          text: _historyListData[i],
          onPressed: (){
            Navigator.pushNamed(context, SearchResultPage.ROUTER_NAME,arguments:_historyListData[i]);
          },
          textColor: CusColor.GREY999,
          bgColor: CusColor.GREY999,
         ),
        );
      }
      widgetList.add(
          PrimaryTag(
            text: "展开",
            onPressed: (){
              spread = true;
              setState((){
              });
            },
            textColor: CusColor.GREY666,
            bgColor: Colors.white,
        ),
      );
    }
    if ( _historyListData.length > 8  && _historyListData.length <= 20  && spread == true){
      for (int i = 0; i < _historyListData.length; i++) {
        widgetList.add(PrimaryTag(
          text: _historyListData[i],
          onPressed: (){
            Navigator.pushNamed(context, SearchResultPage.ROUTER_NAME,arguments:_historyListData[i]);
          },
          textColor: CusColor.GREY999,
          bgColor: CusColor.GREY999,
        ),
        );
      }
      widgetList.add(
        PrimaryTag(
          text: "收起",
          onPressed: (){
            spread = false;
            setState((){
            });
          },
          textColor: CusColor.GREY666,
          bgColor: Colors.white,
        ),
      );
    }
    if ( _historyListData.length > 8  && _historyListData.length > 20  && spread == true){
      for (int i = 0; i < 20; i++) {
        widgetList.add(PrimaryTag(
          text: _historyListData[i],
          onPressed: (){
            Navigator.pushNamed(context, SearchResultPage.ROUTER_NAME,arguments:_historyListData[i]);
          },
          textColor: CusColor.GREY999,
          bgColor: CusColor.GREY999,
        ),
        );
      }
      widgetList.add(
        PrimaryTag(
          text: "收起",
          onPressed: (){
            spread = false;
            setState((){
            });
          },
          textColor: CusColor.GREY999,
          bgColor: Colors.white,
        ),
      );
    }
    if ( _historyListData.length < 8){
      for (int i = 0; i < _historyListData.length; i++) {
        widgetList.add(PrimaryTag(
          text: _historyListData[i],
          onPressed: (){
            Navigator.pushNamed(context, SearchResultPage.ROUTER_NAME,arguments:_historyListData[i]);
          },
          textColor: Color(0xff999999),
          bgColor: Color(0xff999999),
        ),
        );
      }
    }

    return widgetList;
  }

  Widget SearchWidget(){
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.5),
              ),
              height: 35,
              child: TextField(
                autofocus: false,
                focusNode: focusNodeSearch,
                controller: textEditingController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    "static/images/search.png",
                  ),
                  hintText: "可以在这里输入关键词",
                  contentPadding: EdgeInsets.only(top: 2),
                  hintStyle: CusTextStyle.GREY9_14,
                  border: InputBorder.none,
                ),
                onSubmitted: (text) {
                  focusNodeSearch.unfocus();
                  SearchServices.setHistoryData(text);
                  Navigator.pushNamed(context, SearchResultPage.ROUTER_NAME,arguments:text);
                  textEditingController.text = "";

                },
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            height: 35,
            child:InkWell(
              onTap: (){
                focusNodeSearch.unfocus();
                textEditingController.text = "";
              },
              child: Text("取消",style:CusTextStyle.GREY6_14,
              ),
            ),
          ),
        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFEDEDED),
      body: CustomScrollView(
        physics: ScrollPhysics(),
        controller: scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
              delegate: SearchHeader(child: SearchWidget()),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child:historySearch(),
          ),
        ],

      ),
    );
  }
}


class SearchHeader extends SliverPersistentHeaderDelegate {
  SearchHeader({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  } // 头部展示内容

  @override
  double get maxExtent => 45.0; // 最大高度

  @override
  double get minExtent => 45.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      true; // 因为所有的内容都是固定的，所以不需要更新
}


import 'package:flutter/material.dart';
import 'package:flutter_app_ios/Common/TopTabbarButton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';

class ListPage extends StatefulWidget {
  static const ROUTER_NAME = "ListPage";
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
   var selectedIndex = 0;
   RefreshController _refreshController = RefreshController(initialRefresh: true);
   List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

   void _onRefresh() async{

     _refreshController.refreshCompleted();
   }

   void _onLoading() async{
     items.add((items.length+1).toString());
     if(mounted)
       setState(() {

       });
     _refreshController.loadComplete();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
        centerTitle: true,
      ),
      body: _buildRoot(),
    );
  }
   Widget _buildRoot() {
     return  RefreshConfiguration(
       hideFooterWhenNotFull:true,
       autoLoad: true,
       child:SmartRefresher(
         enablePullDown: true,
         enablePullUp: true,
         header: WaterDropHeader(),
         footer: CustomFooter(
           builder: (BuildContext context, LoadStatus mode) {
             Widget body;
             if (mode == LoadStatus.idle) {
               body = Text("上拉加载更多");
             } else if (mode == LoadStatus.loading) {
               body = CupertinoActivityIndicator();
             } else if (mode == LoadStatus.failed) {
               body = Text("加载失败");
             } else {
               body = Text("没有更多数据了");
             }
             return Container(
               height: 55.0,
               child: Center(child: body),
             );
           },
         ),
         controller: _refreshController,
         onRefresh: _onRefresh,
         onLoading: _onLoading,
         child: _buildContent(),
       ),
     );
   }

   Widget _buildContent(){
     return CustomScrollView(
       slivers: <Widget>[
         SliverPersistentHeader(
             delegate: TabbarHeader(
               child:TopTabbarButton(
                 height: 40,
                 bgCColor: Colors.blue,
                 selectedCColor: Colors.white,
                 selectedTColor: Colors.black,
                 normalTColor: Colors.white,
                 num: 4,
                 titleArr: ["第一项","第二项","第三项","第四项"],
                 selectedIndex: selectedIndex,
                 changeClick:(int num){
                   setState(() {
                     selectedIndex = num;

                   });
                 },
               ),
             ),
             pinned: true),
         SliverList(delegate: _buildSliverLists()),
       ],
     );
   }

   SliverChildDelegate _buildSliverLists(){

     return SliverChildBuilderDelegate((BuildContext context, int index) {
       //创建列表项
       return new Container(
         child: _buildItem(index),
       );
     },childCount: items.length);
   }
   Widget _buildItem(int index){
      return Container(
        height: 70,
        child:Card(
          child: Center(
            child:Text(items[index]),
          ),
        ),
      );

   }

}
class TabbarHeader extends SliverPersistentHeaderDelegate {
  TabbarHeader({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  } // 头部展示内容

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      true; // 因为所有的内容都是固定的，所以不需要更新
}

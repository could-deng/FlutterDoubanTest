import 'package:flutter/material.dart';
import 'package:flutter_app/page/home/my_tab_bar_widget.dart';
import 'dart:math' as math;

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageWidgetState();
  }
}

var titleList = ["电影", "电视", "综艺", "读书"];

var tabList = <Widget>[];
TabController _tabController;

class _HomePageWidgetState extends State<HomePageWidget>
    with SingleTickerProviderStateMixin {
  var tabBar;
  @override
  void initState() {
    super.initState();
    tabList = titleList
        .map((str) => Text(
              str,
              style: TextStyle(fontSize: 15.0),
            ))
        .toList();
    tabBar = HomePageTabBar();
    _tabController =
        TabController(vsync: this, length: tabList.length); //动画效果的异步处理，默认格式
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: titleList.length,
        child: _getNestedScrollView(tabBar),
      ),
    );
  }
}

//主Container
Widget _getNestedScrollView(Widget tabBar) {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Text("Search"),
          ),
        ),
        SliverPersistentHeader(
          floating: true,
          pinned: true,
          delegate: _SliverAppBarDelegate(
              maxHeight: 49.0,
              minHeight: 49.0,
              child: Container(
                color: Colors.white,
                child: tabBar,
              )),
        )
      ];
    },
    body: FlutterTabBarView(
      tabController: _tabController,
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

//TabBar
class HomePageTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageTabBarState();
  }
}

class _HomepageTabBarState extends State<HomePageTabBar> {
  Color selecteColor, unselecteColor;
  TextStyle selecteStyle, unselecteStyle;

  @override
  void initState() {
    super.initState();
    selecteColor = Colors.black;
    unselecteColor = Color.fromARGB(255, 117, 117, 117);
    selecteStyle = TextStyle(fontSize: 18, color: selecteColor);
    unselecteStyle = TextStyle(fontSize: 18, color: unselecteColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: TabBar(
          tabs: tabList,
          isScrollable: true,
          indicatorColor: selecteColor,
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          labelColor: selecteColor,
          labelStyle: selecteStyle,
          unselectedLabelColor: unselecteColor,
          unselectedLabelStyle: unselecteStyle,
        ));
    // return Container( TabBar());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

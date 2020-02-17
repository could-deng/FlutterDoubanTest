import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/home/HomePageWidget.dart';
import 'package:flutter_app/page/me/MePageWidget.dart';

class DoubanMainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoubanMainpageWidge();
  }
}

class ItemBean {
  var beanName;
  var activeIcon;
  var unActiveIcon;
  ItemBean({@required this.beanName, this.activeIcon, this.unActiveIcon});
}

class _DoubanMainpageWidge extends State<DoubanMainPageWidget> {
  List<BottomNavigationBarItem> itemList;
  List<Widget> pages;

  List<ItemBean> itemNames = [
    ItemBean(
        beanName: "首页",
        activeIcon: "assets/images/ic_tab_home_active.png",
        unActiveIcon: "assets/images/ic_tab_home_normal.png"),
    ItemBean(
        beanName: "个人",
        activeIcon: "assets/images/ic_tab_profile_active.png",
        unActiveIcon: "assets/images/ic_tab_profile_normal.png"),
  ];

  int nowSelectedIndex = 0;
  Widget getPageWidget(int pageIndex) {
    return Offstage(
      offstage: !(pageIndex == nowSelectedIndex),
      child: pages[pageIndex],
    );
  }

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [
        HomePageWidget(),
        MePageWidget(),
      ];
    }
    if (itemList == null) {
      itemList = itemNames.map((item) => BottomNavigationBarItem(
            title: Text(
              item.beanName,
              style: TextStyle(fontSize: 10.0),
            ),
            icon: Image.asset(
              item.unActiveIcon,
              width: 30,
              height: 30,
            ),
            activeIcon: Image.asset(
              item.activeIcon,
              width: 30,
              height: 30,
            ),
          )).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          getPageWidget(0),
          getPageWidget(1),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int selecredIndex) => {
          setState(() {
            nowSelectedIndex = selecredIndex;
          })
        },
        iconSize: 24,
        currentIndex: nowSelectedIndex,
        items: itemList,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

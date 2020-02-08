import 'package:flutter/material.dart';
import 'package:flutter_app/Net.dart';
import 'package:flutter_app/second.dart';
import 'package:flutter_app/splash/Splash.dart';

import 'NetSample.dart';

void main() {
//  var test = Test(1, 22222222);
//  var test = Test(point: new Point(b1: 1, b2: 2), a1: 2, a2: 2);
//  print(test);
//  runApp(BasicAppbarSample());
  runApp(MaterialApp(
    // home: TabbedAppBarWidget(),
    home:SplashWidget(),
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => MyApp(title: 'page A'),
      '/b': (BuildContext context) =>
          BasicAppbarStatefulWidget(bundleData: 'page B'),
      '/c': (BuildContext context) => MyApp(title: 'page C'),
      "/netsample": (BuildContext contexst) => SampleApp(),
    },
  ));
}

Function pushFunction = (BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) {
      return MyApp(
        title: "123",
      );
    },
  ));
};
Function pushFunctionWithNoBack = (BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
};

Function pushFunctionWithBack = (BuildContext context, String routeName) async {
  Map coordinates = await Navigator.of(context).pushNamed(routeName);
  if (coordinates != null) {
    print(coordinates.keys);
  }
};

Function pushFunction3 = (
  BuildContext context,
) {
  Navigator.push(
      context,
      PageRouteBuilder(
          opaque: true,
          pageBuilder: (BuildContext context, _, __) {
            return Center(child: Text('My PageRoute'));
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: RotationTransition(
                turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                child: child,
              ),
            );
          }));
};

Function popFunction = (BuildContext context) {
  Navigator.pop(context);
};

int nowSelectedIndex = 0;
Choice _selectedChoice = choices[0];

class TabbedAppBarState extends State<TabbedAppBarWidget>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController tabController;
  AppLifecycleState _lastLifecyleState;
  @override
  void initState() {
    super.initState();
    // 创建Controller
    tabController = TabController(length: choices.length, vsync: this);
    tabController.addListener(() {
      if (choices.length > tabController.index &&
          (nowSelectedIndex != tabController.index)) {
        print((tabController.index));
        nowSelectedIndex = tabController.index;
        setState(() {
          _selectedChoice = choices[tabController.index];
        });
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _lastLifecyleState = state;
  }

  @override
  Widget build(BuildContext context) {
    cache_context = context;
    return new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: Text("TabTitle"),
            bottom: new TabBar(
                isScrollable: true,
                controller: this.tabController,
                tabs: choices.map((Choice choice) {
                  return new Tab(
                    text: choice.title,
                    icon: new Icon(choice.icon),
                  );
                }).toList()),
          ),
          body: new Padding(
            padding: EdgeInsets.all(11),
            child: new ChoiceCard(
              choice: _selectedChoice,
              mTapClick: (choi) {
//                setSelectedChoice(choi);
//                pushFunction(context);
                pushFunctionWithNoBack(context, "/a");
//              pushFunction3(context);
              },
            ),
          ),
        ));
  }
}

BuildContext cache_context;

class TabbedAppBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabbedAppBarState();
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  final Function(Choice s) mTapClick;

  const ChoiceCard({Key key, this.mTapClick, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new GestureDetector(
      onTap: () {
        mTapClick(choices[0]);
      },
      child: new Card(
        color: Colors.white10,
        child: new Container(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(choice.icon, size: 128.0, color: textStyle.color),
              new Text(
                choice.title,
                style: textStyle,
              ),
              new GestureDetector(
                onTap: () {
                  pushFunctionWithBack(context, "/b");
                },
                child: new Text(
                  "GoToNetDart,withBack",
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              new GestureDetector(
                onTap: () {
                  pushFunctionWithNoBack(context, "/b");
                },
                child: new Text(
                  "GoToNetDart,NoBack",
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              new GestureDetector(
                onTap: () {
                  pushFunctionWithNoBack(context, "/netsample");
                },
                child: new Text(
                  "GoToNetSample",
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: const EdgeInsets.all(0),
                color: Colors.amber[600],
//                width: 48.0,
//                height: 48.0,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                      child: Text(
                        "1211111",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
//                      onTap: pushFunction2(cache_context, "/b"),
                    ),
                    Icon(
                      choice.icon,
                    ),
                    const Image(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      width: 80,
                      height: 40,
                    ),
                  ],
                ),
                transform: Matrix4.rotationZ(0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.desktop_mac),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

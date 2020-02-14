import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DoubanMain.dart';
import 'package:flutter_app/utils/ScreenUtils.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<SplashWidget> {
  bool showAd = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: showAd,
          child: DoubanMainPageWidget(),
        ),
        Offstage(
          offstage: !showAd,
          child: Container(
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: ScreenUtils.screenW(context) / 3,
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "By Could Deng",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                  child: 
                  Column (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment(1.0, 0),
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 2.0, top: 2.0),
                          child: CountDownWidget(
                            mCountDownFinishCallback: (bool isEnd) {
                              if (isEnd) {
                                setState(() {
                                  showAd = false;
                                });
                              }
                            },
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.desktop_mac,
                              size: 50.0,
                              color: Colors.green,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Hi,豆瓣",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  // 回调方法的使用
  final mCountDownFinishCallback;

  const CountDownWidget({Key key, @required this.mCountDownFinishCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountDownState();
  }
}

class _CountDownState extends State<CountDownWidget> {
  int _second = 6;
  Timer _timer;
  // var    ?????
  @override
  void initState() {
    // _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '跳过$_second',
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_second <= 1) {
          widget.mCountDownFinishCallback(true);
          _endTimer();
        }
        _second--;
      });
    });
  }

  void _endTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

import 'dart:js';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  String title = "";

//  MyApp(String title) {
//    this.title = title;
//  }
  MyApp({this.title});

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
  Widget selection
    return new MaterialApp(
      title: title == null ? 'Welcome to Flutter' : title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title == null ? 'Welcome to Flutter' : title),
        ),
        body: new Center(
          child: new RandomWords(),
//          child: new Text(wordPair.asPascalCase),
//          child: Hello World),
        ),
      ),
    );
  }
}

//第一行
Widget titleSelection = new Container(
  padding: EdgeInsets.all(32.0),
  child: new Row(
    children: <Widget>[
      new Expanded(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: new Text(
                "test",
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            new Text(
              "test2",
              style: new TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
      new Icon(Icons.star, color: Colors.red[400]),
      new Text('41')
    ],
  ),
);

Widget getButtonSelection(Context context){
  child: new Row(children: <Widget>[buildButtonColumn(const, Icon., label)],),),
}
//Widget buttonSelection = new Container(

Column buildButtonColumn(Context context, IconData icon, String label) {
  Color color = Theme
      .of(context)
      .primaryColor;
  return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          margin: EdgeInsets.only(top: 8),
          child: new Text(
            label,
            style: new TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ]);
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggestions = <WordPair>[];
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}

class Test {
  Point point;
  int a1, a2;
  int privateVar = 0;

//  Test({this.point = const Point(b1: 1, b2: 1), this.a1 = 1, this.a2 = 0});

  @override
  String toString() {
    // TODO: implement toString
    return 'Bicycle: $a1 mph';
  }

  int get thePrivateVar => privateVar;
}

class Point {
  int b1, b2;

  Point({this.b1 = 1, this.b2 = 1});
}

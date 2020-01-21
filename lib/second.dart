import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  String title = "";

//  MyApp(String title) {
//    this.title = title;
//  }
  MyApp({this.title});

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(context, Icons.call, 'CALL'),
          buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );

    return new MaterialApp(
      title: title == null ? 'Welcome to Flutter' : title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title == null ? 'Welcome to Flutter' : title),
        ),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              pictureSelection,
              titleSelection,
              buttonSection,
              textSelection,
              cardBox,
            ],
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      new Icon(Icons.star, color: Colors.red[400]),
      new Text('41'),
    ],
    mainAxisAlignment: MainAxisAlignment.start,
  ),
);

Widget textSelection = new Container(
  padding: EdgeInsets.all(32.0),
  child: new Text("123123123123123"),
);

Widget pictureSelection = new Container(
  child: Image(
    image: NetworkImage(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    height: 240,
    fit: BoxFit.cover,
  ),
);

Column buildButtonColumn(BuildContext context, IconData icon, String label) {
  Color color = Theme.of(context).primaryColor;
  return new Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
          size: 50,
        ),
        new Container(
          margin: EdgeInsets.only(top: 8),
          child: new Text(
            label + "",
            style: new TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ]);
}

SizedBox cardBox = new SizedBox(
  height: 210,
  child: new Card(
    child: new Column(
      children: <Widget>[
        new ListTile(
          title: new Text(
            "sdfsf",
            style: new TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: new Text("subsdfsf"),
          leading: new Icon(
            Icons.restaurant,
            color: Colors.blue[500],
          ),
        ),
      ],
    ),
  ),
);

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

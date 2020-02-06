import 'package:flutter/material.dart';

class NetTestWidget extends StatelessWidget {
  String bundleData;

  NetTestWidget({this.bundleData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}

class BasicAppbarStatefulWidget extends StatefulWidget {
  String bundleData;

  BasicAppbarStatefulWidget({this.bundleData});

  @override
  State<StatefulWidget> createState() {
    return new BasicAppBarSampleState();
  }
}

Choice _selectedChoice = choices[0];

BuildContext cache_context;

class BasicAppBarSampleState extends State<BasicAppbarStatefulWidget> {
  void _selecte(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    cache_context = context;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('AppBar Title'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(choices[0].icon),
                onPressed: () {
                  _selecte(choices[0]);
                }),
            new IconButton(
                icon: new Icon(choices[1].icon),
                onPressed: () {
                  _selecte(choices[1]);
                }),
            new PopupMenuButton<Choice>(
              onSelected: _selecte,
              onCanceled: null,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    value: choice,
                    child: new Icon(
                      choice.icon,
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(36.0),
          child: new ChoiceCard(
            choice: _selectedChoice,
            mTapClick: (choi) {
              _selecte(choi);
//              pushFunction(context);
            },
          ),
        ),
      ),
    );
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

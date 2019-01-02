import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Test',
        home: new Scaffold(
            appBar: new AppBar(
                title: new Text('Test')
            ),
            body: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Text("Raised Button"),
                  onPressed: (){},
                ),
                new FloatingActionButton(
                  child: new Icon(Icons.add),
                  onPressed: (){},
                ),
                new FlatButton(
                    onPressed: (){},
                    child: new Text("Flat Button")
                ),
                new IconButton(
                    icon: new Icon(Icons.list),
                    onPressed: (){}
                ),
                new PopupMenuButton<WhyFarther>(
                  onSelected: (WhyFarther result) {},
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.harder,
                      child: const Text('Working a lot harder'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.smarter,
                      child: const Text('Being a lot smarter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.selfStarter,
                      child: const Text('Being a self-starter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.tradingCharter,
                      child: const Text('Placed in charge of trading charter'),
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}

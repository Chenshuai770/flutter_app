import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Sample App",
      theme: new ThemeData(
          primarySwatch: Colors.red
      ),
      home: new SampleAppPage(),
    );
  }
}


class SampleAppPage extends StatefulWidget {

  SampleAppPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SampleAppPageState();
  }


}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }

  _getToggleChild() {
    if (toggle) {
      return new Text("Toggle One");
    } else {
      return new MaterialButton(
        onPressed: null,
        child: new Text("Toggle two"),
        color: Colors.red,

      );
    }
  }
}
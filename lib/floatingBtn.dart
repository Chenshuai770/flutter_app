import 'package:flutter/material.dart';

/**
 * 如果一个widget发生了变化（例如用户与它交互），它就是有状态的。
 * 但是，如果一个子widget对变化做出反应，而其父widget对变化没有反应，
 * 那么包含的父widget仍然可以是无状态的widget。
 */
void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //title: "Sample App",
      theme: new ThemeData(primarySwatch: Colors.blue,),
      home: new SampelAppPage(),
    );
  }

}

class SampelAppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampelAppPage> {
  String textToShow = "我喜欢flutter";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: new MaterialButton(
          onPressed: _updateText,
          child: new Text(textToShow),
          padding: new EdgeInsets.only(left: 10.0, right: 10.0),
          color: Colors.red,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: "Update Text",
        child: new Icon(Icons.update),
      ),
    );
  }


  void _updateText() {
    setState(() {
      textToShow = "我已经改变了";
    });
  }
}


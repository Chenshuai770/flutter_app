import 'package:flutter/material.dart';

/**
 * 创建一个水平list
有时，您可能想要创建一个水平滚动（而不是垂直滚动）的列表。ListView本身就支持水平list。
在创建ListView时，设置scrollDirection为水平方向以覆盖默认的垂直方向。
 */
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(horizontal:20,vertical: 20.0),
          height: 500.0,
          child: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              new Container(
                width: 160.0,
                height: 160.0,
                color: Colors.red,
              ),
              new Container(
                width: 160.0,
                height: 160.0,
                color: Colors.blue,
              ),
              new Container(
                width: 160.0,
                height: 160.0,
                color: Colors.green,
              ),
              new Container(
                width: 160.0,
                height: 160.0,
                color: Colors.yellow,
              ),
              new Container(
                width: 160.0,
                height: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
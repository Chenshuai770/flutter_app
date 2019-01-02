import 'package:flutter/material.dart';

/**
 *  基本List
    显示数据列表是移动应用程序常见的需求。Flutter包含的ListView Widget，使列表变得轻而易举！
    创建一个ListView
    使用标准ListView构造函数非常适合仅包含少量条目的列表。我们使用内置的ListTile Widget来作为列表项。
 */
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
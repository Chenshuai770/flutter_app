import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/**
 * 使用长列表
标准的ListView构造函数适用于小列表。 为了处理包含大量数据的列表，最好使用ListView.builder构造函数。

ListView的构造函数需要一次创建所有项目，但ListView.builder的构造函数不需要，它将在列表项滚动到屏幕上时创建该列表项。

1. 创建一个数据源
首先，我们需要一个数据源来。例如，您的数据源可能是消息列表、搜索结果或商店中的产品。大多数情况下，这些数据将来自互联网或数据库。

在这个例子中，我们将使用List.generate构造函数生成拥有10000个字符串的列表*/
void main() {
  runApp(new MyApp(
    items: new List<String>.generate(10000, (i) => "Item $i"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
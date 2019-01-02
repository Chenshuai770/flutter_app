import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text('Test')
        ),
//        body: new MyAlertDialogView()
        body: new MySimpleDialogView(),
      ),
    );
  }
}

class MyAlertDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('显示AlertDialog'),
      onPressed: () {
        showDialog<Null>(
          context: context,
          barrierDismissible: false, // 不能点击对话框外关闭对话框，必须点击按钮关闭
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('提示'),
              content: new Text('微软重申Windows 7将在2020年1月到达支持终点，公司希望利用这个机会说服用户在最新更新发布之前升级到Windows 10。'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('明白了'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class MySimpleDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('显示SimpleDialog'),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return new SimpleDialog(
                title: new Text('这是SimpleDialog'),
                children: <Widget>[
                  new SimpleDialogOption(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('确定'),
                  ),
                  new SimpleDialogOption(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('取消'),
                  ),
                ],
              );
            }
        );
      },
    );
  }
}

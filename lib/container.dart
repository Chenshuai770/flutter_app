import 'package:flutter/material.dart';

/**
 * Container是使用非常多的一个布局容器，关于Container容器的显示规则，有如下几条：
    1. 如果Container中没有子组件，则Container会尽可能的大
    2. 如果Container中有子组件，则Container会适应子组件的大小
    3. 如果给Container设置了大小，则Container按照设置的大小显示
    4. Container的显示规则除了跟自身约束和子组件有关，跟它的父组件也有关
    ---------------------
    作者：yubo_725
    来源：CSDN
    原文：https://blog.csdn.net/yubo_725/article/details/81536206
    版权声明：本文为博主原创文章，转载请附上博文链接！
 */
main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Test",
      home: new Scaffold(
          appBar: new AppBar(
              title: new Text("Test")
          ),
          body: new Container(
            // // 设置外边距都为20.0
              margin: const EdgeInsets.all(20.0),
              // // 设置外边距都为20.0
              width: 100.0,
              height: 100.0,
              color: Colors.red,
              child: new Align(
                alignment: Alignment.bottomRight,
                child: new Text("ddd"),
              )
          )
      ),
    );
  }
}

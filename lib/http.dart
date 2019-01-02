import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/**
 * 异步加载
 * 在Android中，当你想访问一个网络资源时，你通常会创建一个AsyncTask，它将在UI线程之外运行代码来防止你的UI被阻塞。
 * AsyncTask有一个线程池，可以为你管理线程
 * 由于Flutter是单线程的，运行一个事件循环（如Node.js），所以您不必担心线程管理或者使用AsyncTasks、IntentServices。
 * 要异步运行代码，可以将函数声明为异步函数，并在该函数中等待这个耗时任务
 */
void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
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

  List widgets = [];

  @override
  void initState() {
    super.initState();
    lodaData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView.builder(

          itemCount: widgets.length,
          itemBuilder:(BuildContext context,int pos){
            return getRow(pos);
          }),
    );
  }

  Widget getRow(int pos) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[pos]["id"]}"),
    );
  }

  Future lodaData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response= await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });

  }
}
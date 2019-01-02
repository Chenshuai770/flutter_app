import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RowDirectionSample(),

    );
  }

}

/**
 * row 行
 */
class RowSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('行视图'),
      ),
      body: new Container(
        color: Colors.pinkAccent,
        child: buildRows(),
      ),
    );
  }

  Widget buildRows() {
    return new Row(

      mainAxisSize: MainAxisSize.max,
      //子控件属性,相当于TextView gravity 属性
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //更细致的gravity属性
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Icon(Icons.info),
        new Icon(
          Icons.map,
          size: 80.0,),
        new Icon(Icons.email)
      ],

    );
  }
}

/**
 * 权重属性,用Expanded包裹
 */
class WeightRawSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("权重属性"),
      ),
      body: new Container(
        child: new Row(
          children: <Widget>[
            buildIcon(Icons.info, color: Colors.teal),
            buildIcon(Icons.map, flex : 2, color: Colors.yellowAccent),
            buildIcon(Icons.email, flex:4,color: Colors.red),
          ],

        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, {int flex = 1, Color color}) {
    return new Expanded(
        flex: flex,
        child: new Container(
          color: color,
          child: new Icon(
              icon
          ),
        ));
  }

}

/**
 * RowDirectionSample
 */
class RowDirectionSample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RowDirectionSample'),
      ),
      body: new Container(
        color: Colors.red,
        child: new Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            new Icon(
              Icons.info,
            ),
            new Icon(
              Icons.map,
            ),
            new Icon(
              Icons.email,
            )
          ],
        ),
      ),
    );
  }

}



/**
 * 列 column
 */
class ColumnSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("列视图"),
      ),
      body: new Container(
        color: Colors.pinkAccent,
        child: buildColumns(),
      ),
    );
  }

  Widget buildColumns() {
    return new Column(
      children: <Widget>[
        new Icon(Icons.info),
        new Icon(Icons.map),
        new Icon(Icons.email)
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

}






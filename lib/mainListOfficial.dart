import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp()); // 这是Dart中单行函数或方法的简写。
/**
 * StatelessWidget这将会使应用本身也成为一个widget。
 * 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
 */
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    /* return new MaterialApp(
      title: "Welcome to Flutter",
      home: new Scaffold( //Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂。
        appBar: new AppBar(
          title: new Text("Welcom to flutter"),
        ),
        body: new Center( //本示例中的body的widget树中包含了一个Center widget, Center widget又包含一个 Text 子widget。 Center widget可以将其子widget树对其到屏幕中心
          //child: new Text('Hello World'),
          child: new RandomWords(),
        ),
      ),
    );*/

    return new MaterialApp(
      title: "listView",
      theme: new ThemeData(
        primaryColor: Colors.red
      ),
      home: new RandomWords(),
    );
  }

}


/**
 * Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 statefulwidget 至少需要两个类:
 * 一个 State类
 * 一个 StatefulWidget类,
 * StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
 */
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
/* @override
  createState() => new RandomWordsState();*/
}

/**
 * 一个 State类 与上面两个类呼应的
 */

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0); //单词字体
  final _suggestions = <WordPair>[]; //_suggestions列表以保存建议的单词对。
  final _saved = new Set<WordPair>();

  /**
   * 路由位置
   */
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*  final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }


  Widget _buildSuggestions() {
    return new ListView.builder(
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile 行.
      // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        //todo 提示: 在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }


}



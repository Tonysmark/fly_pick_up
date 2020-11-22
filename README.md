# fly_pick_up

​	从头开始学 Flutter，之前学习过 Dart 语法，学习过 Flutter，很多人说 Flutter 很像 React ，所以我就先把 React 学习了，结果到头来 Dart 又不会了，Flutter 啥啥都忘了，所以接下来希望通过每天学习官方文档的内容，去重新巩固我对这一技术栈的知识。


## 第一课时认知 Dart

​	Dart 语法和 TypeScript 语法上有很大的相似性，参考 [Dart语言](https://www.dartcn.com/guides/language/)









## 上手写 Flutter

​	首先是入口函数，通过一个 `mian` 创建一个入口 `widget` ，widget 目前接触两种，有状态 statefulWidget 和无状态 statelessWidget , 都会看到一个 build 方法。 

```dart
class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
}
```

```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      this.counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Text(
        '${this.counter}',
        style: Theme.of(context).textTheme.headline4,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

然后就得到了书中作者提到的，为什么 build 放在不在 StatefulWidget 中写？





## 参考

[Dart 编程语言]: https://www.dartcn.com/guides/language/


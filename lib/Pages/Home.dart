import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final wordPairList = <WordPair>[];
  final _savedWordPair = Set<WordPair>();

  Widget handleRenderList(context) {
    return ListView.builder(itemBuilder: (context, item) {
      if (item.isOdd) {
        return Divider();
      }
      final index = item ~/ 2;
      if (index >= wordPairList.length) {
        wordPairList.addAll(generateWordPairs().take(10));
      }
      return _buildRow(wordPairList[index]);
    });
  }

  Widget _buildRow(WordPair wordPairItem) {
    final saved = _savedWordPair.contains(wordPairItem);
    return ListTile(
      title: Text(
        wordPairItem.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        saved ? Icons.favorite : Icons.favorite_border,
        color: saved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (saved) {
            _savedWordPair.remove(wordPairItem);
          } else {
            _savedWordPair.add(wordPairItem);
          }
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final Iterable<ListTile> tiles = this._savedWordPair.map(
                (pair) => ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
          final List<Widget> divided =
              ListTile.divideTiles(tiles: tiles, context: context).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Pair'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: this.pushSaved)
        ],
      ),
      body: handleRenderList(context),
    );
  }
}

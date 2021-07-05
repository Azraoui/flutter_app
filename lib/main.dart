import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroling App',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          textTheme: TextTheme(
              headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _suggestion = <WordPair>[];

  Widget _myList(int i) {
    _suggestion.addAll(generateWordPairs().take(10));
    String word = _suggestion[i].toString();
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        word,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView(
      children: [
        _myList(0),
        _myList(1),
        _myList(2),
        _myList(3),
        _myList(4),
        _myList(5),
        _myList(0),
        _myList(1),
        _myList(2),
        _myList(3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Bar',
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: _buildSuggestions(),
      ),
    );
  }
}

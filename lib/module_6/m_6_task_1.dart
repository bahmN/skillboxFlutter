import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_function_declarations_over_variables
  final listData = (int count) => List<Widget>.generate(count, (i) {
        return Card(
          child: ListTile(
            title: Text('$i'),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (final item in listData(50)) item,
        ],
      ),
    );
  }
}

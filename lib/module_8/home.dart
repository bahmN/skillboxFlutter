import 'package:flutter/material.dart';
import 'package:material_basics/module_8/fetch_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skillbox. Module 8'),
      ),
      body: FutureBuilder<String>(
        future: fetchFileFromAssets('assets/data/dat1a.txt'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('NONE'),
              );
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              return SingleChildScrollView(child: Text(snapshot.data));

            default:
              return const Text('Default');
          }
        },
      ),
    );
  }
}

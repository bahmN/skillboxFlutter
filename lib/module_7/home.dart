import 'package:flutter/material.dart';
import 'package:material_basics/module_7/album.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                key: UniqueKey(),
                title: const Text('Home'),
                onTap: () => Navigator.of(context).pushNamed('/'),
              ),
              ListTile(
                key: UniqueKey(),
                title: const Text('Albums'),
                onTap: () => Navigator.of(context).pushNamed('/album'),
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}

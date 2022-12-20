import 'package:flutter/material.dart';

import 'package:material_basics/module_6/m_6_task_2.dart' as m6t2;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const m6t2.MyHomePage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:material_basics/module_6/m_6_task_1.dart' as m6t4;

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(15),
          ),
          iconColor: Colors.purple,
        ),
      ),
      home: const m6t4.MyHomePage(),
    );
  }
}

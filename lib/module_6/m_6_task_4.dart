import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: 'Начните вводить значения',
              labelText: 'Search',
              helperText: 'Поле для поиска заметок',
              suffixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.purple),
              labelStyle: const TextStyle(color: Colors.purple),
            ),
          ),
        ),
      ),
    );
  }
}

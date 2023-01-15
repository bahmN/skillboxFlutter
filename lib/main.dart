import 'package:flutter/material.dart';
import 'package:material_basics/module_9/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 39, 35, 35),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomeView(),
      },
    );
  }
}

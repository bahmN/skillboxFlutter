import 'package:flutter/material.dart';
import 'package:material_basics/module_11/home.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 28, 3, 39),
          secondary: const Color.fromARGB(255, 39, 35, 35),
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const HomePage(),
            );
          case DetailView.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => DetailView(
                id: args['id'],
                image: args['image'],
                description: args['description'],
              ),
            );
          default:
            print('Nothing...');
        }
      },
      home: const HomePage(),
    );
  }
}

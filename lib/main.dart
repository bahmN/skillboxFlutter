import 'package:flutter/material.dart';
import 'package:material_basics/module_9/details.dart';
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
          secondary: const Color.fromARGB(255, 39, 35, 35),
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeView.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomeView(),
            );

          case Details.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => Details(
                uuid: args['uuid'],
              ),
            );
          default:
            print('Nothing...');
        }
      },
      home: const HomeView(),
    );
  }
}

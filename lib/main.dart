import 'package:flutter/material.dart';
import 'package:material_basics/module_7/album.dart';
import 'package:material_basics/module_7/artists.dart';
import 'package:material_basics/module_7/home.dart';

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
      onGenerateRoute: ((settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const MyHomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.decelerate;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(
                  curve: curve,
                ));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          case AlbumsPage.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AlbumsPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.decelerate;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(
                  curve: curve,
                ));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          case ArtistPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ArtistPage(
                name: args['name'],
                about: args['about'],
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.5);
                const end = Offset.zero;
                const curve = Curves.decelerate;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(
                  curve: curve,
                ));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          default:
            print('');
        }
      }),
      home: const MyHomePage(),
    );
  }
}

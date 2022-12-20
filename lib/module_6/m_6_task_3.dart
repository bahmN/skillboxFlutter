import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = List<Widget>.generate(
    20,
    (index) => Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.deepPurple,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.constrainWidth();
          return width > 500
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 8,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                )
              : SizedBox(
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 1,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...data.map((e) => e).toList(),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

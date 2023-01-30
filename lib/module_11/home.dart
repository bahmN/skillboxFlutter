import 'package:flutter/material.dart';
import 'package:material_basics/module_11/space.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero animation. Module 11'),
      ),
      body: ListView(
          children: spaces
              .map((e) => Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Hero(
                            tag: e.id,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              child: Image.asset(
                                height: 75,
                                width: double.maxFinite,
                                e.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Hero(
                            tag: '${e.id}-title',
                            child: Material(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 25.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 28, 3, 39),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child: Text(e.description,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 216, 255),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                            '/detailView',
                            arguments: {
                              'id': e.id,
                              'image': e.image,
                              'description': e.description,
                            },
                          ),
                          icon: const Icon(
                            Icons.zoom_out_map,
                            color: Color.fromARGB(255, 34, 1, 48),
                          ),
                        ),
                      ),
                    )
                  ]))
              .toList()),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView(
      {super.key,
      required this.id,
      required this.image,
      required this.description});
  static const routeName = '/detailView';
  final String id;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail view'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Hero(
                tag: id,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Image.asset(image)),
              ),
              Hero(
                tag: '$id-title',
                child: Material(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 28, 3, 39),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

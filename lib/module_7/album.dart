import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlbumsPage extends StatefulWidget {
  static const routeName = '/album';

  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/artists.json');
    final data = await json.decode(response);

    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
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
      body: Column(
        children: [
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/artist', arguments: {
                            'name': _items[index]["name"],
                            'about': _items[index]["about"],
                          }),
                          leading: Text('${index + 1}'),
                          title: Text(_items[index]["name"]),
                        ),
                      );
                    }),
                  ),
                )
              : const Text('No data ;('),
        ],
      ),
    );
  }
}

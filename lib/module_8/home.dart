import 'package:flutter/material.dart';
import 'package:material_basics/module_8/fetch_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _title = 'Skillbox. Module 8. Task 1';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = _selectedIndex == 0
          ? 'Skillbox. Module 8. Task 1'
          : 'Skillbox. Module 8. Task 2';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _selectedIndex == 0 ? CatchErrorTask1() : LoadFileTask2(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Задание 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Задание 2',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CatchErrorTask1 extends StatefulWidget {
  const CatchErrorTask1({Key? key}) : super(key: key);

  @override
  State<CatchErrorTask1> createState() => CatchErrorTask1State();
}

class CatchErrorTask1State extends State<CatchErrorTask1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchFileFromAssets('assets/data/data.txt'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('NONE'),
            );
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            return SingleChildScrollView(child: Text(snapshot.data));

          default:
            return const Text('Default');
        }
      },
    );
  }
}

class LoadFileTask2 extends StatefulWidget {
  const LoadFileTask2({Key? key}) : super(key: key);

  @override
  State<LoadFileTask2> createState() => _LoadFileTask2State();
}

class _LoadFileTask2State extends State<LoadFileTask2> {
  final _controller = TextEditingController();

  String? strAssets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.31,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    strAssets = _controller.text;
                  });
                },
                child: Text('Поиск'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(75, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          StreamBuilder<String>(
            stream: getData(strAssets),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text('NONE'),
                  );
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  return SingleChildScrollView(child: Text('${snapshot.data}'));

                default:
                  return const Text('Default');
              }
            },
          ),
        ],
      ),
    );
  }
}

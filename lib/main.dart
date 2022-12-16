import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Material widgets basics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState?.showBottomSheet((context) => Container(
                color: Colors.deepPurple[200],
                height: 125,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: Row(
                        children: [
                          const Icon(Icons.credit_card),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Сумма покупки',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                '200 ₽',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () => print('Оплачено'),
                        child: const Text('Оплатить'),
                      ),
                    )
                  ],
                ),
              ));
    } else {
      _controller!.close();
      _controller = null;
    }
  }

  final List<BottomNavigationBarItem> _bottomNavBarItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_camera_back_outlined),
      activeIcon: Icon(Icons.photo_camera_back_rounded),
      label: 'Фотографии',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      activeIcon: Icon(Icons.chat),
      label: 'Чат',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.album_outlined),
      activeIcon: Icon(Icons.album),
      label: 'Альбомы',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 50),
              height: 100,
              width: 100,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/skillboxAvatar.jpg'),
              ),
            ),
            const ListTileDrawer(
              iconLeading: Icon(Icons.home),
              iconTrailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Домой'),
            ),
            const ListTileDrawer(
              iconLeading: Icon(Icons.account_box),
              iconTrailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Профиль'),
            ),
            const ListTileDrawer(
              iconLeading: Icon(Icons.image),
              iconTrailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Изображения'),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          print('Здесь могла быть логика для деавторизации'),
                      child: const Text('Выход'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          print('Здесь могла быть логика для регистрации'),
                      child: const Text('Зарегистрироваться'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://oir.mobi/uploads/posts/2020-01/1580285172_1-p-chelovek-gora-1.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'username@skillbox.com',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.tealAccent[100],
          unselectedItemColor: Colors.white,
          items: [
            ..._bottomNavBarItem.map((e) {
              return e;
            }).toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: toggleBottomSheet,
        icon: const Icon(Icons.sell),
        label: const Text('Оплатить'),
      ),
      body: const Center(),
    );
  }
}

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    Key? key,
    required this.iconLeading,
    required this.iconTrailing,
    required this.title,
  }) : super(key: key);

  final Icon iconLeading, iconTrailing;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: iconLeading,
      trailing: iconTrailing,
      iconColor: Colors.deepPurple,
    );
  }
}

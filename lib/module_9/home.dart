import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:material_basics/module_9/models/hotel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isList = true;

  @override
  void initState() {
    super.initState();
  }

  final Future<dynamic> _getDataDio = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () async {
      final Dio dio = Dio();

      try {
        final response = await dio.get(
            'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

        return response.data
            .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
            .toList();
      } on DioError catch (e) {
        print(
            'error log: ${e.error}'); //Можно реализовать отсылку ошибки в логи на условный сервер
      }
    },
  );

  void listVGridV() {
    setState(() {
      isList ? isList = false : isList = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Лучшие отели мира'),
          actions: [
            IconButton(
              onPressed: () => listVGridV(),
              icon: isList
                  ? const Icon(Icons.apps_sharp)
                  : const Icon(Icons.list_sharp),
              color: Colors.white,
            ),
          ],
        ),
        body: FutureBuilder(
          future: _getDataDio,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: isList
                        ? ListView(
                            children: [
                              ...?snapshot.data
                                  ?.map(
                                    (data) => Card(
                                      elevation: 5.5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 246, 245, 255),
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  'assets/images/hotels/${data.poster}',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(data.name),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pushNamed('/details',
                                                              arguments: {
                                                        'uuid': data.uuid,
                                                      }),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 39, 35, 35),
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  child:
                                                      const Text('Подробнее'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            children: [
                              ...?snapshot.data
                                  ?.map(
                                    (data) => Card(
                                      elevation: 5.5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 246, 245, 255),
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 16 / 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  'assets/images/hotels/${data.poster}',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                data.name,
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pushNamed(
                                                    '/details',
                                                    arguments: {
                                                  'uuid': data.uuid
                                                }),
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 39, 35, 35),
                                              foregroundColor: Colors.white,
                                            ),
                                            child: const Text(
                                              'Подробнее',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_basics/module_9/models/hotel.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.uuid});
  static const routeName = '/details';
  final String uuid;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int errorNumb = 0;
  Future _getDataDio() async {
    try {
      final Dio dio = Dio();

      final response = await dio.get('https://run.mocky.io/v3/${widget.uuid}');
      return DetailsPreview.fromJson(response.data);
    } on DioError catch (e) {
      print('error log: ${e.error}');

      errorNumb = 404;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDataDio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.name ?? ''),
            ),
            body: ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2)),
                  items: [
                    ...snapshot.data.photos
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/hotels/$data',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Страна: ${snapshot.data.address['country']}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Город: ${snapshot.data.address['city']}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Улица: ${snapshot.data.address['street']}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Рейтинг: ${snapshot.data.rating}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: const Color.fromARGB(255, 39, 35, 35),
                    width: double.infinity,
                    height: 1.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text(
                      'Сервисы',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Бесплатные',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            for (var item in snapshot.data.services['free']!)
                              Text(
                                item,
                                style: const TextStyle(fontSize: 16.0),
                                softWrap: true,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Платные',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            for (var item in snapshot.data.services['paid']!)
                              Text(
                                item,
                                style: const TextStyle(fontSize: 16.0),
                                softWrap: true,
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: errorNumb == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Center(
                    child: Text('Контент временно недоступен'),
                  ),
          );
        }
      },
    );
  }
}

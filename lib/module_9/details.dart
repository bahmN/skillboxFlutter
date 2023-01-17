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
  final Dio _dio = Dio();
  DetailsPreview? info;
  bool isLoading = false;
  int numbError = 0;

  @override
  void initState() {
    super.initState();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _dio.get('https://run.mocky.io/v3/${widget.uuid}');

      info = DetailsPreview.fromJson(response.data);
      setState(() {
        isLoading = false;
      });
    } on DioError catch (e) {
      numbError = 404;
      print('${e.error}');

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(info != null ? info!.name : ''),
            ),
            body: numbError == 0
                ? ListView(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 300.0,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2)),
                        items: [
                          ...info!.photos
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
                              'Страна: ${info!.address['country']}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Город: ${info!.address['city']}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Улица: ${info!.address['street']}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Рейтинг: ${info!.rating}',
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
                                  for (var item in info!.services['free']!)
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
                                  for (var item in info!.services['paid']!)
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
                  )
                : const Center(
                    child: Text('Контент временно недоступен'),
                  ),
          );
  }
}

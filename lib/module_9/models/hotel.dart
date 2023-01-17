import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DetailsPreview {
  final String uuid;
  final String name;
  final String poster;
  final Map<String, dynamic> address;
  final num price;
  final num rating;
  final Map<String, List<String>> services;
  final List<String> photos;

  DetailsPreview({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.address,
    required this.price,
    required this.rating,
    required this.services,
    required this.photos,
  });
  factory DetailsPreview.fromJson(Map<String, dynamic> json) =>
      _$DetailsPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsPreviewToJson(this);
}

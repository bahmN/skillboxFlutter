// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) => HotelPreview(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

DetailsPreview _$DetailsPreviewFromJson(Map<String, dynamic> json) =>
    DetailsPreview(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      address: json['address'] as Map<String, dynamic>,
      price: json['price'] as num,
      rating: json['rating'] as num,
      services: (json['services'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DetailsPreviewToJson(DetailsPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsImpl _$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$ProductsImpl(
      pieces: (json['pieces'] as List<dynamic>)
          .map((e) => Piece.fromJson(e as Map<String, dynamic>))
          .toList(),
      designs: (json['designs'] as List<dynamic>)
          .map((e) => Design.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      collections: (json['collections'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      'pieces': instance.pieces,
      'designs': instance.designs,
      'categories': instance.categories,
      'collections': instance.collections,
    };

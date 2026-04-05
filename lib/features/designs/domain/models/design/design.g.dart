// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignImpl _$$DesignImplFromJson(Map<String, dynamic> json) => _$DesignImpl(
      id: json['id'] as String,
      names: (json['names'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: (json['description'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
      details: (json['details'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k),
            Map<String, String>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$$DesignImplToJson(_$DesignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
      'categoryIds': instance.categoryIds,
      'description': instance.description
          .map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
      'details':
          instance.details.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.fi: 'fi',
};

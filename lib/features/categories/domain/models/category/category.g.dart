// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      names: (json['names'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.fi: 'fi',
};

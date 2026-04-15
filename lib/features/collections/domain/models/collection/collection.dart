import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required String id,
    required Map<Language, String> names,
    required Map<Language, String> description,
  }) = _Collection;

  factory Collection.fromJson(Map<String, Object?> json) =>
      _$CollectionFromJson(json);
}

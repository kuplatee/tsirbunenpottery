import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madmudmobile/localization/languages.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required Map<Language, String> names,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}

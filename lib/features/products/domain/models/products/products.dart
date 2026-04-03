import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';

import '../design/design.dart';
import '../piece/piece.dart';

part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class Products with _$Products {
  const factory Products({
    required List<Piece> pieces,
    required List<Design> designs,
    required List<Category> categories,
    required List<Collection> collections,
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) =>
      _$ProductsFromJson(json);
}

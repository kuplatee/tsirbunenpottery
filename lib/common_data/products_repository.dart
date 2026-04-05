import 'package:madmudmobile/common_cloud_service/cloud_service.dart';
import 'package:madmudmobile/features/categories/domain/models/category/category.dart';
import 'package:madmudmobile/features/collections/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'dart:convert';

typedef AllProductsData = ({
  List<Piece> pieces,
  List<Design> designs,
  List<Category> categories,
  List<Collection> collections,
});

class ProductsRepository {
  final CloudService _cloudService;
  AllProductsData? _cache;

  ProductsRepository(this._cloudService);

  Future<AllProductsData> getProducts() async {
    return _cache ??= await _fetchAllFromCloud();
  }

  Future<AllProductsData> _fetchAllFromCloud() async {
    final collectionsData =
        await _cloudService.fetchMany(collection: 'collections');
    final collections = collectionsData.map(toCollection).toList();

    final categoriesData =
        await _cloudService.fetchMany(collection: 'categories');
    final categories = categoriesData.map(toCategory).toList();

    final designsData = await _cloudService.fetchMany(collection: 'designs');
    final designs =
        designsData.map((data) => toDesign(data, categories)).toList();

    final piecesData = await _cloudService.fetchMany(collection: 'pieces');
    final pieces = piecesData
        .map((data) => toPiece(data, designs, collections))
        .whereType<Piece>()
        .toList();

    return (
      pieces: pieces,
      designs: designs,
      categories: categories,
      collections: collections,
    );
  }

  Collection toCollection(Map<String, dynamic> data) {
    return Collection(
      id: data['id'] as String,
      description: _toStringTranslations(data, 'description'),
      names: _toStringTranslations(data, 'names'),
    );
  }

  Category toCategory(Map<String, dynamic> data) {
    return Category(
      id: data['id'] as String,
      names: _toStringTranslations(data, 'names'),
    );
  }

  Design toDesign(Map<String, dynamic> data, List<Category> categories) {
    return Design(
      id: data['id'] as String,
      names: _toStringTranslations(data, 'names'),
      categoryIds: _idsOfRefs<Category>(data, categories, 'categoryIds'),
      description: _toStringTranslations(data, 'description'),
      details: _toStringMapTranslations(data, 'details'),
    );
  }

  Piece? toPiece(
    Map<String, dynamic> data,
    List<Design> designs,
    List<Collection> collections,
  ) {
    final designId = _idOfRef<Design>(data, designs, 'designId');
    if (designId == null) return null;

    return Piece(
      id: data['id'] as String,
      designId: designId,
      imageFileNames: ((data['imageFileNames'] ?? []) as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      collectionId: _idOfRef(data, collections, 'collectionId'),
      sold: data['sold'] as bool? ?? false,
    );
  }

  Map<Language, String> _toStringTranslations(
      Map<String, dynamic> data, String fieldName) {
    final namesMap = data[fieldName] as Map<String, dynamic>;
    return namesMap.map(
      (key, value) => MapEntry(
        Language.values.firstWhere((e) => e.name == key),
        value as String,
      ),
    );
  }

  Map<Language, Map<String, String>> _toStringMapTranslations(
      Map<String, dynamic> data, String fieldName) {
    final detailsRaw = data[fieldName] as Map<String, dynamic>;
    return detailsRaw.map(
      (key, value) {
        final parsedMap = value is String
            ? jsonDecode(value) as Map<String, dynamic>
            : (value as Map).cast<String, dynamic>();
        final convertedMap = parsedMap.map(
          (innerKey, innerValue) => MapEntry(innerKey, innerValue as String),
        );
        return MapEntry(
          Language.values.firstWhere((e) => e.name == key),
          convertedMap,
        );
      },
    );
  }

  List<String> _idsOfRefs<T>(
    Map<String, dynamic> data,
    List<T> items,
    String fieldName,
  ) {
    final refs = data[fieldName] as List<dynamic>;
    final refIds = refs.map((e) {
      if (e is DocumentReference) return e.id;
      return e as String;
    }).toList();

    return refIds.where((refId) {
      return items.any((item) => (item as dynamic).id == refId);
    }).toList();
  }

  String? _idOfRef<T>(
      Map<String, dynamic> data, List<T> items, String fieldName) {
    final value = data[fieldName];
    if (value == null) return null;

    final refId = value is DocumentReference ? value.id : value as String;
    final exists = items.any((item) => (item as dynamic).id == refId);
    return exists ? refId : null;
  }
}

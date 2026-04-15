import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/category/category.dart';
import 'package:tsirbunenpottery/features/collections/domain/models/collection/collection.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
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
      imageFileNames: (data['imageFileNames'] as List<dynamic>? ?? [])
          .whereType<String>()
          .toList(),
      collectionId: _idOfRef(data, collections, 'collectionId'),
      sold: data['sold'] as bool? ?? false,
    );
  }

  Language? _toLanguage(String key) {
    for (final lang in Language.values) {
      if (lang.name == key) return lang;
    }
    return null;
  }

  Map<Language, String> _toStringTranslations(
      Map<String, dynamic> data, String fieldName) {
    final raw = data[fieldName];
    if (raw is! Map<String, dynamic>) return {};
    final result = <Language, String>{};
    for (final entry in raw.entries) {
      final language = _toLanguage(entry.key);
      if (language != null && entry.value is String) {
        result[language] = entry.value as String;
      }
    }
    return result;
  }

  Map<Language, Map<String, String>> _toStringMapTranslations(
      Map<String, dynamic> data, String fieldName) {
    final raw = data[fieldName];
    if (raw is! Map<String, dynamic>) return {};
    final result = <Language, Map<String, String>>{};
    for (final entry in raw.entries) {
      final language = _toLanguage(entry.key);
      if (language == null) continue;
      try {
        final Map<String, dynamic> parsedMap = entry.value is String
            ? jsonDecode(entry.value as String) as Map<String, dynamic>
            : (entry.value as Map).cast<String, dynamic>();
        result[language] = parsedMap.map(
          (k, v) => MapEntry(k, v is String ? v : v.toString()),
        );
      } catch (_) {
        continue;
      }
    }
    return result;
  }

  List<String> _idsOfRefs<T>(
    Map<String, dynamic> data,
    List<T> items,
    String fieldName,
  ) {
    final raw = data[fieldName];
    if (raw is! List) return [];
    final refs = raw;
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

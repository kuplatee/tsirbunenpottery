enum ViewMode {
  pieces,
  categories,
  collections,
  // designs,
}

extension ScrollTargetExtension on ViewMode {
  String scrollTargetName(String? categoryId, String? collectionId,
      {bool isHorizontal = false}) {
    final direction = isHorizontal ? 'horizontal' : 'vertical';
    switch (this) {
      case ViewMode.categories:
        return categoryId == null
            ? 'categories'
            : 'category-$direction-$categoryId';
      case ViewMode.collections:
        return collectionId == null
            ? 'collections'
            : 'collection-$direction-$collectionId';
      // case ViewMode.designs:
      //   return 'designs-$direction';
      case ViewMode.pieces:
        return 'pieces-$direction';
    }
  }
}

class GridParams {
  final int itemsPerRow;
  final double photoWidth;
  final double availableWidth;

  GridParams({
    required this.itemsPerRow,
    required this.photoWidth,
    required this.availableWidth,
  });
}

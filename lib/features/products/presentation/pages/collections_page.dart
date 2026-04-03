import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/presentation/products_view/models.dart';
import 'package:madmudmobile/features/products/presentation/products_view/products_view.dart';

class CollectionsPage extends StatelessWidget {
  final String? selectedCollectionId;
  const CollectionsPage({super.key, this.selectedCollectionId});

  @override
  Widget build(BuildContext context) {
    return ProductsView(
      selectedCollectionId: selectedCollectionId,
      mode: ViewMode.collections,
    );
  }
}

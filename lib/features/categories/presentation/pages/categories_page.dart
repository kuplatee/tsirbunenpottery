import 'package:flutter/material.dart';
import 'package:madmudmobile/features/categories/presentation/categories_view/categories_view.dart';

class CategoriesPage extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesPage({super.key, this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    return CategoriesView(selectedCategoryId: selectedCategoryId);
  }
}

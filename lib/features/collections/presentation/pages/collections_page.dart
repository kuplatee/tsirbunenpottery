import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/collections/presentation/collections_view/collections_view.dart';

class CollectionsPage extends StatelessWidget {
  final String? selectedCollectionId;
  const CollectionsPage({super.key, this.selectedCollectionId});

  @override
  Widget build(BuildContext context) {
    return CollectionsView(selectedCollectionId: selectedCollectionId);
  }
}

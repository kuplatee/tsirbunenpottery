import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/language_bloc/language_bloc.dart';
import 'package:madmudmobile/app/language_bloc/language_state.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_bloc.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_state.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/widgets/products_sub_view/models.dart';
import 'package:madmudmobile/widgets/products_sub_view/products_sub_view.dart';
import 'package:madmudmobile/widgets/products_sub_view/scroll_position_mixin.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class CategoriesView extends StatefulWidget {
  final String? selectedCategoryId;

  const CategoriesView({super.key, this.selectedCategoryId});

  String get scrollTargetName =>
      ViewMode.categories.scrollTargetName(selectedCategoryId, null);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with ScrollPositionMixin<CategoriesView> {
  @override
  String get scrollTargetName => widget.scrollTargetName;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          final language = langState.language;

          return BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              final groupedDesigns = _designsToShow(state);
              final allPieces = state.piecesById.values.toList();
              final gridParams = _gridParams(context, groupedDesigns);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...groupedDesigns.entries.map((entry) {
                    final categoryId = entry.key;
                    final pieceIdsByDesignId = entry.value;

                    final designs = pieceIdsByDesignId.keys
                        .map((id) => state.designsById[id])
                        .whereType<Design>()
                        .toList();

                    final pieceIds = pieceIdsByDesignId.values
                        .expand((ids) => ids)
                        .toList();
                    final pieces = allPieces
                        .where((p) => pieceIds.contains(p.id))
                        .toList();

                    final category = state.categories
                        .firstWhere((c) => c.id == categoryId);

                    return ProductsSubView(
                      id: categoryId,
                      title: category.names[language] ?? '',
                      designs: designs,
                      pieces: pieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      isTheOnlySubView: widget.selectedCategoryId != null,
                      mode: ViewMode.categories,
                    );
                  }),
                  const Footer(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Map<String, Map<String, List<String>>> _designsToShow(CategoriesState state) {
    if (widget.selectedCategoryId != null &&
        state.categoryDesigns.containsKey(widget.selectedCategoryId)) {
      return {
        widget.selectedCategoryId!:
            state.categoryDesigns[widget.selectedCategoryId]!,
      };
    }
    return state.categoryDesigns;
  }

  GridParams _gridParams(BuildContext context,
      Map<String, Map<String, List<String>>> groups) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (defaultMinPhotoWidth + horizontalGridSpacing);

    double width = 0.0;
    int itemsPerRow = 0;

    for (final entry in groups.entries) {
      final count = entry.value.length;
      if (count == 0) continue;
      final itemsPerThisRow = itemsPerRowEstimate.clamp(1, count);
      if (itemsPerThisRow > itemsPerRow) itemsPerRow = itemsPerThisRow;
      final totalSpacing = horizontalGridSpacing * (itemsPerThisRow - 1);
      final photoWidth =
          ((availableWidth - totalSpacing) / itemsPerThisRow)
              .clamp(defaultMinPhotoWidth, defaultMaxPhotoWidth);
      if (width == 0.0 || photoWidth < width) width = photoWidth;
    }

    return GridParams(
      itemsPerRow: itemsPerRow,
      photoWidth: width,
      availableWidth: availableWidth,
    );
  }
}

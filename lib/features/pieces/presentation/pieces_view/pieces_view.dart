import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/language_bloc/language_bloc.dart';
import 'package:madmudmobile/app/language_bloc/language_state.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_state.dart';
import 'package:madmudmobile/widgets/products_sub_view/models.dart';
import 'package:madmudmobile/widgets/products_sub_view/products_sub_view.dart';
import 'package:madmudmobile/widgets/products_sub_view/scroll_position_mixin.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class PiecesView extends StatefulWidget {
  const PiecesView({super.key});

  @override
  State<PiecesView> createState() => _PiecesViewState();
}

class _PiecesViewState extends State<PiecesView>
    with ScrollPositionMixin<PiecesView> {
  @override
  String get scrollTargetName =>
      ViewMode.pieces.scrollTargetName(null, null);

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          final language = langState.language;

          return BlocBuilder<PiecesBloc, PiecesState>(
            builder: (context, state) {
              final allDesigns = state.designsById.values.toList();
              final allPieces = state.piecesById.values.toList();
              final gridParams = _gridParams(context, [allDesigns.length]);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductsSubView(
                    id: 'pieces',
                    title: context.local(Translation.allPieces),
                    designs: allDesigns,
                    pieces: allPieces,
                    imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                    language: language,
                    gridParams: gridParams,
                    isTheOnlySubView: true,
                    mode: ViewMode.pieces,
                  ),
                  const Footer(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  GridParams _gridParams(BuildContext context, List<int> designCounts) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (defaultMinPhotoWidth + horizontalGridSpacing);

    double width = 0.0;
    int itemsPerRow = 0;

    for (final count in designCounts) {
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

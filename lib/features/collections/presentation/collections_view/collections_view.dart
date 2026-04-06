import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_state.dart';
import 'package:madmudmobile/features/collections/domain/bloc/collections_bloc.dart';
import 'package:madmudmobile/features/collections/domain/bloc/collections_state.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/bootstrap/router/routes.dart';
import 'package:madmudmobile/widgets/items_grid/models.dart';
import 'package:madmudmobile/widgets/items_grid/items_grid.dart';
import 'package:madmudmobile/widgets/items_grid/scroll_position_mixin.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class CollectionsView extends StatefulWidget {
  final String? selectedCollectionId;

  const CollectionsView({super.key, this.selectedCollectionId});

  String get scrollTargetName =>
      ViewMode.collections.scrollTargetName(null, selectedCollectionId);

  @override
  State<CollectionsView> createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView>
    with ScrollPositionMixin<CollectionsView> {
  @override
  String get scrollTargetName => widget.scrollTargetName;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          final language = langState.language;

          return BlocBuilder<CollectionsBloc, CollectionsState>(
            builder: (context, state) {
              final groupedDesigns = _designsToShow(state);
              final allPieces = state.piecesById.values.toList();
              final gridParams = _gridParams(context, groupedDesigns);
              final collectionsById = {
                for (final c in state.collections) c.id: c
              };

              return BlocStatusView(
                status: state.blocStatus,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...groupedDesigns.entries.expand((entry) {
                    final collectionId = entry.key;
                    final collection = collectionsById[collectionId];
                    if (collection == null) return const <Widget>[];

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

                    return [ItemsGrid(
                      id: collectionId,
                      title: collection.names[language] ?? '',
                      designs: designs,
                      pieces: pieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      isTheOnlySubView: widget.selectedCollectionId != null,
                      mode: ViewMode.collections,
                      routeRoot: collectionsRoot,
                      onNavigate: (context, id) =>
                          CollectionRoute(id: id).go(context),
                      isListWithSubRoutes: true,
                    )];
                  }),
                  const Footer(),
                ],
              ));
            },
          );
        },
      ),
    );
  }

  Map<String, Map<String, List<String>>> _designsToShow(
      CollectionsState state) {
    if (widget.selectedCollectionId != null &&
        state.collectionDesigns.containsKey(widget.selectedCollectionId)) {
      return {
        widget.selectedCollectionId!:
            state.collectionDesigns[widget.selectedCollectionId]!,
      };
    }
    return state.collectionDesigns;
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_state.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_bloc.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_state.dart';
import 'package:madmudmobile/bootstrap/router/routes.dart';
import 'package:madmudmobile/widgets/items_grid/models.dart';
import 'package:madmudmobile/widgets/items_grid/items_grid.dart';
import 'package:madmudmobile/widgets/items_grid/scroll_position_mixin.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class DesignsView extends StatefulWidget {
  const DesignsView({super.key});

  @override
  State<DesignsView> createState() => _DesignsViewState();
}

class _DesignsViewState extends State<DesignsView>
    with ScrollPositionMixin<DesignsView> {
  @override
  String get scrollTargetName => ViewMode.designs.scrollTargetName(null, null);

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          final language = langState.language;

          return BlocBuilder<DesignsBloc, DesignsState>(
            builder: (context, state) {
              final designs = state.designsById.values.toList();
              final gridParams = _gridParams(
                context,
                designs
                    .map((d) => state.piecesByDesignId[d.id]?.length ?? 0)
                    .toList(),
              );

              return BlocStatusView(
                status: state.blocStatus,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...designs.map((design) {
                    final pieces = state.piecesByDesignId[design.id] ?? [];
                    return ItemsGrid(
                      id: design.id,
                      title: design.names[language] ?? '',
                      designs: [design],
                      pieces: pieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      mode: ViewMode.designs,
                      routeRoot: designsRoot,
                      isListWithSubRoutes: false,
                      isTheOnlySubView: true,
                    );
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

  GridParams _gridParams(BuildContext context, List<int> pieceCounts) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (defaultMinPhotoWidth + horizontalGridSpacing);

    double width = 0.0;
    int itemsPerRow = 0;

    for (final count in pieceCounts) {
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

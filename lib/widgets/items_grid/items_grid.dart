import 'package:flutter/material.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/widgets/items_grid/piece_card.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/widgets/items_grid/models.dart';
import 'package:madmudmobile/widgets/items_grid/scroll_position_mixin.dart';
import 'package:madmudmobile/widgets/items_grid/title_with_hover_effect.dart';
import 'package:madmudmobile/localization/languages.dart';

// Note: Let's subtract some space from the photo width (if single row) as a guide to
// the user to scroll horizontally to see more designs
const double singleRowSubtraction = 15.0;
const double horizontalGridSpacing = 15.0;
const double verticalGridSpacing = 20.0;
const double defaultMinPhotoWidth = 175.0;
const double defaultMaxPhotoWidth = 300.0;
const double sideMargin = 25.0;
const double showExpandBreakpoint = 700.0;

class ItemsGrid extends StatefulWidget {
  final String title;
  final String id;
  final List<Design> designs;
  final List<Piece> pieces;
  final Language language;
  final Map<String, List<String>> imageFileNamesByDesignId;
  final GridParams gridParams;
  final ViewMode mode;
  final bool isTheOnlySubView;
  final void Function(BuildContext, String id)? onNavigate;

  const ItemsGrid({
    super.key,
    required this.title,
    required this.id,
    required this.designs,
    required this.pieces,
    required this.language,
    required this.imageFileNamesByDesignId,
    required this.gridParams,
    required this.mode,
    required this.isTheOnlySubView,
    this.onNavigate,
  });

  String get scrollTargetName {
    return mode.scrollTargetName(id, id, isHorizontal: true);
  }

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid>
    with ScrollPositionMixin<ItemsGrid> {
  @override
  String get scrollTargetName => widget.scrollTargetName;
  bool expandAll = false;

  @override
  Widget build(BuildContext context) {
    final isNarrow = widget.gridParams.availableWidth < showExpandBreakpoint;
    final size = _photoSize(isNarrow);
    final horizontalAlignment =
        isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final designsById = {for (final d in widget.designs) d.id: d};

    return Column(
      crossAxisAlignment: horizontalAlignment,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          // FIXME: This component works in development and production, but fails in tests
          // due to horizontal overflow. Figure out the problem.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TitleWithHoverEffect(
                  title: widget.title,
                  onTap: (context) => _navigateTo(context),
                  showEffect: !widget.isTheOnlySubView,
                ),
              ),
              if (_showExpandCollapseButton())
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ActionButton(
                      iconData: expandAll
                          ? Symbols.keyboard_arrow_up
                          : Symbols.keyboard_arrow_down,
                      onPressed: _toggleShowAll),
                )
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(
              left: horizontalGridSpacing, bottom: 20.0),
          child: expandAll || widget.isTheOnlySubView
              ? Wrap(
                  spacing: horizontalGridSpacing,
                  runSpacing: verticalGridSpacing,
                  children: widget.pieces.expand((piece) {
                    final design = designsById[piece.designId];
                    if (design == null) return const <Widget>[];
                    return [
                      PieceCard(
                        piece: piece,
                        design: design,
                        language: widget.language,
                        size: size,
                      ),
                    ];
                  }).toList(),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.pieces.expand((piece) {
                      final design = designsById[piece.designId];
                      if (design == null) return const <Widget>[];
                      return [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: horizontalGridSpacing),
                          child: PieceCard(
                            piece: piece,
                            design: design,
                            language: widget.language,
                            size: size,
                          ),
                        ),
                      ];
                    }).toList(),
                  ),
                ),
        ),
      ],
    );
  }

  void _navigateTo(BuildContext context) {
    widget.onNavigate?.call(context, widget.id);
  }

  Size _photoSize(bool isNarrow) {
    final subtraction = widget.isTheOnlySubView ? 0.0 : singleRowSubtraction;
    final availableWidthPerPhoto = (widget.gridParams.availableWidth) / 3;
    final adjustedPhotoWidth =
        isNarrow ? availableWidthPerPhoto : widget.gridParams.photoWidth;
    final width = (adjustedPhotoWidth - horizontalGridSpacing) - subtraction;
    return Size(width, width * 0.75);
  }

  bool _showExpandCollapseButton() {
    final expandNeeded = widget.designs.length > widget.gridParams.itemsPerRow;
    final canShowExpand =
        showExpandBreakpoint < MediaQuery.of(context).size.width;
    return expandNeeded && canShowExpand && !widget.isTheOnlySubView;
  }

  void _toggleShowAll() {
    setState(() {
      expandAll = !expandAll;
    });
  }
}

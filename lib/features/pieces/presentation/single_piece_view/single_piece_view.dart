import 'package:madmudmobile/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_state.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_state.dart';
import 'package:madmudmobile/features/pieces/presentation/single_piece_view/design_description.dart';
import 'package:madmudmobile/features/pieces/presentation/single_piece_view/piece_photos.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

const double spacing = 20.0;
const double limit = 600.0;

class SinglePieceView extends StatelessWidget {
  final String id;

  const SinglePieceView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(builder: (
        BuildContext context,
        LanguageState state,
      ) {
        final language = state.language;

        return BlocBuilder<PiecesBloc, PiecesState>(builder: (
          BuildContext context,
          PiecesState state,
        ) {
          final piece = state.piecesById[id];
          final designId = piece?.designId;
          final design = state.designsById[designId];
          final designName = design?.names[language];
          final designNotFound = context.local(Translation.designNotFound);
          if (design == null || designName == null || piece == null) {
            return Center(child: Text(designNotFound));
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              bool hasRoomForRow = constraints.maxWidth > limit;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: hasRoomForRow
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PiecePhotos(photoNames: piece.imageFileNames),
                              const SizedBox(width: spacing),
                              Flexible(
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: limit),
                                  child: DesignDescription(
                                      language: language, design: design),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PiecePhotos(photoNames: piece.imageFileNames),
                              const SizedBox(height: spacing),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: DesignDescription(
                                    language: language, design: design),
                              ),
                            ],
                          ),
                  ),
                  const Footer(),
                ],
              );
            },
          );
        });
      }),
    );
  }
}

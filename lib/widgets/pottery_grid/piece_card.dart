import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/bootstrap/service_locator/service_locator.dart';
import 'package:madmudmobile/core/state/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/core/state/scroll_and_route_bloc/scroll_and_route_event.dart';
import 'package:madmudmobile/bootstrap/router/routes.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/utils/constants.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

class PieceCard extends StatelessWidget {
  final Design design;
  final Piece piece;
  final Language language;
  final Size size;
  final String fromRoute;

  const PieceCard({
    super.key,
    required this.design,
    required this.piece,
    required this.language,
    required this.fromRoute,
    this.size = const Size(200.0, 150.0),
  });

  @override
  Widget build(BuildContext context) {
    final designName = design.names[language] ?? '';
    final devSize = size;
    // final devSize = Size(133.0, 100.0);
    // final devSize = Size(100.0, 75.0);

    return GestureDetector(
      onTap: () => _navigateTo(
        context,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoWithFallback(
            photo: _photo(piece.imageFileNames),
            size: devSize,
            zoomOnHover: true,
          ),
          const SizedBox(height: 2.0),
          SizedBox(
            width: devSize.width,
            child: Text(designName,
                style: _titleStyle(context),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    final layoutBloc = getIt.get<ScrollAndRouteBloc>();
    layoutBloc.add(AddToHistory(route: fromRoute));
    context.go('$piecesRoot/${piece.id}');
  }

  Photo _photo(List<String> imageFileNames) {
    final exampleFileName = imageFileNames.isNotEmpty ? imageFileNames[0] : '';
    return Photo(id: exampleFileName, url: "$photoBaseUrl$exampleFileName");
  }

  TextStyle _titleStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(overflow: TextOverflow.ellipsis);
  }
}

import 'package:flutter/widgets.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_event.dart';

mixin ScrollPositionMixin<T extends StatefulWidget> on State<T> {
  double _lastInitialScrollPosition = 0.0;
  double _newScrollPosition = 0.0;
  late final ScrollController scrollController;

  String get scrollTargetName;

  @override
  void initState() {
    super.initState();
    _lastInitialScrollPosition = _getPreviousScrollPosition();
    scrollController =
        ScrollController(initialScrollOffset: _lastInitialScrollPosition);
    _newScrollPosition = _lastInitialScrollPosition;
    scrollController.addListener(_updateScrollPositionLocally);
  }

  @override
  void dispose() {
    _storeNewScrollPositionForNextVisit();
    scrollController.dispose();
    super.dispose();
  }

  double _getPreviousScrollPosition() {
    return getIt.get<ScrollAndRouteBloc>().getScrollPosition(scrollTargetName);
  }

  void _updateScrollPositionLocally() {
    _newScrollPosition = scrollController.position.pixels;
  }

  void _storeNewScrollPositionForNextVisit() {
    if (_newScrollPosition == _lastInitialScrollPosition) return;

    getIt.get<ScrollAndRouteBloc>().add(ChangeScrollPosition(
          target: scrollTargetName,
          position: _newScrollPosition,
        ));
  }
}

import 'package:flutter/widgets.dart';
import 'package:madmudmobile/bootstrap/service_locator/service_locator.dart';
import 'package:madmudmobile/core/scroll_position_cache/scroll_position_cache.dart';

mixin ScrollPositionMixin<T extends StatefulWidget> on State<T> {
  double _lastInitialScrollPosition = 0.0;
  double _newScrollPosition = 0.0;
  late final ScrollController scrollController;

  String get scrollTargetName;

  @override
  void initState() {
    super.initState();
    _lastInitialScrollPosition =
        getIt.get<ScrollPositionCache>().get(scrollTargetName);
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

  void _updateScrollPositionLocally() {
    _newScrollPosition = scrollController.position.pixels;
  }

  void _storeNewScrollPositionForNextVisit() {
    if (_newScrollPosition == _lastInitialScrollPosition) return;
    getIt.get<ScrollPositionCache>().set(scrollTargetName, _newScrollPosition);
  }
}

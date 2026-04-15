import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';

mixin ScrollPositionMixin<T extends StatefulWidget> on State<T> {
  double _lastInitialScrollPosition = 0.0;
  double _newScrollPosition = 0.0;
  late final ScrollController scrollController;
  late final ScrollPositionCache _cache;
  bool _initialized = false;

  String get scrollTargetName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    _cache = context.read<ScrollPositionCache>();
    _lastInitialScrollPosition = _cache.get(scrollTargetName);
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
    _cache.set(scrollTargetName, _newScrollPosition);
  }
}

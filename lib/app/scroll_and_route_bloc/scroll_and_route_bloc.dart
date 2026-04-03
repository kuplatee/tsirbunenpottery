import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_event.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_state.dart';

class ScrollAndRouteBloc
    extends Bloc<ScrollAndRouteEvent, ScrollAndRouteState> {
  // Note: We do not want to store the scroll position data in the state
  // because we never rebuild widgets based on this data. We only query it
  // when we initialize a scrollable widget.
  Map<String, double> scrollPositions;

  ScrollAndRouteBloc({required this.scrollPositions})
      : super(const ScrollAndRouteState()) {
    on<ScrollAndRouteEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ScrollAndRouteEvent event,
    Emitter<ScrollAndRouteState> emit,
  ) async {
    return switch (event) {
      final ChangeScrollPosition e => _onChangeScrollPosition(e, emit),
      final AddToHistory e => _onAddToHistory(e, emit),
      final DropFromHistory e => _onDropFromHistory(e, emit),
      final ScrollAndRouteEvent _ => emit(state),
    };
  }

  Future<void> _onChangeScrollPosition(
      ChangeScrollPosition event, Emitter<ScrollAndRouteState> emit) async {
    if (event.position == null && scrollPositions.containsKey(event.target)) {
      scrollPositions.remove(event.target);
    } else {
      scrollPositions[event.target] = event.position!;
    }
  }

  Future<void> _onAddToHistory(
      AddToHistory event, Emitter<ScrollAndRouteState> emit) async {
    final newFromRoutes = List<String>.from(state.history);
    newFromRoutes.add(event.route);
    emit(state.copyWith(newHistory: newFromRoutes));
  }

  Future<void> _onDropFromHistory(
      DropFromHistory event, Emitter<ScrollAndRouteState> emit) async {
    final newFromRoutes = List<String>.from(state.history);
    newFromRoutes.removeLast();
    emit(state.copyWith(newHistory: newFromRoutes));
  }

  double getScrollPosition(String target) {
    return scrollPositions[target] ?? 0.0;
  }
}

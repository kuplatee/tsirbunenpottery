import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/state/navigation/navigation_event.dart';
import 'package:madmudmobile/core/state/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<PushToHistory>(_onPush);
    on<PopFromHistory>(_onPop);
  }

  void _onPush(PushToHistory event, Emitter<NavigationState> emit) {
    emit(state.copyWith(newHistory: [...state.history, event.route]));
  }

  void _onPop(PopFromHistory event, Emitter<NavigationState> emit) {
    if (state.history.isEmpty) return;
    emit(state.copyWith(
      newHistory: List<String>.from(state.history)..removeLast(),
    ));
  }
}

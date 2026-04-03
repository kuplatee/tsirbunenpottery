import 'package:equatable/equatable.dart';

class ScrollAndRouteState extends Equatable {
  final List<String> history;

  const ScrollAndRouteState({this.history = const []});

  ScrollAndRouteState copyWith({
    List<String>? newHistory,
  }) {
    return ScrollAndRouteState(history: newHistory ?? history);
  }

  @override
  List<Object?> get props => [
        history,
      ];
}

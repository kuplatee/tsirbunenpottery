import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final List<String> history;

  const NavigationState({this.history = const []});

  NavigationState copyWith({List<String>? newHistory}) {
    return NavigationState(history: newHistory ?? history);
  }

  @override
  List<Object?> get props => [history];
}

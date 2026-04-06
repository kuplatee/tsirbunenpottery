class NavigationEvent {}

class PushToHistory extends NavigationEvent {
  final String route;
  PushToHistory({required this.route});
}

class PopFromHistory extends NavigationEvent {
  PopFromHistory();
}

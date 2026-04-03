class ScrollAndRouteEvent {}

class ChangeScrollPosition extends ScrollAndRouteEvent {
  final double? position;
  final String target;
  ChangeScrollPosition({this.position, required this.target});
}

class AddToHistory extends ScrollAndRouteEvent {
  final String route;
  AddToHistory({required this.route});
}

class DropFromHistory extends ScrollAndRouteEvent {
  DropFromHistory();
}

class ScrollPositionCache {
  final Map<String, double> _positions = {};

  double get(String target) => _positions[target] ?? 0.0;

  void set(String target, double position) {
    _positions[target] = position;
  }
}

import 'package:flutter/widgets.dart';

class HoverDetector extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    bool isHovering,
  ) builder;

  const HoverDetector({super.key, required this.builder});

  @override
  State<HoverDetector> createState() => _HoverDetectorState();
}

class _HoverDetectorState extends State<HoverDetector> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: widget.builder(context, _isHovering),
    );
  }
}

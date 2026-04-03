import 'package:flutter/material.dart';

class ProgressIndicatorXL extends StatefulWidget {
  const ProgressIndicatorXL({super.key});

  @override
  State<ProgressIndicatorXL> createState() => _ProgressIndicatorXLState();
}

class _ProgressIndicatorXLState extends State<ProgressIndicatorXL>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<Color?>? _animation;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2.0,
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        valueColor: _animation,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Note: We need to do this async trick to get hold of the context
    // to be able to access the color scheme of our  app's theme.
    Future.delayed(Duration.zero, () {
      final colors = Theme.of(context).colorScheme;

      _animation = ColorTween(
        begin: colors.primary,
        end: colors.tertiary,
      ).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

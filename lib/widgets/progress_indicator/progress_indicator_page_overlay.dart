import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/progress_indicator/progress_indicator_xl.dart';

const opacity = 0.6;

class ProgressIndicatorPageOverlay extends StatelessWidget {
  final Widget child;
  final bool isSubmitting;

  const ProgressIndicatorPageOverlay({
    super.key,
    required this.child,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isSubmitting)
          Container(
            color: Colors.black.withOpacity(opacity),
            child: const Center(
              child: ProgressIndicatorXL(),
            ),
          ),
      ],
    );
  }
}

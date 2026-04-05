import 'package:flutter/material.dart';

const double dotSize = 10.0;

class PhotoCarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final int photosCount;

  const PhotoCarouselIndicator(
      {super.key, required this.currentIndex, required this.photosCount});

  @override
  Widget build(BuildContext context) {
    final colors = _dotColors(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(photosCount, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? colors.active : colors.inactive,
            ),
          );
        }),
      ),
    );
  }

  _dotColors(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return (active: colors.secondary, inactive: colors.tertiary);
  }
}

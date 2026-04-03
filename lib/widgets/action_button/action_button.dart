import 'package:flutter/material.dart';

const double containerSize = 50.0;
const double iconSize = 30.0;
const double iconWeight = 300.0;

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;

  const ActionButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: containerSize,
      height: containerSize,
      child: IconButton(
        icon: Icon(
          iconData,
          size: iconSize,
          weight: iconWeight,
          color: colors.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

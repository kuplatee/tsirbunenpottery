import 'package:flutter/material.dart';

const double logoDefaultSize = 40.0; //36.0;
const double tradeNameDefaultSize = 7.0;
const double textHeight = 1.0;
const double spacerHeight = 1.0;
const EdgeInsets padding =
    EdgeInsets.only(left: 6.0, right: 6.0, bottom: 5.0, top: 1.0);
const double borderRadius = 50.0;
const double borderWidth = 1.0;
const double containerWidthDefault = 55.0; //60.0;

class Trademark extends StatelessWidget {
  final double logoSize;
  final double tradeNameSize;
  final bool isInverted;
  final bool hasBorder;
  final void Function()? onPressed;
  final double width;

  const Trademark({
    super.key,
    this.logoSize = logoDefaultSize,
    this.tradeNameSize = tradeNameDefaultSize,
    this.isInverted = true,
    this.hasBorder = false,
    this.width = containerWidthDefault,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: _decoration(colors),
        width: width,
        height: width,
        child: Padding(
          padding: padding,
          child: Image.asset('assets/birdie512.png'),
        ),
      ),
    );
  }

  BoxDecoration _decoration(ColorScheme colors) {
    return BoxDecoration(
      color: isInverted ? colors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      border: hasBorder
          ? Border.all(color: colors.primary, width: borderWidth)
          : null,
    );
  }
}

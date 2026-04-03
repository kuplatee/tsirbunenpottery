import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/company/company.dart';
import 'package:madmudmobile/widgets/company/trademark.dart';

const EdgeInsets padding =
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0);
const double tradeNameFontSize = 15.0;
const FontWeight tradeNameFontWeight = FontWeight.w900;
const double descriptionFontSize = 12.0;
const FontWeight descriptionFontWeight = FontWeight.w500;
const SizedBox spacer = SizedBox(width: 20);

class DrawerHeaderItem extends StatelessWidget {
  final double width;
  const DrawerHeaderItem({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(context),
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Trademark(isInverted: false, hasBorder: true, width: width),
                spacer,
                const Expanded(child: Company()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      border: Border(
          bottom: BorderSide(
        width: 1.0,
        color: colors.onTertiary,
      )),
    );
  }
}

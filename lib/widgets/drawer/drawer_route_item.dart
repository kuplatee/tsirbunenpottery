import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/widgets/hover_detector/hover_detector.dart';

const iconSize = 30.0;
const fontSize = 16.0;
const itemPadding = EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0);
const labelPadding = EdgeInsets.only(left: 20.0);
const double selectedIconFontWeight = 500;
const double defaultIconFontWeight = 300;

class DrawerRouteItem extends StatelessWidget {
  final String routeLabel;
  final IconData iconData;
  final String path;
  final bool isTitle;
  final double width;
  final bool isCurrentRoute;

  const DrawerRouteItem({
    super.key,
    required this.routeLabel,
    required this.iconData,
    required this.path,
    required this.width,
    required this.isCurrentRoute,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final generalStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: fontSize,
        );
    final emphasizedStyle = generalStyle.copyWith(
      fontWeight: FontWeight.w800,
    );
    final style = isCurrentRoute ? emphasizedStyle : generalStyle;

    return HoverDetector(builder: (BuildContext context, bool isHovering) {
      return Container(
        color: isHovering ? colors.onTertiary : Colors.transparent,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _navigateTo(context),
              child: Padding(
                padding: itemPadding,
                child: Row(
                  children: [
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Icon(
                        iconData,
                        size: iconSize,
                        color: colors.primary,
                        weight: isCurrentRoute
                            ? selectedIconFontWeight
                            : defaultIconFontWeight,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: labelPadding,
                        child: Text(routeLabel, style: style),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  void _navigateTo(BuildContext context) {
    Navigator.of(context).pop();
    context.go(path);
  }
}

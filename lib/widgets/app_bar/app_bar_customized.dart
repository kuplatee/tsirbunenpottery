import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_left_actions.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_right_actions.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';

// FIXME: As long as the app is only available as the web version, the app bar height
// should be lowered like here.
const double appBarHeight = 81.0;
const double heightBreakpoint = 800.0;
const double widthBreakpoint = 500.0;
const double mobilePadding = 10.0;
const double desktopPadding = 10.0;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight,
      decoration: _decoration(context),
      child: Padding(
        padding: _padding(context),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarLeftActions(),
                Expanded(child: HorizontalNavigation()),
                AppBarRightActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      // color: colors.onTertiary, // Is it better with the background color or without?
      border: Border(bottom: BorderSide(width: 1.0, color: colors.onTertiary)),
    );
  }

  EdgeInsets _padding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom =
        size.height > heightBreakpoint ? desktopPadding : mobilePadding;
    final horizontal =
        size.width > widthBreakpoint ? desktopPadding : mobilePadding;

    return EdgeInsets.only(left: horizontal, right: horizontal, bottom: bottom);
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

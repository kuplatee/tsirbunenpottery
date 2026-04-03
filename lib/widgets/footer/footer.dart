import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/localization/app_locale.dart';

const double footerBreakpoint = 600.0;

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = _routes(context);
    final width = MediaQuery.of(context).size.width;
    final isHorizontal = width > footerBreakpoint;

    return Container(
        margin: const EdgeInsets.only(top: 50.0),
        decoration: _decoration(context),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: isHorizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [...routes],
                )
              : Column(
                  children: [
                    ...routes,
                  ],
                ),
        ));
  }

  Iterable<TextButton> _routes(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall!;

    return RouteEnum.values.map(
      (route) {
        return TextButton(
          onPressed: () => _navigateTo(context, route.path()),
          child: Column(
            children: [
              Text(context.local(route.pageName()), style: textStyle),
            ],
          ),
        );
      },
    );
  }

  void _navigateTo(BuildContext context, String path) {
    context.go(path);
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      // color: colors.onTertiary, // Is it better with the background color or without?
      border: Border(top: BorderSide(width: 1.0, color: colors.onTertiary)),
    );
  }
}

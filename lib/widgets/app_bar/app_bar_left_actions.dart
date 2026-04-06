import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/bootstrap/service_locator/service_locator.dart';
import 'package:madmudmobile/core/state/navigation/navigation_bloc.dart';
import 'package:madmudmobile/core/state/navigation/navigation_event.dart';
import 'package:madmudmobile/core/state/navigation/navigation_state.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AppBarLeftActions extends StatefulWidget {
  const AppBarLeftActions({super.key});

  @override
  AppBarLeftActionsState createState() => AppBarLeftActionsState();
}

class AppBarLeftActionsState extends State<AppBarLeftActions> {
  bool isGoingBack = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (
      BuildContext context,
      NavigationState state,
    ) {
      final showBackArrowInsteadOfMenu = _routeHasId(context);

      if (showBackArrowInsteadOfMenu || isGoingBack) {
        return ActionButton(
          onPressed: () => _goBack(context),
          iconData: Symbols.arrow_back,
        );
      }

      return ActionButton(
        onPressed: () => _openDrawer(context),
        iconData: Symbols.menu,
      );
    });
  }

  _routeHasId(BuildContext context) {
    final fullPath =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    return Uri.parse(fullPath).toString().contains(':id');
  }

  // FIXME: This fails if the user uses the browser's back button!!!
  void _goBack(BuildContext context) {
    final router = GoRouter.of(context);
    final navigationBloc = getIt.get<NavigationBloc>();

    if (navigationBloc.state.history.isNotEmpty) {
      var lastFromRoute = navigationBloc.state.history.last;
      // FIXME: Get rid of this hack!
      if (lastFromRoute == "/designs/allDesigns") {
        lastFromRoute = "/designs";
      }
      router.go(lastFromRoute);
    } else if (router.canPop()) {
      router.pop();
      setState(() {
        isGoingBack = false;
      });
    }

    navigationBloc.add(PopFromHistory());
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}

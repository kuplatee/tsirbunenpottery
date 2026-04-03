import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_customized.dart';
import 'package:madmudmobile/widgets/drawer/drawer_for_app_bar.dart';
import 'package:madmudmobile/widgets/progress_indicator/progress_indicator_page_overlay.dart';

class PageBase extends StatelessWidget {
  final Widget pageBody;
  final bool showProgressIndicator;
  final ScrollController? scrollController;

  const PageBase({
    super.key,
    required this.pageBody,
    this.showProgressIndicator = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppBarCustomized(),
      drawer: const DrawerForAppBar(),
      backgroundColor: colors.surface,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ProgressIndicatorPageOverlay(
            isSubmitting: showProgressIndicator,
            child: SingleChildScrollView(
              controller: scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: pageBody,
              ),
            ),
          );
        },
      ),
    );
  }
}

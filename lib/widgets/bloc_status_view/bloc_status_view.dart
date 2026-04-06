import 'package:flutter/material.dart';
import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/progress_indicator/progress_indicator_xl.dart';

class BlocStatusView extends StatelessWidget {
  final BlocStatus status;
  final Widget child;

  const BlocStatusView({
    super.key,
    required this.status,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (status.status == Status.loading) {
      return const Center(child: ProgressIndicatorXL());
    }

    if (status.status == Status.error) {
      debugPrint('BlocStatusView error: ${status.message}');
      return Center(
        child: Text(
          context.local(Translation.dataLoadError),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      );
    }

    return child;
  }
}

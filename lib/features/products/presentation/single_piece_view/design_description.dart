import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';

class DesignDescription extends StatelessWidget {
  final Design design;
  final Language language;

  const DesignDescription(
      {super.key, required this.design, required this.language});

  @override
  Widget build(BuildContext context) {
    final String designName = design.names[language]!;
    final String foodSafetyDetails =
        context.local(Translation.foodSafetyDetails);

    final productDetailsTitle = context.local(Translation.productDetails);
    final String foodSafetyTitle = context.local(Translation.foodSafetyTitle);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(designName, style: Theme.of(context).textTheme.headlineMedium),
        Text(
          _description(),
          softWrap: true,
          style: _mainDescriptionStyle(context),
        ),
        const SizedBox(height: 25.0),
        Text('$productDetailsTitle:', style: _subTitleStyle(context)),
        const SizedBox(height: 5.0),
        ..._details().map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(entry, style: _infoStyle(context)),
          ),
        ),
        const SizedBox(height: 25.0),
        Text('$foodSafetyTitle:', style: _subTitleStyle(context)),
        const SizedBox(height: 5.0),
        Text(foodSafetyDetails, style: _infoStyle(context)),
      ],
    );
  }

  String _description() {
    return design.description[language] ?? '';
  }

  List<String> _details() {
    return (design.details[language] ?? {})
        .entries
        .map((entry) => '• ${entry.key}: ${entry.value}')
        .toList();
  }

  TextStyle _mainDescriptionStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle _subTitleStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle _infoStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.0);
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/localization/en.dart';
import 'package:madmudmobile/localization/fi.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_right_actions.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const testKey = Translation.collections;
final testStringInEnglish = En().translate(testKey);
final testStringInFinnish = Fi().translate(testKey);

verifyVisibleAppLanguage(WidgetTester tester, Language language) {
  final textToFind =
      language == Language.en ? testStringInEnglish : testStringInFinnish;
  final textFinder = find.text(textToFind);
  expect(textFinder, findsOneWidget);
}

changeLanguage(WidgetTester tester) async {
  final toggleLanguageButton = find.descendant(
    of: find.byType(AppBarRightActions),
    matching: find.byWidgetPredicate(
      (widget) => widget is ActionButton && widget.iconData == Symbols.language,
    ),
  );

  expect(toggleLanguageButton, findsOneWidget);

  await tester.tap(toggleLanguageButton);
  await tester.pumpAndSettle();
}

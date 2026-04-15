import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/localization/en.dart';
import 'package:tsirbunenpottery/localization/fi.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/widgets/action_button/action_button.dart';
import 'package:tsirbunenpottery/widgets/app_bar/app_bar_right_actions.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const testKey = Translation.collections;
final testStringInEnglish = En().translate(testKey);
final testStringInFinnish = Fi().translate(testKey);

void verifyVisibleAppLanguage(WidgetTester tester, Language language) {
  final textToFind =
      language == Language.en ? testStringInEnglish : testStringInFinnish;
  final textFinder = find.text(textToFind);
  expect(textFinder, findsOneWidget);
}

Future<void> changeLanguage(WidgetTester tester) async {
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

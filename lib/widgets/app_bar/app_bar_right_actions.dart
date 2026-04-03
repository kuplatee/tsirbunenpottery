import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_event.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AppBarRightActions extends StatelessWidget {
  const AppBarRightActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralStateBloc, GeneralState>(
      builder: (BuildContext context, GeneralState state) {
        final currentLanguage = state.language;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Note: Later, if there are more actions available, change
            // this implementation to use, for example, some kind of popup menu.
            // As the only action currently available is a change between Finnish
            // and English, we are fine with this very simple implementation.
            ActionButton(
              onPressed: () {
                final newLanguage =
                    currentLanguage == Language.en ? Language.fi : Language.en;
                _onChangeLanguage(context, newLanguage);
              },
              iconData: Symbols.language,
            ),
          ],
        );
      },
    );
  }

  _onChangeLanguage(BuildContext context, Language language) {
    context.read<GeneralStateBloc>().add(ChangeLanguage(language));
  }
}

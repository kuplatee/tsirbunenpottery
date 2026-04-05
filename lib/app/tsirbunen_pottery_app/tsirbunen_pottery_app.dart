import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/language_bloc/language_bloc.dart';
import 'package:madmudmobile/app/language_bloc/language_state.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_bloc.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_bloc.dart';
import 'package:madmudmobile/features/collections/domain/bloc/collections_bloc.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_bloc.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/app/router/route_controller.dart';
import 'package:madmudmobile/localization/utils.dart';
import 'package:madmudmobile/theme/app_theme.dart';

class TsirbunenPotteryApp extends StatelessWidget {
  const TsirbunenPotteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<LanguageBloc>()),
        BlocProvider.value(value: getIt.get<HomeBloc>()),
        BlocProvider.value(value: getIt.get<PiecesBloc>()),
        BlocProvider.value(value: getIt.get<DesignsBloc>()),
        BlocProvider.value(value: getIt.get<CategoriesBloc>()),
        BlocProvider.value(value: getIt.get<CollectionsBloc>()),
        BlocProvider.value(value: getIt.get<ScrollAndRouteBloc>()),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext context, LanguageState state) {
          final locale = state.language.toLocale();

          return MaterialApp.router(
            routerConfig: routerConfig,
            theme: const AppTheme().themeData,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: AppLocale.supportedLocales,
            locale: locale,
            localeListResolutionCallback:
                createLocaleListResolutionCallback(locale),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_bloc.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_bloc.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_bloc.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_controller.dart';
import 'package:tsirbunenpottery/localization/utils.dart';
import 'package:tsirbunenpottery/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return RepositoryProvider.value(
      value: getIt.get<ScrollPositionCache>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt.get<LanguageBloc>()),
          BlocProvider.value(value: getIt.get<HomeBloc>()),
          BlocProvider.value(value: getIt.get<PiecesBloc>()),
          BlocProvider.value(value: getIt.get<DesignsBloc>()),
          BlocProvider.value(value: getIt.get<CategoriesBloc>()),
          BlocProvider.value(value: getIt.get<CollectionsBloc>()),
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
      ),
    );
  }
}

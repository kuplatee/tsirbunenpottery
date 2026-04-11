import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/bootstrap/environment/app_environment.dart';
import 'package:madmudmobile/bootstrap/service_locator/service_locator.dart';
import 'package:madmudmobile/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:madmudmobile/core/state/language_bloc/language_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_event.dart';
import 'package:madmudmobile/data/products_repository.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_bloc.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_event.dart';
import 'package:madmudmobile/features/categories/repository/categories_repository.dart';
import 'package:madmudmobile/features/collections/domain/bloc/collections_bloc.dart';
import 'package:madmudmobile/features/collections/domain/bloc/collections_event.dart';
import 'package:madmudmobile/features/collections/repository/collections_repository.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_bloc.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_event.dart';
import 'package:madmudmobile/features/designs/repository/designs_repository.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_bloc.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_event.dart';
import 'package:madmudmobile/features/home/repository/home_repository.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_event.dart';
import 'package:madmudmobile/features/pieces/repository/pieces_repository.dart';
import 'package:madmudmobile/localization/languages.dart';

import 'data_cloud_service.dart';

/// Like [prepareBlocsForTests] but uses [DataCloudService], so blocs are
/// seeded with realistic test data instead of empty stubs. Use this when a
/// test needs to verify that data actually renders in the UI.
void prepareDataBlocsForTests() {
  if (getIt.isRegistered<LanguageBloc>()) return;

  final cloudService = DataCloudService();
  final productsRepository = ProductsRepository(cloudService);

  final homeBloc = HomeBloc(HomeRepository(cloudService))
    ..add(FetchHomePageImageFileName());

  final piecesBloc = PiecesBloc(PiecesRepository(productsRepository))
    ..add(FetchPieces());

  final designsBloc = DesignsBloc(DesignsRepository(productsRepository))
    ..add(FetchDesigns());

  final categoriesBloc =
      CategoriesBloc(CategoriesRepository(productsRepository))
        ..add(FetchCategories());

  final collectionsBloc =
      CollectionsBloc(CollectionsRepository(productsRepository))
        ..add(FetchCollections());

  final languageBloc = LanguageBloc()..add(ChangeLanguage(Language.en));

  getIt
    ..registerSingleton<LanguageBloc>(languageBloc)
    ..registerSingleton<HomeBloc>(homeBloc)
    ..registerSingleton<PiecesBloc>(piecesBloc)
    ..registerSingleton<DesignsBloc>(designsBloc)
    ..registerSingleton<CategoriesBloc>(categoriesBloc)
    ..registerSingleton<CollectionsBloc>(collectionsBloc)
    ..registerSingleton<ScrollPositionCache>(ScrollPositionCache());
}

void setUpAndTearDownDataBlocsForTests() {
  setUpAll(() {
    Environment.noNetworkImages = true;
    prepareDataBlocsForTests();
  });

  tearDownAll(() {
    getIt.reset();
  });
}

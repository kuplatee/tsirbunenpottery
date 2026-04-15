import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/bootstrap/environment/app_environment.dart';
import 'package:madmudmobile/bootstrap/service_locator/service_locator.dart';
import 'package:madmudmobile/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:madmudmobile/core/state/language_bloc/language_bloc.dart';
import 'package:madmudmobile/core/state/language_bloc/language_event.dart';
import 'package:madmudmobile/localization/languages.dart';
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

import 'mock_cloud_service_helpers.dart';

void prepareBlocsForTests() {
  if (!getIt.isRegistered<LanguageBloc>()) {
    final cloudService = mockCloudServiceWithData();

    final homeRepository = HomeRepository(cloudService);
    final homeBloc = HomeBloc(homeRepository);
    homeBloc.add(FetchHomePageImageFileName());

    final productsRepository = ProductsRepository(cloudService);

    final piecesBloc = PiecesBloc(PiecesRepository(productsRepository));
    piecesBloc.add(FetchPieces());

    final designsBloc = DesignsBloc(DesignsRepository(productsRepository));
    designsBloc.add(FetchDesigns());

    final categoriesBloc =
        CategoriesBloc(CategoriesRepository(productsRepository));
    categoriesBloc.add(FetchCategories());

    final collectionsBloc =
        CollectionsBloc(CollectionsRepository(productsRepository));
    collectionsBloc.add(FetchCollections());

    final languageBloc = LanguageBloc()..add(ChangeLanguage(Language.en));
    getIt.registerSingleton<LanguageBloc>(languageBloc);
    getIt.registerSingleton<HomeBloc>(homeBloc);
    getIt.registerSingleton<PiecesBloc>(piecesBloc);
    getIt.registerSingleton<DesignsBloc>(designsBloc);
    getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
    getIt.registerSingleton<CollectionsBloc>(collectionsBloc);
    getIt.registerSingleton<ScrollPositionCache>(ScrollPositionCache());
  }
}

void setUpAndTearDownAllBlocsAndPreventNetworkImages() {
  setUpAll(() {
    Environment.noNetworkImages = true;
    prepareBlocsForTests();
  });

  tearDownAll(() {
    getIt.reset();
  });
}

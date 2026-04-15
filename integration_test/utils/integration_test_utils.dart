import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_event.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_bloc.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_bloc.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_bloc.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_event.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_bloc.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

/// Stub that returns empty data — no network calls, no Firebase needed.
class _StubCloudService implements CloudService {
  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async =>
      null;

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async =>
      [];
}

void prepareBlocsForIntegrationTests() {
  if (getIt.isRegistered<LanguageBloc>()) return;

  final cloudService = _StubCloudService();

  final homeBloc = HomeBloc(HomeRepository(cloudService))
    ..add(FetchHomePageImageFileName());

  final productsRepository = ProductsRepository(cloudService);

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

import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/app_environment/app_environment.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

void prepareBlocsForTests() {
  if (!getIt.isRegistered<GeneralStateBloc>()) {
    final piecesRepository = ProductsRepository();
    final collectionsAndPiecesBloc = ProductsBloc(piecesRepository);
    collectionsAndPiecesBloc.add(FetchProducts());

    getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
    getIt.registerSingleton<ProductsBloc>(collectionsAndPiecesBloc);
    getIt.registerSingleton<ScrollAndRouteBloc>(
        ScrollAndRouteBloc(scrollPositions: {}));
  }
}

void setUpAndTearDownAllBlocsAndPreventNetworkImages() {
  setUpAll(() {
    AppEnvironment.noNetworkImages = true;
    prepareBlocsForTests();
  });

  tearDownAll(() {
    getIt.reset();
  });
}

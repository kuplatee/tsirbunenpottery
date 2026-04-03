import 'package:get_it/get_it.dart';
import 'package:madmudmobile/app/language_bloc/language_bloc.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/common_cloud_service/common_cloud_service.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_bloc.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_event.dart';
import 'package:madmudmobile/features/home/repository/home_repository.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final cloudService = FirestoreCloudService();

  final languageBloc = LanguageBloc();

  final homeRepository = HomeRepository(cloudService);
  final homeBloc = HomeBloc(homeRepository);
  homeBloc.add(FetchHomePageImageFileName());

  final productsRepository = ProductsRepository(cloudService);
  final productsBloc = ProductsBloc(productsRepository);
  productsBloc.add(FetchProducts());

  final scrollAndRouteBloc = ScrollAndRouteBloc(scrollPositions: {});

  getIt.registerSingleton<LanguageBloc>(languageBloc);
  getIt.registerSingleton<HomeBloc>(homeBloc);
  getIt.registerSingleton<ProductsBloc>(productsBloc);
  getIt.registerSingleton<ScrollAndRouteBloc>(scrollAndRouteBloc);
}

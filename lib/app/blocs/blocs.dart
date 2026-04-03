import 'package:get_it/get_it.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_event.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/common_cloud_service/common_cloud_service.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final commonCloudService = CommonCloudService();

  final generalStateBloc = GeneralStateBloc(commonCloudService);
  generalStateBloc.add(FetchHomePageImageFileName());

  final productsRepository = ProductsRepository(commonCloudService);
  final productsBloc = ProductsBloc(productsRepository);
  productsBloc.add(FetchProducts());

  final scrollAndRouteBloc = ScrollAndRouteBloc(scrollPositions: {});

  getIt.registerSingleton<GeneralStateBloc>(generalStateBloc);
  getIt.registerSingleton<ProductsBloc>(productsBloc);
  getIt.registerSingleton<ScrollAndRouteBloc>(scrollAndRouteBloc);
}

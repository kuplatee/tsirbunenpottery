import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/domain/bloc/utils.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc(this._productsRepository) : super(const ProductsState()) {
    on<ProductsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    return switch (event) {
      final BlocStatusChanged e => _onBlocStatusChanged(e, emit),
      final FetchProducts e => _onFetchProducts(e, emit),
      final ProductsEvent _ => emit(state),
    };
  }

  Future<void> _onBlocStatusChanged(
      BlocStatusChanged event, Emitter<ProductsState> emit) async {
    emit(state.copyWithStateChange(newStatus: event.status));
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductsState> emit) async {
    emit(
        state.copyWithStateChange(newStatus: const BlocStatus(Status.loading)));

    try {
      final products = await _productsRepository.fetchProductData();
      final data = organizeProductsData(products);
      final newState = ProductsState(
        piecesById: data["piecesById"],
        designsById: data["designsById"],
        collections: data["collections"],
        categories: data["categories"],
        collectionDesigns: data["collectionDesigns"],
        categoryDesigns: data["categoryDesigns"],
        allDesigns: data["allDesigns"],
        imageFileNamesByDesignId: data["imageFileNamesByDesignId"],
        blocStatus: const BlocStatus(Status.ok),
      );

      emit(newState);
    } catch (e) {
      emit(state.copyWithStateChange(
          newStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}

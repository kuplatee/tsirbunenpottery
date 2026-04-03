import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'utils.dart';

class BlocStatusIs extends Matcher {
  final BlocStatus expectedBlocStatus;
  const BlocStatusIs(this.expectedBlocStatus);

  @override
  bool matches(Object? actualValue, Map matchState) {
    final state = actualValue as ProductsState;
    final blocStatus = state.blocStatus;
    return blocStatus.status == expectedBlocStatus.status &&
        blocStatus.message == expectedBlocStatus.message;
  }

  @override
  Description describe(Description description) {
    return description
        .add('Matches the bloc status state and possible message');
  }
}

class BlocProductDataAndStatusMatch extends Matcher {
  final Products expectedProducts;
  final BlocStatus expectedBlocStatus;

  const BlocProductDataAndStatusMatch(
    this.expectedProducts,
    this.expectedBlocStatus,
  );

  @override
  bool matches(Object? actualValue, Map matchState) {
    final state = actualValue as ProductsState;
    final organizedData = {
      'piecesById': state.piecesById,
      'designsById': state.designsById,
      'collectionDesigns': state.collectionDesigns,
      'categoryDesigns': state.categoryDesigns,
      'allDesigns': state.allDesigns,
      'collections': state.collections,
      'categories': state.categories,
    };

    verifyProductsDataIsSuperficiallyProperlyOrganized(organizedData);
    verifyNoEmptyCollectionsOrCategoriesInMappings(organizedData);
    verifyCollectionMappingDesignPiecesAreCorrect(organizedData);

    return BlocStatusIs(expectedBlocStatus).matches(state, matchState);
  }

  @override
  Description describe(Description description) {
    return description
        .add('Matches the bloc status state and possible message');
  }
}

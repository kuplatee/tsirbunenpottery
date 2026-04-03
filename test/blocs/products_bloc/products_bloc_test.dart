import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/domain/bloc/utils.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';
import 'products_bloc_matchers.dart';
import 'products_repository_mock.dart';
import 'test_products.dart';
import 'utils.dart';

const okStatus = BlocStatus(Status.ok);
const errorStatus = BlocStatus(Status.error, message: 'Some error');

void main() {
  group('PRODUCTS BLOC >', () {
    group('UTILS -', () {
      test('Product data is properly organized (superficial check)', () {
        final organizedData = organizeProductsData(testProducts);
        verifyProductsDataIsSuperficiallyProperlyOrganized(organizedData);
      });

      test(
          'Product data design-mappings do not contain empty collections or categories',
          () {
        final organizedData = organizeProductsData(testProducts);
        verifyNoEmptyCollectionsOrCategoriesInMappings(organizedData);
      });

      test('Product data is properly organized (detailed content check)', () {
        final organizedData = organizeProductsData(testProducts);
        verifyCollectionMappingDesignPiecesAreCorrect(organizedData);
        verifyTestDesigns(organizedData);
      });
    });
    group('BLOC STATE -', () {
      test('Initial status is ok', () {
        final piecesRepository = ProductsRepository();
        final bloc = ProductsBloc(piecesRepository);
        expect(bloc.state, const BlocStatusIs(okStatus));
      });

      blocTest(
        'Bloc status can be changed',
        build: () {
          final piecesRepository = ProductsRepository();
          final bloc = ProductsBloc(piecesRepository);
          return bloc;
        },
        act: (bloc) => bloc..add(BlocStatusChanged(errorStatus)),
        expect: () => [
          const BlocStatusIs(errorStatus),
        ],
      );

      blocTest(
        'Fetched product data is stored in bloc state',
        build: () {
          final productRepository = createTestProductRepository();
          final bloc = ProductsBloc(productRepository);
          return bloc;
        },
        act: (bloc) => bloc..add(FetchProducts()),
        expect: () => [
          const BlocStatusIs(BlocStatus(Status.loading)),
          BlocProductDataAndStatusMatch(testProducts, okStatus),
        ],
      );
    });
  });
}

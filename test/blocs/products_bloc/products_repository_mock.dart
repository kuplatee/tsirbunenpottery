import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'test_products.dart';

@GenerateNiceMocks([MockSpec<ProductsRepository>()])
import 'products_repository_mock.mocks.dart';

ProductsRepository createTestProductRepository() {
  final ProductsRepository productsRepository = MockProductsRepository();
  when(productsRepository.fetchProductData()).thenAnswer(
    (_) async => Future.value(testProducts),
  );

  return productsRepository;
}

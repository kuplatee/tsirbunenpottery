import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';
import 'package:madmudmobile/data/cloud_service.dart';
import 'package:madmudmobile/data/products_repository.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_bloc.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_event.dart';
import 'package:madmudmobile/features/categories/domain/bloc/categories_state.dart';
import 'package:madmudmobile/features/categories/repository/categories_repository.dart';

import '../../utils/data_cloud_service.dart';

class _FailingCloudService implements CloudService {
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
      throw Exception('Network failure');
}

CategoriesBloc _makeBlocWithData() =>
    CategoriesBloc(CategoriesRepository(ProductsRepository(DataCloudService())));

CategoriesBloc _makeBlocFailing() => CategoriesBloc(
    CategoriesRepository(ProductsRepository(_FailingCloudService())));

void main() {
  group('Feature Categories >', () {
    group('CategoriesBloc -', () {
      test('initial state is ok status with empty collections', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.categories, isEmpty);
        expect(bloc.state.categoryDesigns, isEmpty);
        bloc.close();
      });

      blocTest<CategoriesBloc, CategoriesState>(
        'FetchCategories transitions: loading → ok with 4 categories',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchCategories()),
        expect: () => [
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<CategoriesState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.categories.length == 4 &&
                s.categoryDesigns.containsKey('cat-1') &&
                !s.categoryDesigns.containsKey('cat-4'),
            'ok state with data — empty category excluded',
          ),
        ],
      );

      blocTest<CategoriesBloc, CategoriesState>(
        'FetchCategories emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchCategories()),
        expect: () => [
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.error,
            'error state',
          ),
        ],
      );
    });
  });
}

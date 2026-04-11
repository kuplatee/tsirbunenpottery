import 'app/app_test.dart' as app_test;
import 'app/localizations_test.dart' as localizations_test;
import 'utils/prepare_blocs_for_tests.dart' as bloc_test;
import 'routing/routing_test.dart' as routing_test;
import 'features/categories/categories_repository_test.dart'
    as categories_repository_test;
import 'features/categories/categories_bloc_test.dart' as categories_bloc_test;
import 'features/categories/categories_view_test.dart' as categories_view_test;

void main() {
  app_test.main();
  localizations_test.main();
  bloc_test.prepareBlocsForTests();
  routing_test.main();
  categories_repository_test.main();
  categories_bloc_test.main();
  categories_view_test.main();
}

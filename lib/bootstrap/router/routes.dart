import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/features/collections/presentation/pages/collections_page.dart';
import 'package:tsirbunenpottery/features/contact/presentation/pages/contact_page.dart';
import 'package:tsirbunenpottery/features/categories/presentation/pages/categories_page.dart';
import 'package:tsirbunenpottery/features/designs/presentation/pages/designs_page.dart';
import 'package:tsirbunenpottery/features/home/presentation/pages/home_page.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/pages/single_piece_page.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/pages/pieces_page.dart';

// Note: We want to use type-safe routes, and for that, go_router supports using routes
// generated with the go_router_builder package (that uses build_runner under the hood).
// Using "part" to import code is generally discouraged by the Dart team, but widely used
// in the Flutter community in cases of code generation and here we also resort to that
// to import the generated code parts.
part 'routes.g.dart';

const piecesRoot = '/pieces';
const collectionsRoot = '/collections';
const categoriesRoot = '/categories';
const designsRoot = '/designs';
const contactRoot = '/contact';
const storyRoot = '/story';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
@immutable
class HomeRoute extends GoRouteData with $HomeRoute {
  static const path = '/';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: HomePage());
}

@TypedGoRoute<PiecesRoute>(
  path: PiecesRoute.path,
  routes: [TypedGoRoute<PieceRoute>(path: PieceRoute.path)],
)
@immutable
class PiecesRoute extends GoRouteData with $PiecesRoute {
  static const path = piecesRoot;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: PiecesPage());
}

@immutable
class PieceRoute extends GoRouteData with $PieceRoute {
  static const path = ':id';
  final String id;

  const PieceRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: SinglePiecePage(id: id));
}

@TypedGoRoute<CollectionsRoute>(
  path: CollectionsRoute.path,
  routes: [TypedGoRoute<CollectionRoute>(path: CollectionRoute.path)],
)
@immutable
class CollectionsRoute extends GoRouteData with $CollectionsRoute {
  static const path = collectionsRoot;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: CollectionsPage());
}

@immutable
class CollectionRoute extends GoRouteData with $CollectionRoute {
  static const path = ':id';
  final String id;

  const CollectionRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: CollectionsPage(selectedCollectionId: id));
}

@TypedGoRoute<CategoriesRoute>(
  path: CategoriesRoute.path,
  routes: [TypedGoRoute<CategoryRoute>(path: CategoryRoute.path)],
)
@immutable
class CategoriesRoute extends GoRouteData with $CategoriesRoute {
  static const path = categoriesRoot;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: CategoriesPage());
}

@immutable
class CategoryRoute extends GoRouteData with $CategoryRoute {
  static const path = ':id';
  final String id;

  const CategoryRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: CategoriesPage(selectedCategoryId: id));
}

@TypedGoRoute<DesignsRoute>(path: DesignsRoute.path)
@immutable
class DesignsRoute extends GoRouteData with $DesignsRoute {
  static const path = designsRoot;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: DesignsPage());
}

@TypedGoRoute<ContactRoute>(path: ContactRoute.path)
@immutable
class ContactRoute extends GoRouteData with $ContactRoute {
  static const path = contactRoot;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: ContactPage());
}


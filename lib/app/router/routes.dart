import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/features/products/presentation/pages/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/pages/contact_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/categories_page.dart';
import 'package:madmudmobile/features/home/presentation/pages/home_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/single_piece_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/pieces_page.dart';

// Note: We want to use type-safe routes, and for that, go_router supports using routes
// generated with the go_router_builder package (that uses build_runner under the hood).
// Using "part" to import code is generally discouraged by the Dart team, but widely used
// in the Flutter community in cases of code generation and here we also resort to that
// to import the generated code parts.
part 'routes.g.dart';

const piecesRoot = '/pieces';
const collectionsRoot = '/collections';
const categoriesRoot = '/categories';
// const designsRoot = '/designs';
const contactRoot = '/contact';
const storyRoot = '/story';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, routes: [
  TypedGoRoute<HomeRoute>(path: HomeRoute.path),
  TypedGoRoute<PiecesRoute>(path: PiecesRoute.path),
  TypedGoRoute<CollectionsRoute>(path: CollectionsRoute.path),
  TypedGoRoute<CollectionRoute>(path: CollectionRoute.path),
  TypedGoRoute<CategoriesRoute>(path: CategoriesRoute.path),
  TypedGoRoute<CategoryRoute>(path: CategoryRoute.path),
  // TypedGoRoute<DesignsRoute>(path: DesignsRoute.path),
  // TypedGoRoute<DesignRoute>(path: DesignRoute.path),
  TypedGoRoute<ContactRoute>(path: ContactRoute.path),
  // TypedGoRoute<StoryRoute>(path: StoryRoute.path),
]) // NOTE: No space here, otherwise the go router builder code generation won't work!
@immutable
class HomeRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@immutable
class PiecesRoute extends GoRouteData {
  static const path = piecesRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) => const PiecesPage();
}

@immutable
class PieceRoute extends GoRouteData {
  static const path = '$piecesRoot/:id';
  final String id;
  final bool fromRoute;

  const PieceRoute({
    required this.id,
    required this.fromRoute,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SinglePiecePage(id: id);
  }
}

@immutable
class CollectionsRoute extends GoRouteData {
  static const path = collectionsRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CollectionsPage();
}

@immutable
class CollectionRoute extends GoRouteData {
  static const path = '$collectionsRoot/:id';
  final String id;

  const CollectionRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CollectionsPage(selectedCollectionId: id);
}

@immutable
class CategoriesRoute extends GoRouteData {
  static const path = categoriesRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CategoriesPage();
}

@immutable
class CategoryRoute extends GoRouteData {
  static const path = '$categoriesRoot/:id';
  final String id;

  const CategoryRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CategoriesPage(selectedCategoryId: id);
}

// @immutable
// class DesignsRoute extends GoRouteData {
//   static const path = designsRoot;

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const DesignsPage();
// }

// @immutable
// class DesignRoute extends GoRouteData {
//   static const path = '$designsRoot/:id';
//   final String id;
//   final bool fromRoute;

//   const DesignRoute({
//     required this.id,
//     required this.fromRoute,
//   });

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return DesignPage(id: id);
//   }
// }

@immutable
class ContactRoute extends GoRouteData {
  static const path = contactRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ContactPage();
}

// @immutable
// class StoryRoute extends GoRouteData {
//   static const path = storyRoot;

//   @override
//   Widget build(BuildContext context, GoRouterState state) => const StoryPage();
// }

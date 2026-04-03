// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/features/products/presentation/pages/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/pages/contact_page.dart';
import 'package:madmudmobile/features/home/presentation/pages/home_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/categories_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/single_piece_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/pieces_page.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/app/router/routes.dart';

const piecesPageName = 'Pieces';
const categoryPageName = 'Category';
const collectionPageName = 'Collection';
const designPageName = 'Design';

// NOTE: Use NoTransitionPage to avoid the disturbing slide in effect
// that does not look good in desktop mobile

class RouteController {
  RouteController();

  GoRouter buildRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: HomeRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.home.pageName()),
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: piecesRoot,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.pieces.pageName()),
            child: const PiecesPage(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;

                return NoTransitionPage(
                  name: piecesPageName,
                  child: SinglePiecePage(id: id),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: collectionsRoot,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.collections.pageName()),
            child: const CollectionsPage(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;

                return NoTransitionPage(
                  name: collectionPageName,
                  child: CollectionsPage(selectedCollectionId: id),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: categoriesRoot,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.categories.pageName()),
            child: const CategoriesPage(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;

                return NoTransitionPage(
                  name: categoryPageName,
                  child: CategoriesPage(selectedCategoryId: id),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: ContactRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.contact.pageName()),
            child: const ContactPage(),
          ),
        ),
      ],
    );
  }
}

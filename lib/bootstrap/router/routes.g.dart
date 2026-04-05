// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $HomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/pieces',
          factory: $PiecesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/collections',
          factory: $CollectionsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/collections/:id',
          factory: $CollectionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/categories',
          factory: $CategoriesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/categories/:id',
          factory: $CategoryRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/contact',
          factory: $ContactRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PiecesRouteExtension on PiecesRoute {
  static PiecesRoute _fromState(GoRouterState state) => PiecesRoute();

  String get location => GoRouteData.$location(
        '/pieces',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CollectionsRouteExtension on CollectionsRoute {
  static CollectionsRoute _fromState(GoRouterState state) => CollectionsRoute();

  String get location => GoRouteData.$location(
        '/collections',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CollectionRouteExtension on CollectionRoute {
  static CollectionRoute _fromState(GoRouterState state) => CollectionRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/collections/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoriesRouteExtension on CategoriesRoute {
  static CategoriesRoute _fromState(GoRouterState state) => CategoriesRoute();

  String get location => GoRouteData.$location(
        '/categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoryRouteExtension on CategoryRoute {
  static CategoryRoute _fromState(GoRouterState state) => CategoryRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/categories/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ContactRouteExtension on ContactRoute {
  static ContactRoute _fromState(GoRouterState state) => ContactRoute();

  String get location => GoRouteData.$location(
        '/contact',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

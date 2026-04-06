// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $piecesRoute,
      $collectionsRoute,
      $categoriesRoute,
      $designsRoute,
      $contactRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRoute._fromState,
    );

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $piecesRoute => GoRouteData.$route(
      path: '/pieces',
      factory: $PiecesRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $PieceRoute._fromState,
        ),
      ],
    );

mixin $PiecesRoute on GoRouteData {
  static PiecesRoute _fromState(GoRouterState state) => PiecesRoute();

  @override
  String get location => GoRouteData.$location(
        '/pieces',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PieceRoute on GoRouteData {
  static PieceRoute _fromState(GoRouterState state) => PieceRoute(
        id: state.pathParameters['id']!,
      );

  PieceRoute get _self => this as PieceRoute;

  @override
  String get location => GoRouteData.$location(
        '/pieces/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $collectionsRoute => GoRouteData.$route(
      path: '/collections',
      factory: $CollectionsRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $CollectionRoute._fromState,
        ),
      ],
    );

mixin $CollectionsRoute on GoRouteData {
  static CollectionsRoute _fromState(GoRouterState state) => CollectionsRoute();

  @override
  String get location => GoRouteData.$location(
        '/collections',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CollectionRoute on GoRouteData {
  static CollectionRoute _fromState(GoRouterState state) => CollectionRoute(
        id: state.pathParameters['id']!,
      );

  CollectionRoute get _self => this as CollectionRoute;

  @override
  String get location => GoRouteData.$location(
        '/collections/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $categoriesRoute => GoRouteData.$route(
      path: '/categories',
      factory: $CategoriesRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $CategoryRoute._fromState,
        ),
      ],
    );

mixin $CategoriesRoute on GoRouteData {
  static CategoriesRoute _fromState(GoRouterState state) => CategoriesRoute();

  @override
  String get location => GoRouteData.$location(
        '/categories',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CategoryRoute on GoRouteData {
  static CategoryRoute _fromState(GoRouterState state) => CategoryRoute(
        id: state.pathParameters['id']!,
      );

  CategoryRoute get _self => this as CategoryRoute;

  @override
  String get location => GoRouteData.$location(
        '/categories/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $designsRoute => GoRouteData.$route(
      path: '/designs',
      factory: $DesignsRoute._fromState,
    );

mixin $DesignsRoute on GoRouteData {
  static DesignsRoute _fromState(GoRouterState state) => DesignsRoute();

  @override
  String get location => GoRouteData.$location(
        '/designs',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $contactRoute => GoRouteData.$route(
      path: '/contact',
      factory: $ContactRoute._fromState,
    );

mixin $ContactRoute on GoRouteData {
  static ContactRoute _fromState(GoRouterState state) => ContactRoute();

  @override
  String get location => GoRouteData.$location(
        '/contact',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

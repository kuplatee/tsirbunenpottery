import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';

class RouteController {
  RouteController();

  GoRouter buildRouter() {
    return GoRouter(routes: $appRoutes);
  }
}

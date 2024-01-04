import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/features/home.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}

@singleton
class AppNavigator {
  AppRouter router = AppRouter();
}

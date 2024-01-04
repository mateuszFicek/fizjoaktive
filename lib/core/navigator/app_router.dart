import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/features/home.dart';
import 'package:injectable/injectable.dart';

import '../../features/authentication/presentation/pages/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter() {
    push(const LoginRoute());
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
      ];
}

@singleton
class AppNavigator {
  AppRouter router = AppRouter();
}

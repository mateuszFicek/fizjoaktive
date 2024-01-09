import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/clients/presentation/pages/clients_page.dart';
import '../../features/home_screen/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter() {
    /// TODO: handle authenticated user -> navigate to login if not authenticated
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ClientsRoute.page),
      ];
}

@singleton
class AppNavigator {
  AppRouter router = AppRouter();

  Future<void> navigateHome() async {
    router.replace(const HomeRoute());
  }

  Future<void> navigateToAllClients() async =>
      router.push(const ClientsRoute());
}

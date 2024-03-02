import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/client/presentation/pages/client_page.dart';
import '../../features/clients/domain/models/client.dart';
import '../../features/clients/presentation/pages/clients_page.dart';
import '../../features/home_screen/presentation/pages/home_page.dart';
import '../../features/patients/presentation/pages/patients_page.dart';

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
        AutoRoute(page: ClientRoute.page),
        AutoRoute(page: PatientsRoute.page),
      ];
}

@singleton
class AppNavigator {
  AppRouter router = AppRouter();
  Future<void> navigateHome() async {
    router.replace(const HomeRoute());
  }

  Future<void> navigateToAllClients() async => router.push(ClientsRoute());
  Future<void> navigateToClientPage(Client client) async =>
      router.push(ClientRoute(client: client));

  Future<void> navigateToAllPatients() async => router.push(PatientsRoute());
  Future<void> navigateToPatientPage(Client client) async =>
      router.push(ClientRoute(client: client));
}

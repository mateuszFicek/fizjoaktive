import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../clients/domain/models/client.dart';

@RoutePage()
class ClientPage extends StatelessWidget {
  final Client client;
  const ClientPage({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

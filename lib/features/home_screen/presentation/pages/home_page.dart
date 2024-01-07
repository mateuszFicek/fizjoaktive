import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/home_drawer.dart';
import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: HomeDrawer(),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/calendar_section.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      shrinkWrap: true,
      children: const [
        CalendarSection(),
      ],
    );
  }
}

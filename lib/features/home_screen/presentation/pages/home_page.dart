import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/calendar_section.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/home_drawer.dart';
import 'package:fizjoaktive/features/home_screen/presentation/widgets/recent_patients_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Gap(MediaQuery.of(context).padding.top),
        const CalendarSection(),
        const Flexible(child: RecentPatientsSection()),
      ],
    );
  }
}

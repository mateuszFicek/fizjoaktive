import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/injectable/injectable_config.dart';
import 'core/navigator/app_router.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppNavigator>().router.config(),
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.nunitoSansTextTheme()),
    );
  }
}

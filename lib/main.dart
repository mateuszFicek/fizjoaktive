import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fizjoaktive/firebase_options.dart';
import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/injectable/injectable_config.dart';
import 'core/navigator/app_router.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppNavigator>().router.config(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
            foregroundColor: MaterialStatePropertyAll(AppColors.white),
            textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: Sizes.fontSizes.mediumFont,
            )),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.gapSizes.size4),
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
    );
  }
}

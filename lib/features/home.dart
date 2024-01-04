import 'package:auto_route/auto_route.dart';
import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: AppColors.accentColor,
          child: Center(
            child: Text(
              "HELLO WORLD",
              style: TextStyle(
                fontSize: Sizes.fontSizes.largeFont,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

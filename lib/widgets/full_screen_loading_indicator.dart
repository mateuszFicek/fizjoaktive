import 'package:fizjoaktive/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FullScreenLoadingWrapper extends StatelessWidget {
  final Widget child;
  final bool showLoadingIndicator;
  const FullScreenLoadingWrapper({
    super.key,
    required this.child,
    required this.showLoadingIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(ignoring: showLoadingIndicator, child: child),
        if (showLoadingIndicator)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.black.withOpacity(0.25),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.darkBlue,
              ),
            ),
          ),
      ],
    );
  }
}

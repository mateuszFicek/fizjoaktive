import 'package:fizjoaktive/theme/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextStyle get titleTextStyle => TextStyle(
        fontSize: Sizes.fontSizes.largeFont,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get subtitleTextStyle => TextStyle(
        fontSize: Sizes.fontSizes.mediumFont,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get buttonTextStyle => TextStyle(
        fontSize: Sizes.fontSizes.mediumFont,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get header1TextStyle => TextStyle(
        fontSize: Sizes.fontSizes.mediumFont,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get header1BoldTextStyle => TextStyle(
        fontSize: Sizes.fontSizes.mediumFont,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get header2TextStyle => TextStyle(
        fontSize: Sizes.fontSizes.regularFont,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get header3TextStyle => TextStyle(
        fontSize: Sizes.fontSizes.smallFont,
        fontWeight: FontWeight.w400,
      );
}

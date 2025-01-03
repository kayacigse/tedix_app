import 'package:flutter/material.dart';
import 'package:tedix/utils/theme/custom_themes/text_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/chip_theme.dart';

class TAppTheme {
  TAppTheme._();//private

  static ThemeData lightTheme = ThemeData(
    useMaterial3:  true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationtheme,
  );


}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/app_colors.dart';

enum MyTheme {
  dark,
  light,
  system,
}

class AppTheme {
  static MyTheme _currentTheme = MyTheme.system;
  static ThemeData context = ThemeData();
  static double borderRadius = 0.sp;

  static ThemeData _light() {
    borderRadius = 25.sp;
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.grayDark,
        primaryContainer: AppColors.grayLight,
        onPrimary: AppColors.white,
        secondary: AppColors.milkDark,
        secondaryContainer: AppColors.milkLight,
        onSecondary: AppColors.black,
        tertiaryContainer: AppColors.black,
        onTertiary: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.sp),
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: AppColors.white,
              width: 1.sp,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      shadowColor: AppColors.black,
      dialogBackgroundColor: AppColors.white,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
      ),
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  static ThemeData _dark() {
    borderRadius = 25.sp;
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        primary: AppColors.grayDark,
        primaryContainer: AppColors.white,
        onPrimary: AppColors.white,
        secondary: AppColors.grayDark,
        secondaryContainer: AppColors.grayLight,
        onSecondary: AppColors.black,
        tertiaryContainer: AppColors.white,
        onTertiary: AppColors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.sp),
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: AppColors.white,
              width: 1.sp,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      shadowColor: AppColors.black,
      dialogBackgroundColor: AppColors.grayLight,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      scaffoldBackgroundColor: AppColors.black,
    );
  }

  static ThemeData get lightTheme => _light();

  static ThemeData get darkTheme => _dark();

  static ThemeMode currentMode() {
    switch (_currentTheme) {
      case MyTheme.dark:
        return ThemeMode.dark;
      case MyTheme.light:
        return ThemeMode.light;
      case MyTheme.system:
      default:
        return ThemeMode.system;
    }
  }

  static void changeTheme(MyTheme theme) {
    switch (theme) {
      case MyTheme.dark:
        _currentTheme = MyTheme.dark;
        break;
      case MyTheme.light:
        _currentTheme = MyTheme.light;
        break;
      case MyTheme.system:
      default:
        _currentTheme = MyTheme.system;
        // добавить проверку на системную
        break;
    }
  }
}

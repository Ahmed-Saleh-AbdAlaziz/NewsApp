import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/them/AppColors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primryColor,
    scaffoldBackgroundColor: AppColors.backGruondColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primryColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.primryColor,
      unselectedItemColor: AppColors.grayColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(
          color: Colors.white,
          width: 5,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: AppColors.whiteColor,
        fontSize: 1,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

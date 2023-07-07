import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 10.0;

Color jPrimaryColor = const Color(0xff1A3665);
Color jBlackColor = const Color(0xff1F1449);
Color jWhiteColor = const Color(0xffFFFFFF);
Color jGreyColor = const Color(0xff9698A9);
Color jGreenColor = const Color(0xff0EC3AE);
Color jBlueColor = const Color(0xffe3fcff);
Color jRedColor = const Color(0xffEB70A5);
Color jBackgroundColor = const Color(0xffFAFAFA);
Color jInactiveColor = const Color(0xffDBD7EC);
Color jTransparentColor = Colors.transparent;
Color jAvailableColor = const Color(0xffE0D9FF);
Color jUnavailableColor = const Color(0xffEBECF1);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: jBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: jWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: jGreyColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: jGreenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: jRedColor,
);
TextStyle myPrimaryTextStyle = GoogleFonts.poppins(
  color: jPrimaryColor,
);

BottomNavigationBarThemeData bottomNavigationBarTheme = 
  BottomNavigationBarThemeData(
                selectedItemColor: jPrimaryColor,
                unselectedItemColor: jGreyColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ColorScheme jColorScheme = ColorScheme(
  primary: jPrimaryColor,
  primaryContainer: jBlackColor,
  secondary: jGreenColor,
  secondaryContainer:jGreenColor,
  surface: jBlackColor,
  background: jBackgroundColor,
  error: Colors.red,
  onPrimary: jPrimaryColor,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);

import 'dart:developer';

import 'package:flow_admin_panel/components/local_storage.dart';
import 'package:flow_admin_panel/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends ChangeNotifier {
  late ThemeData _theme;

  AppTheme(BuildContext context) {
    _theme = Theme.of(context).brightness == Brightness.light ? lightTheme : darkTheme;
  }

  static Future<bool> getLightMode() async {
    bool? result = await LocalStorage.getBool('lightMode');
    if(result == null) {
      await LocalStorage.saveBool('lightMode', true);
      return true;
    } else {
      return result;
    }
  }

  ThemeData get theme => _theme;

  bool get isLightMode => _theme.brightness == Brightness.light;

  Future<void> toggleTheme() async {
    await LocalStorage.saveBool('lightMode', !isLightMode);
    final temp = isLightMode ? darkTheme : lightTheme;
    if(temp == _theme) return;
    _theme = temp;
    notifyListeners();
  }

  Future<void> setTheme(Brightness brightness) async {
    await LocalStorage.saveBool('lightMode', brightness == Brightness.light);
    final temp = _theme.copyWith(brightness: brightness);
    if(temp == _theme) return;
    _theme = temp;
    notifyListeners();
  }

  Future<void> setLightMode(bool isLightMode) async {
    await LocalStorage.saveBool('lightMode', isLightMode);
    final temp = isLightMode ? lightTheme : darkTheme;
    if(temp == _theme) return;
    _theme = temp;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  tabBarTheme: TabBarTheme(
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColor.lightRed, width: 4.0),
    ),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey.shade400,
    unselectedLabelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 10),
    dividerColor: Colors.transparent,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: const TextStyle(
        fontSize: 12, letterSpacing: 1.3, fontWeight: FontWeight.w500),
  ),
  primaryColor: AppColor.lightRed,
  primaryColorDark: AppColor.darkRed,
  scaffoldBackgroundColor: AppColor.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2b2119),
  ),
  cardColor: Colors.white,
  shadowColor: const Color(0x33000000),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  tabBarTheme: TabBarTheme(
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColor.lightRed, width: 4.0),
    ),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey.shade800,
    unselectedLabelStyle: TextStyle(color: Colors.grey.shade800, fontSize: 10),
    dividerColor: Colors.transparent,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: const TextStyle(
        fontSize: 12, letterSpacing: 1.3, fontWeight: FontWeight.w500),
  ),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  iconTheme: const IconThemeData(color: Colors.black),
  primaryColor: AppColor.lightAmber,
  primaryColorDark: AppColor.darkAmber,
  cardColor: const Color(0xFF323232),
  shadowColor: const Color(0x33000000),
);

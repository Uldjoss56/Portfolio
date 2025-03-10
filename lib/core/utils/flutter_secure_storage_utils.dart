import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageUtils {
  static final FlutterSecureStorage storage = const FlutterSecureStorage();
  static bool appIsInit = false;
  static ThemeMode themeMode = ThemeMode.system;

  static Future<bool> initApp() async {
    String? isInit = await storage.read(
      key: "appIsInit",
    );
    appIsInit = isInit == "1";
    return appIsInit;
  }

  static Future<bool> setAppIsInit(bool value) async {
    await storage.write(
      key: "appIsInit",
      value: value ? "1" : "0",
    );
    appIsInit = value;
    return appIsInit;
  }

  static bool appIsInitValue() {
    return appIsInit;
  }

  static Future<ThemeMode> initThemeMode() async {
    themeMode = await getThemeModeFromStorage();
    return themeMode;
  }

  static Future<ThemeMode> setThemeMode(ThemeMode mode) async {
    await storage.write(
      key: "themeIndex",
      value: mode.index.toString(),
    );
    themeMode = mode;
    return themeMode;
  }

  static Future<ThemeMode> getThemeModeFromStorage() async {
    String? themeIndexStr = await storage.read(key: "themeIndex");
    int themeIndex = int.tryParse(
          themeIndexStr ?? "0",
        ) ??
        0;
    return ThemeMode.values[themeIndex];
  }

  static ThemeMode getThemeMode() {
    return themeMode;
  }
}

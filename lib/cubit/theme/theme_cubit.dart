import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/flutter_secure_storage_utils.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  Future<void> init() async {
    final themeMode = await FlutterSecureStorageUtils.initThemeMode();
    emit(themeMode);
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    final data = await FlutterSecureStorageUtils.setThemeMode(themeMode);
    emit(data);
  }
}

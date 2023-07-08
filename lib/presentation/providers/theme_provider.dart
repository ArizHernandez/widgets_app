import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);
final colorListProvider = StateProvider<List<Color>>((ref) => colorList);
final selectedColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<_ThemeNotifier, AppTheme>(
  (ref) => _ThemeNotifier(),
);

class _ThemeNotifier extends StateNotifier<AppTheme> {
  _ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}

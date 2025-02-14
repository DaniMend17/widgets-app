import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider<bool>((ref) => false,);

//Agregar un provider que nunca cambiara.
final colorListProvider = Provider((ref) => colorList,);

final selectedIndexColorProvider = StateProvider((ref) => 0);

//Tener la instancia de una clase como Provider.
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier(),);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());
  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex({required int index}){
    state = state.copyWith(selectedColor: index);
  }
}
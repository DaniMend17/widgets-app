import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider<bool>((ref) => false,);

//Agregar un provider que nunca cambiara.
final colorListProvider = Provider((ref) => colorList,);

final selectedIndexColorProvider = StateProvider((ref) => 0);
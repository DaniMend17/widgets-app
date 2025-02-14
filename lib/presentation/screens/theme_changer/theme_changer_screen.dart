import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/app_theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(onPressed: (){
            ref.read(isDarkProvider.notifier).update((state) => !state);
          },
           icon: Icon(!isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          )
        ],
      ),
      body: _ColorList(),
    );
  }
}

class _ColorList extends ConsumerWidget {
  const _ColorList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int colorSelectedIndex = ref.watch(selectedIndexColorProvider); 
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: colorSelectedIndex, 
          onChanged:(value) {
            ref.read(selectedIndexColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
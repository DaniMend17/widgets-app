import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/app_theme_provider.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider); 
    final bool isDarkMode = ref.watch(isDarkProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkProvider.notifier).update((state) => !state); 
            }, 
            icon: Icon(!isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          ) 
          
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: TextStyle(
            fontSize: 25
          ),
        )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){
            ref.read(counterProvider.notifier).state++;
          },
          child: Icon(Icons.add),
        )
      )
    );
  }
}
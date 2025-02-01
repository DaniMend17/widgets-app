import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('buttons_screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: IconButton(
          onPressed: () {
            //Regresar a la pantalla anterior.
            context.pop();
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      //Va a tomar todo el ancho del elemento padre.
      //Si el elemento padre no tiene un tamaño definido marcara error.
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Wrap(
          //Añade espacio entre los elementos del wrap.
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('elevated button.')),
            ElevatedButton(
                onPressed: null, child: const Text('elevated disabled.')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: const Text('icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled button.')),
            FilledButton.icon(
                onPressed: () {},
                label: const Text('Filled icon'),
                icon: const Icon(Icons.ac_unit_rounded)),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined button.')),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outlined icon.'),
              icon: const Icon(Icons.terminal),
            ),
            CustomButton(
              colorScheme: colors,
            ),
            CustomButton(
              colorScheme: colors,
              onTap: (){

              },
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.adb)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.adb),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ColorScheme colorScheme;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.colorScheme, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //Agregar borde circular al botón.
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: (onTap == null)? Colors.grey : colorScheme.primary,
        child: InkWell(
          onTap: onTap,
          // splashColor: color.secondary,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola mundo', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}

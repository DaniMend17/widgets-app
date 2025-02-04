import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                //EN el onPressed de este botón se dispara el alertMessage.
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo.'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        onPressed: () => showCustomSnackBar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  //Métodos de mi clase para mostrar snackbars y alert messages.

  //Creamos un método para crear un snackbar personalizado,
  //Este tiene que recibir el context debido a que es aqui en donde se va a mostrar.
  void showCustomSnackBar(BuildContext context) {
    //Hace que el snackbar anterior se oculte cuando este tenga que volver a mostrarse.
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar customSnackBar = SnackBar(
      content: const Text('hola mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      //IMPORTANTE: HACE QUE EL ALERT MESSAGE NO SE PUEDA CERRAR HASTA QUE SE PRECIONE UN BOTÓN.
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Eiusmod officia reprehenderit proident ex labore minim. Voluptate nulla magna id do adipisicing esse irure commodo proident proident anim do deserunt mollit. Eu labore eiusmod pariatur nulla incididunt.'),
        actions: [
          TextButton(
              onPressed: () {
                //Desaparecemos el alertMessage.
                context.pop();
              },
              child: const Text('Cancelar')
          ),
          FilledButton(
              onPressed: () {
                //Desaparecemmos el alertMessage.
                context.pop();
              },
              child: Text('Aceptar')
          )
        ],
      ),
    );
  }
}

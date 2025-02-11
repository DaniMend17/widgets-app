import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/slide_menu.dart';

class HomeScreen extends StatelessWidget {
  //Agregamos esta propiedad para tener una referencia al nombre de la pantalla
  //en el router de nuestra aplicacion.
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material App'),
      ),
      body: ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final MenuItem menuItem = appMenuItems[index];
          return _CustomListTile(menuItem: menuItem);
        },
      ),
      drawer: SlideMenu()
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorTheme = Theme.of(context).primaryColor;

    return ListTile(
      iconColor: colorTheme,
      leading: Icon(
        menuItem.icon,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menuItem.title),
      subtitle: Text(
        menuItem.subTitle,
      ),
      onTap: () {
        //Cambiamos de pantalla en base a una ruta de nuestro router.
        context.push(menuItem.link);

        //Cambiamos de pantalla en base a un nombre de nuestro router.
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}

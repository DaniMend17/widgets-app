import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets en Flutter'),
      ),
      body: ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (BuildContext context, int index) {
          final MenuItem menuItem = appMenuItems[index];
          return _CustomListTile(menuItem: menuItem);
        },
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    
    final Color colorTheme = Theme.of(context).primaryColor;

    return ListTile(
      iconColor: colorTheme,
      leading: Icon(menuItem.icon,),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menuItem.title),
      subtitle: Text(
        menuItem.subTitle,
      ),
      onTap: () {
        
      },
    );
  }
}

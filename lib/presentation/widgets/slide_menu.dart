import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/menu/menu_items.dart';

class SlideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SlideMenu({super.key, required this.scaffoldKey});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  int navIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: navIndex,
      onDestinationSelected: (value) => setState(() {
        navIndex = value;
        final menuSelected = appMenuItems[value];
        context.push(menuSelected.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      }),

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25, hasNotch ? 10: 20, 0, 10),
          child: Text('Menu'),
        ),
        ...appMenuItems
        .sublist(0,3)
        .map(
          (element) {
            return NavigationDrawerDestination(
              icon:  Icon(element.icon), 
              label: Text(element.title)
            );
          }
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
          child: Text('More Options'),
        ),
        ...appMenuItems
        .sublist(3)
        .map(
          (element) {
            return NavigationDrawerDestination(
              icon:  Icon(element.icon), 
              label: Text(element.title)
            );
          }
        ),

      ]
    );
  }
}
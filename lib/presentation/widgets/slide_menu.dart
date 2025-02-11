import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  
  int navIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navIndex,
      onDestinationSelected: (value) => setState(() {
        navIndex = value;
      }),
      children: [
        NavigationDrawerDestination(
          icon: Icon(Icons.home), 
          label: Text('home')
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add), 
          label: Text('Option 1')
        ),
      ]
    );
  }
}
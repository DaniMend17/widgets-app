import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItems = [
  MenuItem(
      title: 'botones',
      subTitle: 'varios botones',
      link: '/buttons',
      icon: Icons.smart_button
  ),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor',
      link: '/cards',
      icon: Icons.credit_card
  ),
  MenuItem(
      title: 'ProgressIndicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded
  ),
  MenuItem(
      title: 'SnackBars',
      subTitle: 'snackbars',
      link: '/snackbars',
      icon: Icons.info_outline
  ),
  MenuItem(
    title: 'Ui Controls', 
    subTitle: 'uiControls', 
    link: '/ui-controls', 
    icon: Icons.pest_control_sharp
  )
];

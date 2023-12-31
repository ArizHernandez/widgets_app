import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card_outlined,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generals and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars and dialogs',
    subTitle: 'Screen indicators',
    link: '/snackbars',
    icon: Icons.info_outline_rounded,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'stateful widget animated',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'Ui controls + tiles',
    subTitle: 'Flutter controls serie',
    link: '/ui-controls',
    icon: Icons.construction_rounded,
  ),
  MenuItem(
    title: 'App tutorial',
    subTitle: 'Flutter tutorial serie',
    link: '/app-tutorial',
    icon: Icons.bedroom_child_outlined,
  ),
  MenuItem(
    title: 'Infine scroll and pull',
    subTitle: 'Infinite scroll and pull to refresh',
    link: '/infinite',
    icon: Icons.refresh_rounded,
  ),
];

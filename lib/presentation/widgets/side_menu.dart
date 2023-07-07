import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.menuItems,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  Iterable<NavigationDrawerDestination> getMenuListDrawer(
      List<MenuItem> menuList) {
    return menuList.map(
      (menuItem) => NavigationDrawerDestination(
        icon: Icon(menuItem.icon),
        label: Text(menuItem.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text("Menu"),
        ),
        ...getMenuListDrawer(widget.menuItems.sublist(0, 2)),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 10),
          child: Text("More Options"),
        ),
        ...getMenuListDrawer(
          widget.menuItems.sublist(2, widget.menuItems.length),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final selectedItem = appMenuItems[index];

        return _CustomListTile(selectedItem: selectedItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem selectedItem;

  const _CustomListTile({
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        selectedItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(selectedItem.title),
      subtitle: Text(selectedItem.subTitle),
      onTap: () {},
    );
  }
}

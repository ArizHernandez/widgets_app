import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snack_bar_screen";

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hello World"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and dialogs"),
      ),
      body: const _SnackBarView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Show snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}

class _SnackBarView extends StatelessWidget {
  const _SnackBarView();

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builderContext) => AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("This action cannot be undone"),
        actions: [
          TextButton(onPressed: () => builderContext.pop(), child: const Text("Cancel")),
          FilledButton(onPressed: () => builderContext.pop(), child: const Text("Accept")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    "To show the licenses of the libraries used in this app, press the button below"),
              ]);
            },
            child: const Text("Licenses"),
          ),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text("Show dialog"),
          )
        ],
      ),
    );
  }
}

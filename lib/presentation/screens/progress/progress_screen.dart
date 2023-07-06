import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(children: [
        const SizedBox(height: 30),
        const Text("Circular progress indicator"),
        const SizedBox(height: 10),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: colors.secondaryContainer,
        ),
        const SizedBox(height: 20),
        const Text("Circular and linear indicator controlled"),
        const SizedBox(height: 10),
        const _ControlledProgressIndicator()
      ]),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 500),
        (value) {
          return (value * 2) / 100;
        },
      ).takeWhile((value) => value > 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progressValue,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(value: progressValue),
              )
            ],
          ),
        );
      },
    );
  }
}

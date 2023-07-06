import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/slide.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final List<SlideInfo> slides = [
  SlideInfo(
      title: "Search food",
      caption:
          "Officia Lorem ullamco consectetur reprehenderit enim sit nostrud qui tempor consequat eiusmod.",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Fast delivery",
      caption: "Anim ea proident magna anim minim duis.",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Enjoy your food",
      caption: "Laboris et anim labore minim mollit.",
      imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _AppTutorialView(),
    );
  }
}

class _AppTutorialView extends StatefulWidget {
  const _AppTutorialView();

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {
  final PageController pageViewcontroller = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewcontroller.addListener(() {
      final page = pageViewcontroller.page ?? 0;

      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewcontroller,
          physics: const BouncingScrollPhysics(),
          children: [
            ...slides.map(
              (slideData) => Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl,
              ),
            )
          ],
        ),
        Positioned(
          top: 20,
          right: 10,
          child: TextButton(
            child: const Text("Skip"),
            onPressed: () => context.pop(),
          ),
        ),
        endReached
            ? Positioned(
                bottom: 10,
                right: 20,
                child: FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: FilledButton(
                    child: const Text("Start!"),
                    onPressed: () => context.pop(),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

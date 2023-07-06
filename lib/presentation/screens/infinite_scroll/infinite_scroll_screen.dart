import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_scroll_screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 150,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => e + lastId));
  }

  Future loadNextPage() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();

    if (!isMounted) return;
    setState(() {
      isLoading = false;
    });
    moveScrollToBottom();
  }

  Future onRefresh() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    if (!isMounted) return;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 300) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: _ListView(
          scrollController: scrollController,
          imagesIds: imagesIds,
          onRefresh: onRefresh,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<int> imagesIds;
  final Future Function() onRefresh;

  const _ListView({
    required this.scrollController,
    required this.imagesIds,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      edgeOffset: 10,
      strokeWidth: 2,
      child: ListView.builder(
        controller: scrollController,
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
            width: double.infinity,
            fit: BoxFit.cover,
            height: 300.0,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(
                "https://picsum.photos/id/${imagesIds[index]}/500/300"),
          );
        },
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<SlideInfo> slides = [
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Et deserunt elit minim ex occaecat incididunt ut magna velit.',
      imageURL: 'assets/images/1.png'),
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Do ex Lorem consequat magna sunt eu ex excepteur do minim consequat eu in.',
      imageURL: 'assets/images/2.png'),
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Fugiat exercitation nostrud sint aute adipisicing anim nostrud ipsum non est aute id.',
      imageURL: 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageURL;
  SlideInfo(
      {required this.title, required this.caption, required this.imageURL});
}

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool lastPage = false;
  final int pageCount = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // print('${pageController.page}');
      // pageController.
      final double page = pageController.page ?? 0;

      if (lastPage && page <= (slides.length - 1.5)) {
        setState(() {
          lastPage = false;
        });
      } else if (!lastPage && page >= (slides.length - 1.5)) {
        setState(() {
          lastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: BouncingScrollPhysics(),
            children: [
              ...slides.map((slideData) {
                return _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageURL: slideData.imageURL);
              })
            ],
          ),
          Positioned(
              right: 30,
              top: 50,
              child: FilledButton(
                  onPressed: () => context.pop(), child: Text('Salir'))),
          lastPage
              ? Positioned(
                  bottom: 50,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;
  const _Slide(
      {required this.title, required this.caption, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageURL),
            SizedBox(
              height: 20,
            ),
            Text(title, style: textStyle.titleLarge),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: textStyle.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}

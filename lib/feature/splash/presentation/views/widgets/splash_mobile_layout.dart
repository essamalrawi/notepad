import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/core/utils/sliding_text.dart';

class SplashViewMobileLayout extends StatefulWidget {
  const SplashViewMobileLayout({super.key});

  @override
  State<SplashViewMobileLayout> createState() => _SplashViewMobileLayoutState();
}

class _SplashViewMobileLayoutState extends State<SplashViewMobileLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHomee();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            Text(
              'Notepad',
              style: AppStyle.styleRegular48(context),
            ),
            SlidingText(slidingAnimation: slidingAnimation)
            // Text(
            //   'Take Quick Notes',
            //   style: AppStyle.styleRegular16(context),
            // )
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHomee() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}

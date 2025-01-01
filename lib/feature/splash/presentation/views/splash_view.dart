import 'package:flutter/material.dart';
import 'package:notepad/core/widgets/adaptive_layout.dart';
import 'package:notepad/feature/splash/presentation/views/widgets/splash_mobile_layout.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCE5C3),
      body: AdaptiveLayout(
        desktopLayout: (context) => const SizedBox(),
        tabletLayout: (context) => const SizedBox(),
        mobileLayout: (context) => const SplashViewMobileLayout(),
      ),
    );
  }
}

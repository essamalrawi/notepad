import 'package:flutter/material.dart';
import 'package:notepad/core/widgets/adaptive_layout.dart';
import 'package:notepad/feature/home/presentation/views/widgets/home_view_mobile_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => const HomeViewMobileLayout(),
          tabletLayout: (context) => const SizedBox(),
          desktopLayout: (context) => const SizedBox(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_router.dart';
import 'package:notepad/core/widgets/adaptive_layout.dart';
import 'package:notepad/feature/home/presentation/views/widgets/home_view_desktop_layout.dart';
import 'package:notepad/feature/home/presentation/views/widgets/home_view_mobile_layout.dart';
import 'package:notepad/feature/home/presentation/views/widgets/home_view_table_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff703410),
          shape: const CircleBorder(),
          child: IconButton(
              onPressed: () async {
                GoRouter.of(context).push(AppRouter.kCreateNoteView);
              },
              icon: SvgPicture.asset('assets/images/button.svg'))),
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => const HomeViewMobileLayout(),
          tabletLayout: (context) => const HomeViewTableLayout(),
          desktopLayout: (context) => const HomeViewDesktopLayout(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            "Take Quick Notes",
            textAlign: TextAlign.center,
            style: AppStyle.styleRegular16(context),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_router.dart';

void main() {
  runApp(const Notepad());
}

class Notepad extends StatelessWidget {
  const Notepad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

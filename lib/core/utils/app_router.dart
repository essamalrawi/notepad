import 'package:go_router/go_router.dart';
import 'package:notepad/feature/home/presentation/views/home_view.dart';
import 'package:notepad/feature/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kSplashView = '/splashView';
  static const kHomeView = '/kHomeView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}

import 'package:go_router/go_router.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/views/create_note_view.dart';
import 'package:notepad/feature/home/presentation/views/home_view.dart';
import 'package:notepad/feature/home/presentation/views/note_view.dart';
import 'package:notepad/feature/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kSplashView = '/splashView';
  static const kHomeView = '/kHomeView';
  static const kCreateNoteView = '/kCreateNoteView';
  static const kNoteView = '/kNoteView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kCreateNoteView,
      builder: (context, state) {
        final note = state.extra as NoteModel;
        return CreateNoteView(
          note: note,
        );
      },
    ),
    GoRoute(
      path: kNoteView,
      builder: (context, state) {
        final note = state.extra as NoteModel;
        return NoteView(note: note);
      },
    ),
  ]);
}

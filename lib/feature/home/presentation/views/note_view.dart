import 'package:flutter/material.dart';
import 'package:notepad/core/widgets/adaptive_layout.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/views/widgets/view_note_model_mobile_layout.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: AdaptiveLayout(
            mobileLayout: (context) => ViewNoteModelMobileLayout(
                  note: note,
                ),
            tabletLayout: (context) => const SizedBox(),
            desktopLayout: (context) => const SizedBox()),
      ),
    );
  }
}

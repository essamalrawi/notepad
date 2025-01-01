import 'package:flutter/material.dart';
import 'package:notepad/feature/home/presentation/views/widgets/create_note_view_mobile_layout.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(child: CreateNoteViewMobileLayout()),
    );
  }
}

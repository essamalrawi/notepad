import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/add_note/add_note_cubit.dart';
import 'package:notepad/feature/home/presentation/views/widgets/create_note_view_mobile_layout.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView(this.note, {super.key});
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: CreateNoteViewMobileLayout(
          note: note,
        ),
      )),
    );
  }
}

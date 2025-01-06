import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';
import 'package:notepad/feature/home/presentation/views/widgets/other_box_note.dart';

class BuildOtherBoxNote extends StatelessWidget {
  const BuildOtherBoxNote({super.key});
  static const colors = [
    Color(0xffE3EBF2),
    Color(0xffD2EBD1),
    Color(0xffFDF2E1)
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        List<NoteModel> otherNotes =
            notes.where((note) => note.isPinned == false).toList();
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: otherNotes.length,
            itemBuilder: (context, index) {
              return OtherBoxNote(
                note: otherNotes[index],
                color: colors[index % colors.length],
              );
            });
      },
    );
  }
}

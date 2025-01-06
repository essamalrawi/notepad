import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';
import 'package:notepad/feature/home/presentation/views/widgets/empty_notes.dart';
import 'package:notepad/feature/home/presentation/views/widgets/only_other_notes.dart';
import 'package:notepad/feature/home/presentation/views/widgets/only_pinned_notes.dart';
import 'package:notepad/feature/home/presentation/views/widgets/pinned_and_other_notes.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        bool allOtherNotes = BlocProvider.of<NotesCubit>(context)
            .notes!
            .every((note) => note.isPinned == false);
        bool allPinnedNotes = BlocProvider.of<NotesCubit>(context)
            .notes!
            .every((note) => note.isPinned == true);
        bool isEmpty = BlocProvider.of<NotesCubit>(context).notes!.isEmpty;
        if (isEmpty) {
          return const EmptyNotes();
        } else if (allOtherNotes) {
          return const OnlyOtherNotes();
        } else if (allPinnedNotes) {
          return const OnlyPinnedNotes();
        } else {
          return const PinnedAndOtherNotes();
        }
      },
    );
  }
}

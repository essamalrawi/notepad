import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/add_note/add_note_cubit.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';
import 'package:notepad/feature/home/presentation/views/widgets/add_note_form.dart';

class CreateNoteViewMobileLayout extends StatelessWidget {
  const CreateNoteViewMobileLayout({super.key, this.note});
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFaluire) {
              log("Failled ${state.error}");
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 21),
                child: AddNoteForm(
                  note: note,
                ),
              ),
            );
          },
        )),
        // const Expanded(
        //   child: SingleChildScrollView(
        //     child: AddNoteForm(),
        //   ),
        // ),
      ],
    );
  }
}

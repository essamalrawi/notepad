import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/views/widgets/view_note_header.dart';

class ViewNoteModelMobileLayout extends StatelessWidget {
  const ViewNoteModelMobileLayout({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ViewNoteHeader(
            title: note.title,
            date: note.date,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SingleChildScrollView(
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    note.subTitle,
                    style: AppStyle.styleRegular16(context),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

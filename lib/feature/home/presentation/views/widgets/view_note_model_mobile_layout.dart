import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_router.dart';
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
            note: note,
            isPinned: note.isPinned ?? false,
          ),
          Expanded(
            child: GestureDetector(
              onDoubleTap: () {
                GoRouter.of(context)
                    .replace(AppRouter.kCreateNoteView, extra: note);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 37),
                child: SingleChildScrollView(
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      textAlign:
                          note.RTL == true ? TextAlign.right : TextAlign.left,
                      note.subTitle,
                      style: AppStyle.styleRegular16(context),
                    ),
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

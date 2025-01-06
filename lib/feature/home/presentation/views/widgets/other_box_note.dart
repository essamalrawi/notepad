import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

class OtherBoxNote extends StatelessWidget {
  const OtherBoxNote({super.key, this.color, required this.note});
  final Color? color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNoteView, extra: note);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 21, right: 21, bottom: 12),
        height: 150,
        decoration: BoxDecoration(
            color: color ?? const Color(0xffFCE5C3),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: AppStyle.styleRegular14(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                note.date,
                style: AppStyle.styleRegular12(context),
              ),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                child: Text(
                  note.subTitle,
                  style: AppStyle.styleMedium16(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

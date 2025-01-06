import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

class SliderBoxNote extends StatelessWidget {
  const SliderBoxNote({super.key, this.color, required this.note});
  final Color? color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNoteView, extra: note);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        width: MediaQuery.sizeOf(context).width * .45,
        decoration: BoxDecoration(
            color: color ?? const Color(0xffFCE5C3),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  note.title,
                  style: AppStyle.styleRegular14(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  note.date,
                  style: AppStyle.styleRegular12(context),
                ),
              ),
              const Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 22,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  note.subTitle,
                  style: AppStyle.styleMedium16(context),
                  maxLines: 3,
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

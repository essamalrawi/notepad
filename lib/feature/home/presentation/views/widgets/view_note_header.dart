import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

class ViewNoteHeader extends StatelessWidget {
  const ViewNoteHeader({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: SvgPicture.asset(
                'assets/images/arrow_back.svg',
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: AppStyle.styleBold20(context),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  note.date,
                  style: AppStyle.styleRegular12(context),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.mapPin,
                  color: Colors.black,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  note.delete();
                },
                icon: SvgPicture.asset('assets/images/trash.svg')),
            const SizedBox(
              width: 24,
            )
          ],
        )
      ],
    );
  }
}

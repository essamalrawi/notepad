import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';

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
        Expanded(
          child: Row(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        note.title,
                        maxLines: 1,
                        style: AppStyle.styleBold20(context),
                      ),
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
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  note.isPinned = true;
                  note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.mapPin,
                  color: Colors.black,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  GoRouter.of(context).pop();
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

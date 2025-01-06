import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';

class ViewNoteHeader extends StatefulWidget {
  const ViewNoteHeader({
    super.key,
    required this.note,
    required this.isPinned,
  });
  final NoteModel note;
  final bool isPinned;

  @override
  State<ViewNoteHeader> createState() => _ViewNoteHeaderState();
}

class _ViewNoteHeaderState extends State<ViewNoteHeader> {
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
                        widget.note.title,
                        maxLines: 1,
                        style: AppStyle.styleBold20(context),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.note.date,
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
                  if (widget.note.isPinned == true) {
                    widget.note.isPinned = false;
                  } else {
                    widget.note.isPinned = true;
                  }

                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                  setState(() {});
                  //      setState(() {});
                },
                icon: Icon(
                  (widget.note.isPinned ?? false)
                      ? FontAwesomeIcons.thumbtackSlash
                      : FontAwesomeIcons.thumbtack,
                  color: Colors.black,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.note.delete();
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

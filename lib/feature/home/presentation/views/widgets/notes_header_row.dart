import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepad/core/utils/app_style.dart';

class NotesHeaderRow extends StatelessWidget {
  const NotesHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All Notes',
          style: AppStyle.styleBold24(context),
        ),
        const Flexible(
          fit: FlexFit.loose,
          child: SizedBox(
            width: 7,
          ),
        ),
        const Flexible(
          fit: FlexFit.loose,
          child: Icon(FontAwesomeIcons.caretDown),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_style.dart';

class CreateNoteHeader extends StatelessWidget {
  const CreateNoteHeader({
    super.key,
    this.edit = false,
  });
  final bool? edit;
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
            Text(
              edit == true ? "Edit Note" : "Create Note",
              style: AppStyle.styleBold20(context),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: SvgPicture.asset(
                'assets/images/ctrl_z_arrow.svg',
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: SvgPicture.asset(
                'assets/images/ctrl_y_arrow.svg',
              ),
            )
          ],
        )
      ],
    );
  }
}

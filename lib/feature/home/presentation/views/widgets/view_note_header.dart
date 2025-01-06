import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/utils/app_style.dart';

class ViewNoteHeader extends StatelessWidget {
  const ViewNoteHeader({super.key, required this.title, required this.date});
  final String title;
  final String date;
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
                  title,
                  style: AppStyle.styleBold20(context),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  date,
                  style: AppStyle.styleRegular12(context),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
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

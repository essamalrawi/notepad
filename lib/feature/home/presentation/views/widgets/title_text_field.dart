import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff3D3B3B).withOpacity(.3),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: 'Title',
        hintStyle: AppStyle.styleBold24(context)
            .copyWith(color: const Color(0xff3D3B3B).withOpacity(.3)),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class TitleFormTextField extends StatelessWidget {
  const TitleFormTextField({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
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

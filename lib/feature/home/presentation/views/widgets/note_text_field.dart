import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class NoteTextFormField extends StatelessWidget {
  const NoteTextFormField({super.key, this.onSaved});
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
      keyboardType:
          TextInputType.multiline, // Enables the "Enter" key for a new line
      maxLines: null,
      decoration: InputDecoration(
        hintMaxLines: 2,
        contentPadding: EdgeInsets.zero,
        hintText: 'Note something down or click on image to upload image',
        hintStyle: AppStyle.styleRegular16(context)
            .copyWith(color: const Color(0xff3D3B3B).withOpacity(.3)),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

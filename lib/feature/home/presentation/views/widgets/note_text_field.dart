import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

class NoteTextFormField extends StatefulWidget {
  const NoteTextFormField({super.key, this.onSaved, this.note});
  final Function(String?)? onSaved;
  final NoteModel? note;
  @override
  State<NoteTextFormField> createState() => _NoteTextFormFieldState();
}

class _NoteTextFormFieldState extends State<NoteTextFormField> {
  late TextEditingController _contentController;
  @override
  void initState() {
    super.initState();

    _contentController =
        TextEditingController(text: widget.note?.subTitle ?? '');
  }

  @override
  void dispose() {
    // Clean up the controllers

    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _contentController,
      onSaved: widget.onSaved,
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

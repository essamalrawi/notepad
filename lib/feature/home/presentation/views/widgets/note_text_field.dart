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
  late TextEditingController _controller;

  TextDirection _textDirection = TextDirection.ltr;
  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.note?.subTitle ?? '');
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    // Clean up the controllers
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: _textDirection == TextDirection.rtl
          ? TextAlign.right
          : TextAlign.left,
      textDirection: _textDirection,
      controller: _controller,
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

  void _handleTextChange() {
    final isRtl = RegExp(r'[\u0600-\u06FF]').hasMatch(_controller.text);
    setState(() {
      _textDirection = isRtl ? TextDirection.rtl : TextDirection.ltr;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

class TitleFormTextField extends StatefulWidget {
  const TitleFormTextField({super.key, this.onSaved, this.note});
  final Function(String?)? onSaved;
  final NoteModel? note;
  @override
  State<TitleFormTextField> createState() => _TitleFormTextFieldState();
}

class _TitleFormTextFieldState extends State<TitleFormTextField> {
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
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: 'Title',
        hintStyle: AppStyle.styleBold24(context)
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

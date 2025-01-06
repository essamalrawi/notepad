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
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.note?.subTitle ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleController,
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
}

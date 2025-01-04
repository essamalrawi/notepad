import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/presentation/views/widgets/create_note_header.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_elevated_button.dart';
import 'package:notepad/feature/home/presentation/views/widgets/note_text_field.dart';
import 'package:notepad/feature/home/presentation/views/widgets/title_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: CreateNoteHeader(),
          ),
          const SizedBox(
            height: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleFormTextField(
                      onSaved: (value) {
                        title = value;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '14/09/2023',
                      style: AppStyle.styleRegular12(context),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    NoteTextFormField(onSaved: (value) {
                      subTitle = value;
                    }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 17, top: 20),
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: CustomElevatedButton(
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      fromKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}

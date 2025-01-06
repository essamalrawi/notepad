import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/add_note/add_note_cubit.dart';
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
  late bool isKeyboardOpen;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;

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
              padding: const EdgeInsets.only(
                left: 20,
              ),
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
                      DateFormat('dd/MM/yyyy')
                          .format(DateTime.now())
                          .toString(),
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
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: isKeyboardOpen
                      ? MediaQuery.of(context).viewInsets.bottom
                      : 20,
                  bottom: isKeyboardOpen ? 5 : 17,
                ),

                // Hide the button
                child: MediaQuery.of(context).viewInsets.bottom != 0
                    ? const SizedBox()
                    : SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: CustomElevatedButton(
                          isLoading: state is AddNoteLoading ? true : false,
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              fromKey.currentState!.save();
                              var noteModel = NoteModel(
                                  title: title!,
                                  subTitle: subTitle!,
                                  date: DateFormat('dd/MM/yyyy')
                                      .format(DateTime.now())
                                      .toString());
                              BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(noteModel);
                              GoRouter.of(context).pop();
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

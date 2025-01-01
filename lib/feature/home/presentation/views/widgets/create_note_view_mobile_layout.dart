import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/presentation/views/widgets/create_note_header.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_elevated_button.dart';
import 'package:notepad/feature/home/presentation/views/widgets/note_text_field.dart';
import 'package:notepad/feature/home/presentation/views/widgets/title_text_field.dart';

class CreateNoteViewMobileLayout extends StatelessWidget {
  const CreateNoteViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: CreateNoteHeader(),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleTextField(),
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
                          const NoteTextField(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 17, top: 20),
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: const CustomElevatedButton()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notepad/feature/home/presentation/views/widgets/other_box_note.dart';

class BuildOtherBoxNote extends StatelessWidget {
  const BuildOtherBoxNote({super.key});
  static const colors = [
    Color(0xffE3EBF2),
    Color(0xffD2EBD1),
    Color(0xffFDF2E1)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return OtherBoxNote(
            color: colors[index % colors.length],
          );
        });
  }
}

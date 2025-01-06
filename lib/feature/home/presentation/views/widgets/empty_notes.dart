import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:notepad/feature/home/presentation/views/widgets/notes_header_row.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});
  final List<String> items = const [
    'assets/images/empty.gif',
    'assets/images/empty_box.gif',
    'assets/images/animation.gif'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, top: 21, right: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NotesHeaderRow(),
          const SizedBox(
            height: 16,
          ),
          const CustomSearchBar(),
          const SizedBox(
            height: 24,
          ),
          const Spacer(),
          Image.asset(items[Random().nextInt(items.length)]),
          const Spacer(),
        ],
      ),
    );
  }
}

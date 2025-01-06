import 'package:flutter/widgets.dart';
import 'package:notepad/feature/home/presentation/views/widgets/build_other_box_note.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:notepad/feature/home/presentation/views/widgets/notes_header_row.dart';

class OnlyOtherNotes extends StatelessWidget {
  const OnlyOtherNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 21, top: 21, right: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotesHeaderRow(),
                SizedBox(
                  height: 16,
                ),
                CustomSearchBar(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BuildOtherBoxNote(),
        )
        // SliverFillRemaining(child: ,)
      ],
    );
  }
}

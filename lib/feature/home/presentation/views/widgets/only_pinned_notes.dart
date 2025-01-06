import 'package:flutter/widgets.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:notepad/feature/home/presentation/views/widgets/notes_header_row.dart';
import 'package:notepad/feature/home/presentation/views/widgets/slider_list_view_box_note.dart';

class OnlyPinnedNotes extends StatelessWidget {
  const OnlyPinnedNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, top: 21, right: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NotesHeaderRow(),
                const SizedBox(
                  height: 16,
                ),
                const CustomSearchBar(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Pinned',
                  style: AppStyle.styleBold14(context)
                      .copyWith(color: const Color(0xff868484)),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SliderListViewBoxNote(),
              ],
            ),
          ),
        ),

        // SliverFillRemaining(child: ,)
      ],
    );
  }
}

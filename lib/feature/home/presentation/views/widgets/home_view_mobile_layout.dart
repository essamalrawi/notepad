import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/presentation/views/widgets/build_other_box_note.dart';
import 'package:notepad/feature/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:notepad/feature/home/presentation/views/widgets/notes_header_row.dart';
import 'package:notepad/feature/home/presentation/views/widgets/slider_list_view_box_note.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NotesHeaderRow(),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 21),
                  child: CustomSearchBar(),
                ),
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
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Other',
                  style: AppStyle.styleBold14(context)
                      .copyWith(color: const Color(0xff868484)),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: BuildOtherBoxNote(),
        )
        // SliverFillRemaining(child: ,)
      ],
    );
  }
}

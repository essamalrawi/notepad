import 'package:flutter/widgets.dart';
import 'package:notepad/feature/home/presentation/views/widgets/slider_box_note.dart';

class SliderListViewBoxNote extends StatelessWidget {
  const SliderListViewBoxNote({
    super.key,
  });
  static const colors = [
    Color(0xffFCE5C3),
    Color(0xffDACEE6),
    Color(0xffC8D8E5),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return SliderBoxNote(
            color: colors[index % colors.length],
          );
        },
      ),
    );
  }
}

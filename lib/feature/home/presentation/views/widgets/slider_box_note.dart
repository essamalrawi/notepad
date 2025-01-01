import 'package:flutter/widgets.dart';
import 'package:notepad/core/utils/app_style.dart';

class SliderBoxNote extends StatelessWidget {
  const SliderBoxNote({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      width: MediaQuery.sizeOf(context).width * .45,
      decoration: BoxDecoration(
          color: color ?? const Color(0xffFCE5C3),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'sherlock holmes',
                style: AppStyle.styleRegular14(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                '14/09/2023',
                style: AppStyle.styleRegular12(context),
              ),
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 22,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'In summary, the sentence means the speaker was seriously affected by enteric fever, a common and dreaded disease during the time of British colonialism in India. The phrase "curse of our Indian possessions',
                style: AppStyle.styleMedium16(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

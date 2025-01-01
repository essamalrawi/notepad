import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class OtherBoxNote extends StatelessWidget {
  const OtherBoxNote({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 21, right: 21, bottom: 12),
      height: 150,
      decoration: BoxDecoration(
          color: color ?? const Color(0xffFCE5C3),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'sherlock holmes',
              style: AppStyle.styleRegular14(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'yesterday',
              style: AppStyle.styleRegular12(context),
            ),
            const SizedBox(
              height: 22,
            ),
            Expanded(
              child: Text(
                'In summary, the sentence means the speaker was seriously affected by enteric fever, a common and dreaded disease during the time of British colonialism in India. The phrase "curse of our Indian possessions',
                style: AppStyle.styleMedium16(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

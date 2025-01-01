import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff703410),
        ),
        onPressed: () {},
        child: Text(
          "Save Note",
          style: AppStyle.styleBold14(context),
        ));
  }
}

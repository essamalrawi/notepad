import 'package:flutter/material.dart';
import 'package:notepad/core/utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, this.onPressed, this.isLoading = false});

  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xff703410),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 21,
                  height: 21,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  "Save Note",
                  style: AppStyle.styleBold14(context),
                )),
    );
  }
}

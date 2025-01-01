import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notepad/core/utils/app_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 50,
              height: 50,
              child:
                  Center(child: SvgPicture.asset('assets/images/search.svg'))),
          filled: true,
          fillColor: const Color(0xffF9F9F9),
          hintText: 'Search..',
          hintStyle: AppStyle.styleRegular14(context).copyWith(
            color: const Color(0xff868484),
          ),
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder()),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
            width: 1, color: const Color(0xff203662).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10));
  }
}

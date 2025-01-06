import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepad/core/utils/app_style.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _contentController;
  String? storedText;
  @override
  void initState() {
    super.initState();
    storedText = BlocProvider.of<NotesCubit>(context).searchQuery;
    _contentController = TextEditingController(text: storedText);
  }

  @override
  void dispose() {
    // Clean up the controllers

    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _contentController,
      onChanged: (value) {
        setState(() {
          storedText = value;
        });
      },
      onSubmitted: (value) {
        BlocProvider.of<NotesCubit>(context).searchNotes(value);
        BlocProvider.of<NotesCubit>(context).searchQuery = value;
      },
      decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 50,
              height: 50,
              child:
                  Center(child: SvgPicture.asset('assets/images/search.svg'))),
          suffixIcon: storedText!.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    _contentController.clear();
                    BlocProvider.of<NotesCubit>(context).searchQuery = '';
                    storedText = '';
                    setState(() {});
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(FontAwesomeIcons.deleteLeft),
                ),
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

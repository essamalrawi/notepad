import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';
import 'package:notepad/feature/home/presentation/manager/notes/notes_cubit.dart';
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
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
          List<NoteModel> pinnedNotes =
              notes.where((note) => note.isPinned == true).toList();
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: pinnedNotes.length,
            itemBuilder: (context, index) {
              return SliderBoxNote(
                note: pinnedNotes[index],
                color: colors[index % colors.length],
              );
            },
          );
        },
      ),
    );
  }
}

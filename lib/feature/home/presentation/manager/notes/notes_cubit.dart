import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notepad/constants.dart';
import 'package:notepad/feature/home/data/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? allNotes;
  List<NoteModel>? searchResults;
  String? searchQuery = '';
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    allNotes = notesBox.values.toList();
    notes = allNotes;
    emit(NotesSucces());
  }

  searchNotes(String query) {
    searchResults = notes!.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.subTitle.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notes = searchResults;
    if (!(notes!.isEmpty)) {
      emit(NotesSucces());
    }
  }
}

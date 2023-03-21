import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';
import 'package:flutter_notes_app_ads/theme/custom_black_theme.dart';
import 'package:provider/provider.dart';

class NoteDetailsPage extends StatelessWidget {
  final Note note;
  final _noteTitle = TextEditingController();
  final _noteDescription = TextEditingController();

  NoteDetailsPage({Key? key, required this.note}) : super(key: key) {
    _noteTitle.text = note.title;
    _noteDescription.text = note.description;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () {
        context.read<NotesRepository>().updateNote(
              note,
              _noteTitle.text,
              _noteDescription.text,
            );
        return Future.value(true);
      },
      child: Hero(
        tag: 'note-${note.hashCode}',
        child: Material(
          color: isDark ? CustomBlackTheme.black : note.color.shade50,
          child: Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                selectionColor: isDark ? note.color.shade900 : note.color.shade100,
              ),
            ),
            child: ListView(
              children: [
                AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<NotesRepository>().archiveNote(note);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.archive_rounded),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    cursorColor: note.color,
                    controller: _noteTitle,
                    minLines: 1,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(height: 36),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    cursorColor: note.color,
                    controller: _noteDescription,
                    minLines: 1,
                    maxLines: 60,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

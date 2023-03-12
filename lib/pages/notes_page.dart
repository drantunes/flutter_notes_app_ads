import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';
import 'package:flutter_notes_app_ads/widgets/note_card.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = NotesRepository.notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset('images/profile.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
          children: notes.map((note) => NoteCard(note: note)).toList(),
        ),
      ),
    );
  }
}

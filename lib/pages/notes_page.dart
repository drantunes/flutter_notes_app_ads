import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/pages/add_note_page.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';
import 'package:flutter_notes_app_ads/widgets/bottom_navigation_widget.dart';
import 'package:flutter_notes_app_ads/widgets/note_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NotesRepository notesRepository = NotesRepository();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  _loadNotes() {
    notes = notesRepository.notes;
  }

  _updateNotes() {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Nota adicionada!'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.view_agenda_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'foto',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Scaffold(
                            appBar: AppBar(),
                            body: Hero(
                              tag: 'foto',
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Image.asset('images/profile.png'),
                                ),
                              ),
                            ),
                          )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('images/profile.png'),
                ),
              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddNotePage(
                notesRepository: notesRepository,
                onSave: _updateNotes,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: BottomNavigationWidget(
        buttons: [
          IconButton(
            tooltip: '',
            icon: const Icon(Icons.lightbulb),
            onPressed: () => {},
          ),
          IconButton(
            tooltip: '',
            icon: const Icon(Icons.archive_outlined),
            onPressed: () => {},
          ),
          IconButton(
            tooltip: '',
            icon: const Icon(Icons.search),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

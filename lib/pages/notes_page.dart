import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/main.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/pages/add_note_page.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';
import 'package:flutter_notes_app_ads/widgets/bottom_navigation_widget.dart';
import 'package:flutter_notes_app_ads/widgets/note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NotesRepository notesRepository = NotesRepository();
  List<Note> notes = [];
  int numColumns = 2;
  bool showArchived = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadNotes();
  // }

  // _loadNotes() {
  //   notes = notesRepository.notes;
  // }

  // _updateNotes() {
  //   setState(() {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Nota adicionada!'),
  //         action: SnackBarAction(
  //           label: 'OK',
  //           onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
  //         ),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final notesRepository = context.watch<NotesRepository>();
    notes = notesRepository.getNotes(showArchived);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            showArchived ? '${context.read<Title1>().value} (${notes.length})' : 'Notes (${notes.length})'),
        actions: [
          IconButton(
            onPressed: () => setState(() => numColumns = (numColumns == 1) ? 2 : 1),
            icon: Icon(numColumns == 2 ? Icons.view_agenda_outlined : Icons.grid_view_outlined),
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
        child: MasonryGridView.count(
          crossAxisCount: numColumns,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: notes.length,
          itemBuilder: (context, index) => NoteCard(note: notes[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddNotePage(
                  // notesRepository: notesRepository,
                  // onSave: _updateNotes,
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
            icon: Icon(showArchived ? Icons.lightbulb_outline : Icons.lightbulb),
            onPressed: () => setState(() => showArchived = false),
          ),
          IconButton(
            tooltip: '',
            icon: Icon(showArchived ? Icons.archive : Icons.archive_outlined),
            onPressed: () => setState(() => showArchived = true),
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

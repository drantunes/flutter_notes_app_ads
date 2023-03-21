import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';

class NotesRepository extends ChangeNotifier {
  final List<Note> _notes = [];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  saveNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  NotesRepository() {
    _notes.addAll(
      [
        Note(
          title: 'Testar o Flutter',
          description: 'Testar um app básico no Flutter e verificar os comandos',
          color: Colors.cyan,
        ),
        Note(
          title: 'Setup do Ambiente',
          description: 'Primeira coisa a fazer para começar a estudar no Flutter.',
          color: Colors.pink,
        ),
        Note(
          title: 'Criar Exemplo de ToDo app',
          description: 'Fazer um app de lista de tarefas, para testar widgets!',
          color: Colors.green,
        ),
      ],
    );
    notifyListeners();
  }

  List<Note> getNotes(bool showArchived) {
    return notes.where((note) => note.archived == showArchived).toList();
  }

  archiveNote(Note note) {
    final oldNote = _notes.firstWhere(
      (n) => n.title == note.title && n.description == note.description,
    );
    final noteIndex = _notes.indexOf(oldNote);
    _notes.replaceRange(noteIndex, noteIndex + 1, [
      Note(
        title: note.title,
        description: note.description,
        color: note.color,
        archived: true,
      )
    ]);
    notifyListeners();
  }

  updateNote(Note note, String title, String description) {
    final oldNote = _notes.firstWhere(
      (n) => n.title == note.title && n.description == note.description,
    );
    final noteIndex = _notes.indexOf(oldNote);
    _notes.replaceRange(noteIndex, noteIndex + 1, [
      Note(
        title: title,
        description: description,
        color: note.color,
      )
    ]);
    notifyListeners();
  }
}

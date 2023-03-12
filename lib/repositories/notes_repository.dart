import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';

class NotesRepository {
  static List<Note> notes = [
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
  ];
}

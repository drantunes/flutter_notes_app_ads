import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/app.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';
import 'package:provider/provider.dart';

class Title1 {
  String value = 'Archived';
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Title1>(create: (_) => Title1()),
        ChangeNotifierProvider(create: (_) => NotesRepository()),
      ],
      child: const App(),
    ),
  );
}

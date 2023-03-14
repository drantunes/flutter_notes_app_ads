import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/pages/notes_page.dart';
import 'package:flutter_notes_app_ads/theme/custom_black_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const brightness = Brightness.light;

    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: CustomBlackTheme.getThemeData(brightness: brightness),
      home: const NotesPage(),
    );
  }
}

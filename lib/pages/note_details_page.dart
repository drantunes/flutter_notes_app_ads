import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/theme/custom_black_theme.dart';

class NoteDetailsPage extends StatelessWidget {
  final Note note;
  const NoteDetailsPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = (Theme.of(context).brightness == Brightness.dark);

    return Hero(
      tag: 'note-${note.hashCode}',
      child: Material(
        color: isDark ? CustomBlackTheme.black : note.color.shade50,
        child: Column(
          children: [
            AppBar(
              actions: [
                IconButton(
                  tooltip: 'Arquivar',
                  onPressed: () {},
                  icon: const Icon(Icons.archive_rounded),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: ListView(
                  children: [
                    Text(
                      note.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Divider(height: 36),
                    Text(
                      note.description,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

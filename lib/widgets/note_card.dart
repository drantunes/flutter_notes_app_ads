import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/pages/note_details_page.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  _openDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NoteDetailsPage(note: note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'note-${note.hashCode}',
      child: Card(
        color: (Theme.of(context).brightness == Brightness.light) ? note.color.shade100 : note.color.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () => _openDetails(context),
          borderRadius: BorderRadius.circular(8),
          splashColor: note.color.withOpacity(.2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  note.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => {},
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
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  minHeight: 0,
                ),
                clipBehavior: Clip.none,
                child: Text(
                  note.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

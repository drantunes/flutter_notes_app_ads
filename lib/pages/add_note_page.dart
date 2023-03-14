import 'package:flutter/material.dart';
import 'package:flutter_notes_app_ads/models/note.dart';
import 'package:flutter_notes_app_ads/repositories/notes_repository.dart';

class AddNotePage extends StatefulWidget {
  final NotesRepository notesRepository;
  final Function() onSave;

  const AddNotePage({
    Key? key,
    required this.notesRepository,
    required this.onSave,
  }) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  MaterialColor _noteColor = Colors.grey;
  final _formKey = GlobalKey<FormState>();
  final _noteTitle = TextEditingController();
  final _noteDescription = TextEditingController();
  // bool showPass = false;
  saveNote() {
    if (_formKey.currentState!.validate()) {
      widget.notesRepository.saveNote(
        Note(
          title: _noteTitle.text,
          description: _noteDescription.text,
          color: _noteColor,
        ),
      );
      widget.onSave();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _noteColor.shade50,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextButton.icon(
              onPressed: () => saveNote(),
              icon: const Icon(Icons.check),
              label: const Text('SALVAR'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: TextFormField(
                  // obscureText: !showPass,
                  controller: _noteTitle,
                  validator: (value) {
                    if (value!.isEmpty) return 'Escreva um titulo';
                    if (value.length < 5) return 'Escreva 5 caracteres';
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Titulo'),
                    // suffixIcon: IconButton(
                    //   onPressed: () => setState(() => showPass = !showPass),
                    //   icon: Icon(!showPass ? Icons.remove_red_eye : Icons.visibility_off),
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 12,
                  children: [
                    Colors.grey,
                    Colors.amber,
                    Colors.lime,
                    Colors.blue,
                    Colors.deepPurple,
                    Colors.deepOrange,
                    Colors.teal,
                    Colors.pink,
                  ]
                      .map((MaterialColor color) => GestureDetector(
                            onTap: () => setState(() => _noteColor = color),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: _noteColor == color ? color : color.shade50,
                                border: Border.all(
                                  color: _noteColor == color ? color : Colors.grey,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ))
                      .expand((element) => [element, const SizedBox(width: 10)])
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextFormField(
                  controller: _noteDescription,
                  validator: (value) {
                    if (value!.isEmpty) return 'Escreva uma descrição';
                    return null;
                  },
                  minLines: 5,
                  maxLines: 40,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descrição...',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

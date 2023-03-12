import 'package:flutter/material.dart';

class Note {
  final String title;
  final String description;
  final MaterialColor color;
  final bool archived;

  Note({
    required this.title,
    required this.description,
    required this.color,
    this.archived = false,
  });
}

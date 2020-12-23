import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/composite/file/file.dart';

class AudioFile extends File {
  AudioFile(String title, int size) : super(title, size, Icons.music_note);
}
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/composite/file/file.dart';

class VideoFile extends File {
  VideoFile(String title, int size) : super(title, size, Icons.movie);
}
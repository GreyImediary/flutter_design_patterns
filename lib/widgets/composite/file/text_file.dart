import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/composite/file/file.dart';

class TextFile extends File {

  TextFile(String title, int size) : super(title, size, Icons.description);
}
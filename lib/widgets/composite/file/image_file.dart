import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/composite/file/file.dart';

class ImageFile extends File {
  ImageFile(String title, int size) : super(title, size, Icons.image);
}
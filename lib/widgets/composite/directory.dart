import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/composite/i_file.dart';
import 'package:flutter_design_patterns/helper/file_size_converter.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;

  final files = <IFile>[];

  Directory(this.title, [this.isInitiallyExpanded = false]);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  int getSize() {
    int size = 0;

    for (var file in files) {
      size += file.getSize();
    }

    return size;
  }

  void addFile(IFile file) {
    files.add(file);
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: Colors.black87),
      child: Padding(
        padding: const EdgeInsets.only(left: paddingS),
        child: ExpansionTile(
          title: Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
          leading: Icon(Icons.folder),
          children: files.map((file) => file.render(context)).toList(),
          initiallyExpanded: isInitiallyExpanded,
        ),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/widgets/composite/directory.dart';
import 'package:flutter_design_patterns/widgets/composite/file/audio_file.dart';
import 'package:flutter_design_patterns/widgets/composite/file/image_file.dart';
import 'package:flutter_design_patterns/widgets/composite/file/text_file.dart';
import 'package:flutter_design_patterns/widgets/composite/file/video_file.dart';

class Composite extends StatelessWidget {
  Widget buildMediaDirectory() {
    var musicDirectory = Directory('Music');
    musicDirectory
        .addFile(AudioFile('Ludovico Einaudi - Una Mattina', 4356561));
    musicDirectory.addFile(AudioFile('Tom Grennan - City of stars', 325635424));
    musicDirectory
        .addFile(AudioFile('John Powell - Forbidden friendship', 34325674));

    var moviesDirectory = Directory('Movies');
    moviesDirectory.addFile(
        VideoFile('Eternal Sunshine of the Spotless Mind', 68328743));
    moviesDirectory.addFile(
        VideoFile('Lord of the rings: Return of the king', 192428743));

    var catPicturesDirectory = Directory('Cats');
    catPicturesDirectory.addFile(ImageFile('Cat 1.jpg', 844497));
    catPicturesDirectory.addFile(ImageFile('Cat 2.jpg', 975363));
    catPicturesDirectory.addFile(ImageFile('Cat 3.png', 1975363));

    var picturesDirectory = Directory('Pictures');
    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(ImageFile('Not a cat.png', 2971361));

    var mediaDirectory = Directory('Media', true);
    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(moviesDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory.addFile(Directory('New Folder'));
    mediaDirectory.addFile(TextFile('Nothing suspicious there.txt', 430791));
    mediaDirectory.addFile(TextFile('TeamTrees.txt', 1042));

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: buildMediaDirectory(),
      ),
    );
  }
}

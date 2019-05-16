import 'dart:core';
import 'dart:core' show Iterator;

import 'package:design_pattern_dart/Display/Example.dart';

class Iterator extends Example {
  Iterator([String filePath = "lib/Behavioral/Iterator.dart"])
      : super(filePath);

  @override
  String testRun() {
    List<Song> mp3Player = [];

    mp3Player.add(Song("愛をこめて花束を"));
    mp3Player.add(Song("輝く月のように"));
    mp3Player.add(Song("やさしい気持ちで"));

    // Dart 可以直接利用現成 Iterator.
    final iterator = mp3Player.iterator;
    var result = "";

    while (iterator.moveNext()) {
      result += "Playing ... ${iterator.current.name}.\n";
    }

    return result;
  }
}

class Song {
  String name;

  Song(this.name);
}

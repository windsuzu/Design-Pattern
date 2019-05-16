import 'package:design_pattern_dart/Display/Example.dart';

class State extends Example {
  State([String filePath = "lib/Behavioral/State.dart"]) : super(filePath);

  @override
  String testRun() {
    var editor = TextEditor(DefaultText());
    final r1 = editor.type("First Line.");

    editor.state = UpperCase();
    final r2 = editor.type("Second Line.");

    editor.state = LowerCase();
    final r3 = editor.type("Thrid Line.");

    return """
    $r1
    $r2
    $r3
    """;
  }
}

// 定義寫字時的狀態，會有三種狀態
abstract class WritingState {
  String write(String words);
}

class DefaultText implements WritingState {
  @override
  String write(String words) => words;
}

class UpperCase implements WritingState {
  @override
  String write(String words) => words.toUpperCase();
}

class LowerCase implements WritingState {
  @override
  String write(String words) => words.toLowerCase();
}

// client 可以隨情況改變狀態，而不用了解狀態是怎麼實作的
class TextEditor {
  WritingState _state;

  TextEditor(this._state);

  set state(WritingState value) {
    _state = value;
  }

  String type(String words) => _state.write(words);
}

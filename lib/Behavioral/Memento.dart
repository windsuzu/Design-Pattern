import 'package:design_pattern_dart/Display/Example.dart';

class Memento extends Example {
  Memento([String filePath = "lib/Behavioral/Memento.dart"]) : super(filePath);

  @override
  String testRun() {
    Editor editor = Editor();

    // 打兩行字然後存檔。
    editor.type("First Line.");
    editor.type("Second Line.");
    var saved = editor.save();

    // 現在不小心按到鍵盤了，趕快復原。
    editor.type("AAAAAAAAAAAAAAAAAAAAAAAAA");
    editor.restore(saved);

    return editor._content;
  }
}

// 建立一個 Memento 用來記錄
class EditorMemento {
  String _content;

  EditorMemento(this._content);
}

// editor 就可以使用 memento 來存檔或復原了 !
class Editor {
  String _content = "";

  void type(String content) => _content += '\n' + content;

  EditorMemento save() => EditorMemento(_content);

  String restore(EditorMemento memento) => _content = memento._content;
}

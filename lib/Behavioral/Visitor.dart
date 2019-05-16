import 'package:design_pattern_dart/Display/Example.dart';

class Visitor extends Example {
  Visitor([String filePath = "lib/Behavioral/Visitor.dart"]) : super(filePath);

  @override
  String testRun() {
    Animal monkey = Monkey();
    Animal lion = Lion();
    Animal dolphin = Dolphin();

    var speak = Speak();
    var jump = Jump();

    return """
    Monkey speak: ${speak.visitMonkey(monkey)}
    Dolphin speak: ${speak.visitDolphin(dolphin)}
    Lion jump: ${jump.visitLion(lion)}
    """;
  }
}

abstract class Animal {
  String accept(AnimalOperation operation);
}

abstract class AnimalOperation {
  String visitMonkey(Monkey monkey);

  String visitLion(Lion lion);

  String visitDolphin(Dolphin dolphin);
}

// 各種動物的基本 Class ，我們想盡量不再動到他們
class Monkey implements Animal {
  String shout() => 'Ooh oo aa aa!';

  @override
  String accept(AnimalOperation operation) => operation.visitMonkey(this);
}

class Lion implements Animal {
  String roar() => 'Roaaar';

  @override
  String accept(AnimalOperation operation) => operation.visitLion(this);
}

class Dolphin implements Animal {
  String speak() => 'Tuut tuttu tuutt!';

  @override
  String accept(AnimalOperation operation) => operation.visitDolphin(this);
}

// 利用 AnimalOperation 製造動物們 "Speak" 的 operation
class Speak implements AnimalOperation {
  @override
  String visitMonkey(Monkey monkey) => monkey.shout();

  @override
  String visitDolphin(Dolphin dolphin) => dolphin.speak();

  @override
  String visitLion(Lion lion) => lion.roar();
}

// 過了幾天，想再幫動物加入 "jump" 的 operation
class Jump implements AnimalOperation {
  @override
  String visitDolphin(Dolphin dolphin) =>
      "Walked on water a little and disappeared";

  @override
  String visitLion(Lion lion) => 'Jumped 7 feet! Back on the ground!';

  @override
  String visitMonkey(Monkey monkey) => "Jumped 20 feet high! on to the tree!";
}

import 'package:design_pattern_dart/Display/Example.dart';

class Prototype extends Example {
  Prototype([String filePath = "lib/Creational/Prototype.dart"])
      : super(filePath);

  @override
  String testRun() {
    var original = Human("Jay");

    var clone = Clone(original);
    clone._name = "Wei";

    return """
    ${original._name} 's hair is ${original._hairColor}
    ${clone._name} 's hair is ${clone._hairColor}
    """;
  }
}

class Human {
  String _name;
  String _hairColor;

  Human(this._name, [this._hairColor = "black"]);
}

class Clone extends Human {
  Clone(Human human) : super(human._name, human._hairColor);
}

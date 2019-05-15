import 'package:design_pattern_dart/Display/Example.dart';

class Singleton extends Example {
  Singleton([String filePath = "lib/Creational/Singleton.dart"])
      : super(filePath);

  var singleton1 = SingletonObject();
  var singleton2 = SingletonObject();

  @override
  String testRun() {
    return """
    ${singleton1 == singleton2}
    ${identical(singleton1, singleton2)}
    """;
  }
}

// Dart Version:
// 利用 factory 來取代 default constructor.
// 並且在 factory 中呼叫 private constructor 來產生 object.

class SingletonObject {
  static final SingletonObject _singletonObject = SingletonObject._private();

  factory SingletonObject() {
    return _singletonObject;
  }

  SingletonObject._private();
}

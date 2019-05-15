import 'package:design_pattern_dart/Display/Example.dart';

class SimpleFactory extends Example {
  SimpleFactory([String filePath = "lib/Creational/SimpleFactory.dart"])
      : super(filePath);

  @override
  String testRun() {
    var door1 = DoorFactory.createDoor(100, 200);
    var door2 = DoorFactory.createDoor(50, 100);
    return """
    door1's width = 
    ${door1.width}
    
    door2's height = 
    ${door2.height}
    """;
  }
}

// 想想門應該要有什麼屬性
abstract class Door {
  double width;
  double height;

  Door(this.width, this.height);
}

// 木門有門的各種屬性
class WoodenDoor implements Door {
  double height;
  double width;

  WoodenDoor(this.width, this.height);
}

// 建立一個工廠生產門
class DoorFactory {
  static Door createDoor(double width, double height) {
    return WoodenDoor(width, height);
  }
}

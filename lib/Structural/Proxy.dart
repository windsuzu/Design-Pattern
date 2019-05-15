import 'package:design_pattern_dart/Display/Example.dart';

class Proxy extends Example {
  Proxy([String filePath = "lib/Structural/Proxy.dart"]) : super(filePath);

  @override
  String testRun() {
    Door labDoor = LabDoor();
    SecuredDoor securedDoor = SecuredDoor(labDoor);

    return """
    // Thief is trying to break the door but failed.
    ${securedDoor.open("123456")}
    
    // Teacher can open the door easily.
    ${securedDoor.open("abcdefg")}
    ${securedDoor.close()}
    """;
  }
}

abstract class Door {
  String open();

  String close();
}

// 這是一個沒有防盜的實驗室大門
class LabDoor implements Door {
  @override
  String close() => "Lab door is closing!";

  @override
  String open() => "Lab door is opening!";
}

// 我們利用代理模式，使防盜門代理實驗室大門的功能。
class SecuredDoor {
  Door door;

  SecuredDoor(this.door);

  String open(String password) {
    if (authenticate(password)) {
      return door.open();
    } else {
      return "YOU SHALL NOT PASS!";
    }
  }

  String close() => door.close();

  bool authenticate(String password) {
    return password == "abcdefg";
  }
}

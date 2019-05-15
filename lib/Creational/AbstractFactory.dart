import 'package:design_pattern_dart/Display/Example.dart';

class AbstractFactory extends Example {
  AbstractFactory([String filePath = "lib/Creational/AbstractFactory.dart"])
      : super(filePath);

  @override
  String testRun() {
    var woodenDoorFactory = WoodenDoorFactory();
    var woodenDoor = woodenDoorFactory.makeDoor();
    var carpenter = woodenDoorFactory.callDoorExpert();

    var ironDoorFactory = IronDoorFactory();
    var ironDoor = ironDoorFactory.makeDoor();
    var welder = ironDoorFactory.callDoorExpert();

    return """
    ${woodenDoor.description()}
    ${carpenter.description()}
    ${carpenter.fix()}
    ------
    ${ironDoor.description()}
    ${welder.description()}
    ${welder.fix()}
    """;
  }
}

// 現在有兩種門，木門跟鐵門
abstract class Door {
  String description();
}

class WoodenDoor implements Door {
  @override
  String description() => "This is a wooden door.";
}

class IronDoor implements Door {
  @override
  String description() => "This is a iron door.";
}

// 所以也會有兩種工人來修門，修木門的、跟修鐵門的
abstract class DoorExpert {
  String description();
  String fix();
}

class Carpenter extends DoorExpert {
  @override
  String description() => "I am a carpenter.";

  @override
  String fix() => "I am fixing wooden doors.";
}

class Welder implements DoorExpert {
  @override
  String description() => "I am a welder.";

  @override
  String fix() => "I am fixing iron doors.";
}

// 創建一個工廠，將相關 class 集合起來
abstract class DoorFactory {
  Door makeDoor();
  DoorExpert callDoorExpert();
}

class WoodenDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => WoodenDoor();

  @override
  DoorExpert callDoorExpert() => Carpenter();
}

class IronDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => IronDoor();

  @override
  DoorExpert callDoorExpert() => Welder();
}

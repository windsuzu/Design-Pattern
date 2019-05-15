import 'package:design_pattern_dart/Display/Example.dart';

class Adapter extends Example {
  Adapter([String filePath = "lib/Structural/Adapter.dart"]) : super(filePath);

  @override
  String testRun() {
    var hunter = Hunter();
    var lion = Lion();

    var cow = Cow();
    var cowAdapter = CowAdapter(cow);

    return """
    // Hunter is hunting the lion.
    ${hunter.hunt(lion)}
    
    // Now the hunter can hunt cows.
    ${hunter.hunt(cowAdapter)}
    """;
  }
}

// 獅子被獵的時候會叫
class Lion {
  String roar() => "OH oh OH oh OH oh OHHH~";
}

// 獵人現在只獵獅子
class Hunter {
  String hunt(Lion lion) => lion.roar();
}

// 牛
class Cow {
  String moo() => "MOOooOoOoOoo~";
}

// 現在想讓獵人也獵牛，所以讓牛也可以變成像獅子的存在
class CowAdapter extends Lion {
  Cow cow;

  CowAdapter(this.cow);

  @override
  String roar() {
    return cow.moo();
  }
}

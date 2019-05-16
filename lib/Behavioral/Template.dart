import 'package:design_pattern_dart/Display/Example.dart';

class Template extends Example {
  Template([String filePath = "lib/Behavioral/Template.dart"])
      : super(filePath);

  @override
  String testRun() {
    var androidBuilder = AndroidBuilder();
    var iosBuilder = IosBuilder();

    return androidBuilder.build() + "\n\n" + iosBuilder.build();
  }
}

// 先建構不變的樣板 (骨架)
abstract class Builder {
  String build() {
    return "${test()}\n${lint()}\n${assemble()}\n${deploy()}";
  }

  String test();

  String lint();

  String assemble();

  String deploy();
}

// 再來就可以根據樣板，改變細節
class AndroidBuilder extends Builder {
  @override
  String test() => 'Running android tests';

  @override
  String lint() => 'Linting the android code';

  @override
  String assemble() => 'Assembling the android build';

  @override
  String deploy() => 'Deploying android build to server';
}

class IosBuilder extends Builder {
  @override
  String test() => 'Running iOS tests';

  @override
  String lint() => 'Linting the iOS code';

  @override
  String assemble() => 'Assembling the iOS build';

  @override
  String deploy() => 'Deploying iOS build to server';
}

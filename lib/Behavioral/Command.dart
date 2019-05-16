import 'package:design_pattern_dart/Display/Example.dart';

class Command extends Example {
  Command([String filePath = "lib/Behavioral/Command.dart"]) : super(filePath);

  @override
  String testRun() {
    Bulb bulb = Bulb();
    BulbCommand turnOn = TurnOn(bulb);
    BulbCommand turnOff = TurnOff(bulb);

    BulbRemoteControl control = BulbRemoteControl();

    return """
    ${control.submit(turnOn)}
    ${control.undo(turnOn)}
    ${control.submit(turnOff)}
    """;
  }
}

// 最終要處理事情的人 (Receiver) (主廚)
class Bulb {
  String turnOn() => "Bulb has been lit.";
  String turnOff() => "Darkness!";
}

// Client 只要設定好 Command 丟給 Invoker 即可
abstract class BulbCommand {
  String execute();
  String undo();
  String redo();
}

class TurnOn implements BulbCommand {
  Bulb bulb;
  TurnOn(this.bulb);

  @override
  String execute() => bulb.turnOn();

  @override
  String redo() => execute();

  @override
  String undo() => bulb.turnOff();
}

class TurnOff implements BulbCommand {
  Bulb bulb;
  TurnOff(this.bulb);

  @override
  String execute() => bulb.turnOff();

  @override
  String redo() => execute();

  @override
  String undo() => bulb.turnOn();
}

// 搖控器做為 Invoker (服務生)
class BulbRemoteControl {
  String submit(BulbCommand command) => command.execute();
  String undo(BulbCommand command) => command.undo();
}

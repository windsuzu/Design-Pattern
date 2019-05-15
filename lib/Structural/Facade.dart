import 'package:design_pattern_dart/Display/Example.dart';

class Facade extends Example {
  Facade([String filePath = "lib/Structural/Facade.dart"]) : super(filePath);

  @override
  String testRun() {
    Computer computer = Computer();
    ComputerFacade facade = ComputerFacade(computer);

    return """
// Now turn on the computer.
${facade.turnOn()}
    
// Turn off the computer.
${facade.turnOff()}
    """;
  }
}

class Computer {
  String getElectricShock() => "Ouch!";

  String makeSound() => "Beep beep!";

  String showLoadingScreen() => "Loading...";

  String bam() => "Ready to be used!";

  String closeEverything() => "Bup bup bup buzzzz!";

  String sooth() => "ZZzzz";

  String pullCurrent() => "Haaah!";
}

class ComputerFacade {
  Computer computer;

  ComputerFacade(this.computer);

  String turnOn() => """
${computer.getElectricShock()}
${computer.makeSound()}
${computer.showLoadingScreen()}
${computer.bam()}
    """;

  String turnOff() => """
${computer.closeEverything()}
${computer.pullCurrent()}
${computer.sooth()}
  """;
}

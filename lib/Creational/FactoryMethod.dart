import 'package:design_pattern_dart/Display/Example.dart';

class FactoryMethod extends Example {
  FactoryMethod([String filePath = "lib/Creational/FactoryMethod.dart"])
      : super(filePath);

  @override
  String testRun() {
    var devManager = DevelopmentManager();
    var makManager = MarketingManager();

    return """
    // Create a development manager.
    ${devManager.takeInterview()}
    
    // Create a marketing manager.
    ${makManager.takeInterview()}
    """;
  }
}

// 面試可以有「社群經營」的、可以有「開發」方面的
abstract class Interviewer {
  String askQuestions();
}

class CommunityExecutive extends Interviewer {
  @override
  String askQuestions() {
    return 'What is Community Building ?';
  }
}

class Developer extends Interviewer {
  @override
  String askQuestions() {
    return 'What is Design Pattern ?';
  }
}

// Manager 可以是開發面試官、可以是社群經營面試官，但都屬於 HiringManager
// 兩者都可以直接使用 takeInterview() 的函式
abstract class HiringManager {
  Interviewer _makeInterviewer();

  String takeInterview() {
    var interviewer = _makeInterviewer();
    return interviewer.askQuestions();
  }
}

class DevelopmentManager extends HiringManager {
  @override
  Interviewer _makeInterviewer() {
    return Developer();
  }
}

class MarketingManager extends HiringManager {
  @override
  Interviewer _makeInterviewer() {
    return CommunityExecutive();
  }
}

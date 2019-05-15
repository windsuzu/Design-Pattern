import 'package:design_pattern_dart/Display/Example.dart';

class Decorator extends Example {
  Decorator([String filePath = "lib/Structural/Decorator.dart"])
      : super(filePath);

  @override
  String testRun() {
    // 第一杯我想要加牛奶就好
    Coffee coffee1 = GeneralCoffee();
    coffee1 = Milk(coffee1);

    // 第二杯我想要全加
    Coffee coffee2 = GeneralCoffee();
    coffee2 = Milk(coffee2);
    coffee2 = Whip(coffee2);
    coffee2 = Vanilla(coffee2);

    return """
    ${coffee1.getDescription()}
    Price : ${coffee1.getCost()}
    
    ${coffee2.getDescription()}
    Price: ${coffee2.getCost()}
    """;
  }
}

// 咖啡可以加料，加料要多加價，那應該怎麼做呢
abstract class Coffee {
  double getCost();

  String getDescription();
}

// 一般咖啡做為基底，讓他可以被加入各式調味料
class GeneralCoffee implements Coffee {
  @override
  double getCost() => 5;

  @override
  String getDescription() => "Normal Coffee";
}

// 牛奶
class Milk implements Coffee {
  Coffee base;

  Milk(this.base);

  @override
  double getCost() => base.getCost() + 2;

  @override
  String getDescription() => base.getDescription() + ", Milk";
}

// 鮮奶油
class Whip implements Coffee {
  Coffee base;

  Whip(this.base);

  @override
  double getCost() => base.getCost() + 3;

  @override
  String getDescription() => base.getDescription() + ", Whip";
}

// 香草
class Vanilla implements Coffee {
  Coffee base;

  Vanilla(this.base);

  @override
  double getCost() => base.getCost() + 4;

  @override
  String getDescription() => base.getDescription() + ", Vanilla";
}

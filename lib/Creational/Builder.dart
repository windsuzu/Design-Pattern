import 'package:design_pattern_dart/Display/Example.dart';

class Builder extends Example {
  Builder([String filePath = "lib/Creational/Builder.dart"]) : super(filePath);

  @override
  String testRun() {
    var noLettuceBurger =
        BurgerBuilder(15)
            .addBeef()
            .addCheese()
            .addTomato()
            .build();

    return noLettuceBurger.content();
  }
}

class Burger {
  double _size;
  bool _cheese;
  bool _beef;
  bool _lettuce;
  bool _tomato;

  Burger._();

// Not good:  Burger(this._size, this._cheese, this._beef, this._lettuce, this._tomato);

  Burger(BurgerBuilder builder) {
    _size = builder._size;
    _cheese = builder._cheese;
    _beef = builder._beef;
    _lettuce = builder._lettuce;
    _tomato = builder._tomato;
  }

  String content() => """
  Your Burger size: $_size,
  Cheese: $_cheese,
  Beef: $_beef,
  Lettuce: $_lettuce,
  Tomato: $_tomato.
  """;
}

// 利用 Builder 方式來建構物件，最後再以 build() 返回
class BurgerBuilder {
  double _size;
  bool _cheese = false;
  bool _beef = false;
  bool _lettuce = false;
  bool _tomato = false;

  BurgerBuilder(this._size);

  BurgerBuilder addCheese() {
    _cheese = true;
    return this;
  }

  BurgerBuilder addBeef() {
    _beef = true;
    return this;
  }

  BurgerBuilder addLettuce() {
    _lettuce = true;
    return this;
  }

  BurgerBuilder addTomato() {
    _tomato = true;
    return this;
  }

  Burger build() => Burger(this);
}

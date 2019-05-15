import 'package:design_pattern_dart/Display/Example.dart';

class FlyWeight extends Example {
  FlyWeight([String filePath = "lib/Structural/FlyWeight.dart"])
      : super(filePath);

  @override
  String testRun() {
    TeaMaker teaMaker = TeaMaker();
    TeaShop shop = TeaShop(teaMaker);

    shop.takeOrder("less sugar", 1);
    shop.takeOrder("less ice", 2);
    shop.takeOrder("add milk", 5);

    return shop.serve();
  }
}

class Tea {}

// 利用類似 factory 方式儲存 Tea 的 cache 減少記憶體的浪費
class TeaMaker {
  Map<String, Tea> availableTea = {};

  Tea make(String teaPreference) {
    if (availableTea[teaPreference] == null) {
      availableTea[teaPreference] = Tea();
    }
    return availableTea[teaPreference];
  }
}

// teaMaker 在 makeTea 時就會先去找是否已經有做好的 tea 。
class TeaShop {
  List<Tea> orders = List.filled(10, null);
  TeaMaker _teaMaker;

  TeaShop(this._teaMaker);

  void takeOrder(String teaType, int index) {
    orders[index] = _teaMaker.make(teaType);
  }

  String serve() {
    String ordersResult = "";

    orders.forEach((tea) {
      if (tea != null) {
        ordersResult += "Serving tea to table #${orders.indexOf(tea)}\n";
      }
    });

    return ordersResult;
  }
}

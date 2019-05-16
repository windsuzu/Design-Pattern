import 'package:design_pattern_dart/Display/Example.dart';

class ChainOfResponsibility extends Example {
  ChainOfResponsibility(
      [String filePath = "lib/Behavioral/ChainOfResponsibility.dart"])
      : super(filePath);

  @override
  String testRun() {
    Account bank = Bank(100);
    Account paypal = Paypal(200);
    Account bitcoin = Bitcoin(300);

    bank.setNext(paypal);
    paypal.setNext(bitcoin);

    return bank.pay(259);
  }
}

// 建立三個帳戶到 chain 中
abstract class Account {
  Account _successor;
  double _balance;

  Account(this._balance);

  // 讓客戶端能自由調整 chain 的下一個物件
  void setNext(Account next) {
    _successor = next;
  }

  // 現在的帳戶不夠錢就交給下一個帳戶
  String pay(double amountToPay) {
    if (canPay(amountToPay)) {
      return "Paid $amountToPay using ${this.runtimeType.toString()}";
    } else if (_successor != null) {
      var reject =
          "Cannot pay using ${this.runtimeType.toString()}. Proceeding ... \n";
      reject += _successor.pay(amountToPay);
      return reject;
    } else {
      return "None of the accounts have enough balance";
    }
  }

  bool canPay(double amountToPay) => _balance >= amountToPay;
}

class Bank extends Account {
  Bank(double balance) : super(balance);
}

class Paypal extends Account {
  Paypal(double balance) : super(balance);
}

class Bitcoin extends Account {
  Bitcoin(double balance) : super(balance);
}

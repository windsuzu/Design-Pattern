import 'package:design_pattern_dart/Display/Example.dart';

class Composite extends Example {
  Composite([String filePath = "lib/Structural/Composite.dart"])
      : super(filePath);

  @override
  String testRun() {
    var jay = Developer("Jay Wang", 10000);
    var wei = Designer("Wei Chang", 1);

    var jayIsBetterCompany = Company();
    jayIsBetterCompany.addEmployee(jay);
    jayIsBetterCompany.addEmployee(wei);

    return " Net salary is ${jayIsBetterCompany.getNetSalaries()}";
  }
}

// 公司的員工可以有 開發者 和 設計師
abstract class Employee {
  String name;
  String role;
  double salary;

  Employee(this.name, this.salary, [this.role]);
}

class Developer extends Employee {
  Developer(String name, double salary, [String role]) : super(name, salary);
}

class Designer extends Employee {
  Designer(String name, double salary, [String role]) : super(name, salary);
}

// 為了要方便管理員工，我們將他們加入到 company 這個樹狀結構中
class Company {
  List<Employee> _employees = [];

  void addEmployee(Employee employee) {
    _employees.add(employee);
  }

  double getNetSalaries() {
    return _employees
        .map((employee) => employee.salary)
        .fold(0, (net, salary) => net + salary);
  }
}

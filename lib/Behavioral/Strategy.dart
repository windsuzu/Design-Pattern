import 'package:design_pattern_dart/Display/Example.dart';

class Strategy extends Example {
  Strategy([String filePath = "lib/Behavioral/Strategy.dart"])
      : super(filePath);

  @override
  String testRun() {
    Sorter sorter = Sorter(MergeSortStrategy());
    var result1 = sorter.sort([1, 2, 3]);
    sorter = Sorter(QuickSortStrategy());
    var result2 = sorter.sort([1, 2, 3]);

    return "$result1 \n$result2";
  }
}

// 同樣是 sort method ，我們在不同情況可能會使用 merge sort ，有的情況會使用 quick sort
abstract class SortStrategy {
  String sort(List array);
}

class MergeSortStrategy implements SortStrategy {
  @override
  String sort(List array) => "Sort using merge sort";
}

class QuickSortStrategy implements SortStrategy {
  @override
  String sort(List array) => "Sort using quick sort";
}

// 這時候策略模式就可以動態決定要使用哪一種方法實作
class Sorter {
  SortStrategy _sorter;

  Sorter(this._sorter);

  String sort(List array) => _sorter.sort(array);
}

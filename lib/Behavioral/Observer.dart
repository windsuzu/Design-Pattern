import 'package:design_pattern_dart/Display/Example.dart';

class Observer extends Example {
  Observer([String filePath = "lib/Behavioral/Observer.dart"])
      : super(filePath);

  @override
  String testRun() {
    var jay = JobSeeker("Jay");
    var wei = JobSeeker("Wei");

    var agency = EmploymentAgency();
    agency.attach(jay);
    agency.attach(wei);

    agency.postJob(JobPost("Software Engineer"));
    agency.postJob(JobPost("Marketing Manager"));

    // 使用完記得要 dispose 避免記憶體膨脹
    agency.detach(jay);
    agency.detach(wei);
    return """
    Hi, Jay, New job posted: Software Engineer.
    Hi, Wei, New job posted: Software Engineer.
    
    Hi, Jay, New job posted: Marketing Manager.
    Hi, Wei, New job posted: Marketing Manager.
    """;
  }
}

class JobPost {
  String _title;

  JobPost(this._title);
}

// Observer 負責接收 Observable 的更新
abstract class JobObserver {
  void update(JobPost post);
}

// Observable 則發送最新訊息給所有訂閱的 Observer
abstract class JobObservable {
  void notify(JobPost post);

  void attach(JobObserver observer);

  void detach(JobObserver observer);
}

// 實作 observer 的找工作者
class JobSeeker implements JobObserver {
  String _name;

  JobSeeker(this._name);

  @override
  void update(JobPost post) =>
      print("Hi, $_name, New job posted: ${post._title}.");
}

// 實作 observable 的職缺中心
class EmploymentAgency implements JobObservable {
  static List<JobObserver> _observers = [];

  void notify(JobPost post) {
    _observers.forEach((observer) => observer.update(post));
  }

  void attach(JobObserver observer) => _observers.add(observer);

  void detach(JobObserver observer) => _observers.remove(observer);

  void postJob(JobPost post) => notify(post);
}

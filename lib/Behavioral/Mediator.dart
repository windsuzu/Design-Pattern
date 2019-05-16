import 'package:design_pattern_dart/Display/Example.dart';
import 'package:intl/intl.dart';

class Mediator extends Example {
  Mediator([String filePath = "lib/Behavioral/Mediator.dart"])
      : super(filePath);

  @override
  String testRun() {
    ChatRoomMediator mediator = ChatRoom();
    User jay = User("Jay", mediator);
    User wei = User("Wei", mediator);

    return """
    ${jay.send("Hello !")}
    ${wei.send("Hi !")}
    """;
  }
}

// 我們讓聊天室成為 Mediator
abstract class ChatRoomMediator {
  String showMessage(User user, String message);
}

class ChatRoom implements ChatRoomMediator {
  @override
  String showMessage(User user, String message) {
    String dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    String sender = user._name;
    return "$dateTime [ $sender ]: $message";
  }
}

// 用戶傳送訊息時，需經過 Mediator 的調用
class User {
  String _name;
  ChatRoomMediator _mediator;

  User(this._name, this._mediator);

  String send(String message) => _mediator.showMessage(this, message);
}

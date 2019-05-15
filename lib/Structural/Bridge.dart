import 'package:design_pattern_dart/Display/Example.dart';

class Bridge extends Example {
  Bridge([String filePath = "lib/Structural/Bridge.dart"]) : super(filePath);

  @override
  String testRun() {
    final lightTheme = LightTheme();
    final darkTheme = DarkTheme();

    final homePage = HomePage(lightTheme);
    final aboutPage = AboutPage(darkTheme);

    return """
    // Check our home page with light theme.
    ${homePage.content()}
    
    // Check our about page with dark theme.
    ${aboutPage.content()}
    """;
  }
}

// 我們有兩種 Theme 可以使用。
abstract class MyTheme {
  String getColor();

  String getFont();
}

class DarkTheme implements MyTheme {
  @override
  String getColor() => "Dark black";

  @override
  String getFont() => "Arial";
}

class LightTheme implements MyTheme {
  @override
  String getColor() => "Light white";

  @override
  String getFont() => "Times New Roman";
}

// 我們的網站則有 "主頁"還有 "關於我頁面"，若使用繼承，需要製作四種不同網頁。
// 但這裡使用 Bridge pattern 。
abstract class WebPage {
  MyTheme theme;

  WebPage(this.theme);

  String content();
}

class HomePage extends WebPage {
  HomePage(MyTheme theme) : super(theme);

  @override
  String content() =>
      "This is home page in ${theme.getColor()} color and ${theme.getFont()} font.";
}

class AboutPage extends WebPage {
  AboutPage(MyTheme theme) : super(theme);

  @override
  String content() =>
      "This is about page in ${theme.getColor()} color and ${theme.getFont()} font.";
}

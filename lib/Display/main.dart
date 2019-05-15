import 'package:flutter/material.dart';
import 'DisplayView.dart';
import 'TextScaleFactorBloc.dart';
import 'Example.dart';
import 'package:design_pattern_dart/Creational/SimpleFactory.dart';
import 'package:design_pattern_dart/Creational/FactoryMethod.dart';
import 'package:design_pattern_dart/Creational/AbstractFactory.dart';
import 'package:design_pattern_dart/Creational/Builder.dart' as BuilderPattern;
import 'package:design_pattern_dart/Creational/Prototype.dart';
import 'package:design_pattern_dart/Creational/Singleton.dart';
import 'package:design_pattern_dart/Structural/Adapter.dart';
import 'package:design_pattern_dart/Structural/Bridge.dart';
import 'package:design_pattern_dart/Structural/Composite.dart';
import 'package:design_pattern_dart/Structural/Decorator.dart';
import 'package:design_pattern_dart/Structural/Facade.dart';
import 'package:design_pattern_dart/Structural/FlyWeight.dart';
import 'package:design_pattern_dart/Structural/Proxy.dart';
import 'package:design_pattern_dart/Behavioral/ChainOfResponsibility.dart';
import 'package:design_pattern_dart/Behavioral/Command.dart';
import 'package:design_pattern_dart/Behavioral/Iterator.dart';
import 'package:design_pattern_dart/Behavioral/Mediator.dart';
import 'package:design_pattern_dart/Behavioral/Memento.dart';
import 'package:design_pattern_dart/Behavioral/Observer.dart';
import 'package:design_pattern_dart/Behavioral/State.dart' as StatePattern;
import 'package:design_pattern_dart/Behavioral/Strategy.dart';
import 'package:design_pattern_dart/Behavioral/Template.dart';
import 'package:design_pattern_dart/Behavioral/Visitor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Pattern Dart',
      home: MyHomePage(),
    );
  }
}

List list = <dynamic>[
  "Creational",
  SimpleFactory(),
  FactoryMethod(),
  AbstractFactory(),
  BuilderPattern.Builder(),
  Prototype(),
  Singleton(),
  "Structural",
  Adapter(),
  Bridge(),
  Composite(),
  Decorator(),
  Facade(),
  FlyWeight(),
  Proxy(),
  "Behavioral",
  ChainOfResponsibility(),
  Command(),
  Iterator(),
  Mediator(),
  Memento(),
  Observer(),
  StatePattern.State(),
  Strategy(),
  Template(),
  Visitor(),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Design Pattern Dart"),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return (list[index] is String)
                  ? _buildHeader(list[index])
                  : _buildListContent(
                      content: list[index].runtimeType.toString(),
                      example: list[index]);
            }));
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.layers,
            color: Colors.teal,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            softWrap: true,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }

  Widget _buildListContent({String content, Example example}) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider<TextScaleFactorBloc>(
                bloc: TextScaleFactorBloc(),
                child: DisplayView(
                  example: example,
                ),
              ))),
      title: Text(content),
    );
  }
}

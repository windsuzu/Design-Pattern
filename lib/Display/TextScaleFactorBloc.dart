import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class TextScaleFactorBloc extends BlocBase {
  double _textScaleFactor = 1.0;
  StreamController _streamBuilder = StreamController<double>.broadcast();

  StreamSink<double> get _sink => _streamBuilder.sink;

  Stream<double> get out => _streamBuilder.stream;

  void increaseTextScale() {
    _textScaleFactor += 0.1;
    _sink.add(_textScaleFactor);
  }

  void decreaseTextScale() {
    _textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
    _sink.add(_textScaleFactor);
  }

  void dispose() {
    _streamBuilder.close();
  }
}

// 所有 BLoCs 的通用接口
abstract class BlocBase {
  void dispose();
}

// 通用 BLoC provider
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

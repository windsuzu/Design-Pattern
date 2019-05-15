import 'package:flutter/material.dart';
import 'Example.dart';
import 'CodeView.dart';
import 'TextScaleFactorBloc.dart';

class DisplayView extends StatelessWidget {
  DisplayView({@required this.example});

  final Example example;

  Widget build(BuildContext context) {
    final TextScaleFactorBloc bloc =
        BlocProvider.of<TextScaleFactorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(example.runtimeType.toString()),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.zoom_out,
                color: Colors.white,
              ),
              onPressed: () => bloc.decreaseTextScale()),
          IconButton(
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            onPressed: () => bloc.increaseTextScale(),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle("Code", context),
              Expanded(flex: 85, child: _buildCodeView()),
              SizedBox(
                height: 8,
              ),
              _buildTitle("Result", context),
              Expanded(flex: 15, child: _buildResultView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(color: Colors.teal, letterSpacing: 1),
      ),
    );
  }

  Widget _buildCodeView() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue[200],
        )),
        padding: EdgeInsets.all(8.0),
        child: CodeView(filePath: example.sourceFilePath));
  }

  Widget _buildResultView() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.green[200],
      )),
      child: Scrollbar(
          child: SingleChildScrollView(
              child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0).copyWith(right: 8),
          child: Text(
            example.testRun(),
            style: TextStyle(fontFamily: "monospace", fontSize: 12),
          ),
        ),
      ))),
    );
  }
}

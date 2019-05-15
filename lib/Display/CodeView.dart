import 'package:flutter/material.dart';
import 'SyntaxHighlighter.dart';
import 'TextScaleFactorBloc.dart';

class CodeView extends StatefulWidget {
  final String filePath;

  CodeView({@required this.filePath});

  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  TextScaleFactorBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSourceCode(),
      builder: (context, snapshot) {
        return (snapshot.hasData)
            ? Padding(
                padding: EdgeInsets.all(4.0),
                child: _buildCodeView(snapshot.data),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Future<String> _getSourceCode() {
    return DefaultAssetBundle.of(context).loadString(widget.filePath) ??
        "Error Source Code";
  }

  Widget _buildCodeView(String codeContent) {
    return _buildCodeBase(codeContent);
  }

  Widget _buildCodeBase(String codeContent) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    DartSyntaxHighlighter(style).format(codeContent);
    final TextScaleFactorBloc bloc =
        BlocProvider.of<TextScaleFactorBloc>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<double>(
              stream: bloc.out,
              initialData: 1.0,
              builder: (context, snapshot) {
                return RichText(
                    textScaleFactor: snapshot.data,
                    text: TextSpan(
                        style:
                            TextStyle(fontFamily: 'monospace', fontSize: 12.0),
                        children: <TextSpan>[
                          DartSyntaxHighlighter(style).format(codeContent)
                        ]));
              }),
        ),
      )),
    );
  }
}

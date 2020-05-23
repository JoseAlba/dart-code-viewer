import 'package:flutter/material.dart';
import 'package:dart_code_viewer/dart_code_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Dart Code Viewer Example')),
        body: DartCodeViewer(r'''

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart_code_viewer_theme.dart';
import 'prehighlighter.dart';

class DartCodeViewer extends StatelessWidget {
  const DartCodeViewer(
    this.data, {
    Key key,
    this.baseStyle,
    this.classStyle,
    this.commentStyle,
    this.constantStyle,
    this.keywordStyle,
    this.numberStyle,
    this.punctuationStyle,
    this.stringStyle,
    this.backgroundColor,
    this.copyButtonText,
    this.showCopyButton,
    this.height,
    this.width,
  }) : assert(data != null, 'A non-null String must be provided to a DartCodeViewer widget.'),
      super(key: key);

  factory DartCodeViewer.textColor(
    String data, {
    TextStyle textStyle,
    Color baseColor,
    Color classColor,
    Color commentColor,
    Color constantColor,
    Color keywordColor,
    Color numberColor,
    Color punctuationColor,
    Color stringColor,
    Color backgroundColor,
    Text copyButtonText,
    bool showCopyButton,
    double height,
    double width,
  }) {
    TextStyle _defaultCodeStyle = textStyle ?? GoogleFonts.robotoMono(fontSize: 12);
    return DartCodeViewer(
      data,
      baseStyle: _defaultCodeStyle.copyWith(color: baseColor),
      classStyle: _defaultCodeStyle.copyWith(color: classColor),
      commentStyle: _defaultCodeStyle.copyWith(color: commentColor),
      constantStyle: _defaultCodeStyle.copyWith(color: constantColor),
      keywordStyle: _defaultCodeStyle.copyWith(color: keywordColor),
      numberStyle: _defaultCodeStyle.copyWith(color: numberColor),
      punctuationStyle: _defaultCodeStyle.copyWith(color: punctuationColor),
      stringStyle: _defaultCodeStyle.copyWith(color: stringColor),
      backgroundColor: backgroundColor,
      copyButtonText: copyButtonText,
      showCopyButton: showCopyButton,
      height: height,
      width: width,
    );
  }

  factory DartCodeViewer.light(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.blueGrey.shade100,
      classColor: Colors.purple.shade500,
      commentColor: Colors.pink.shade600,
      constantColor: Colors.indigo.shade50,
      keywordColor: Colors.indigo.shade500,
      numberColor: Colors.red.shade700,
      punctuationColor: Colors.blueGrey.shade800,
      stringColor: Colors.green.shade700,
      backgroundColor: Colors.grey.shade100,
    );
  }

  factory DartCodeViewer.lightAlt(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.black,
      classColor: Color(0xFF673AB7),
      commentColor: Color(0xFF999999),
      constantColor: Color(0xFFE67C73),
      keywordColor: Color(0xFF4285F4),
      numberColor: Color(0xFFDB4437),
      punctuationColor: Color(0xFFA3A3A3),
      stringColor: Color(0xFF0F9D58),
      backgroundColor: Color(0xFFEEEEEE),
    );
  }

  factory DartCodeViewer.dark(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.blueGrey.shade50,
      classColor: Colors.purple.shade200,
      commentColor: Colors.pink.shade300,
      constantColor: Colors.yellow.shade700,
      keywordColor: Colors.cyan.shade300,
      numberColor: Colors.yellow.shade700,
      punctuationColor: Colors.blueGrey.shade50,
      stringColor: Colors.lightGreen.shade400,
      backgroundColor: Colors.grey.shade900,
    );
  }

  factory DartCodeViewer.darkAlt(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.white,
      classColor: Color(0xFFFF8A65),
      commentColor: Color(0xFFAAAAAA),
      constantColor: Color(0xFFE67C73),
      keywordColor: Color(0xFF7BAAF7),
      numberColor: Color(0xFFF4B400),
      punctuationColor: Color(0xFFA3A3A3),
      stringColor: Color(0xFF57BB8A),
      backgroundColor: Color(0xFF000000),
    );
  }

  factory DartCodeViewer.designDark(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.white,
      classColor: Color(0xFFFF8A80),
      commentColor: Color(0xFF607D8B),
      constantColor: Color(0xFF90A4AE),
      keywordColor: Color(0xFF26C6DA),
      numberColor: Color(0xFFFFBC00),
      punctuationColor: Color(0xFF90A4AE),
      stringColor: Color(0xFF00BFA4),
      backgroundColor: Color(0xFF263238),
    );
  }

  factory DartCodeViewer.io17(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.white,
      classColor: Color(0xFFFF8857),
      commentColor: Color(0xFFFF5CB4),
      constantColor: Color(0xFF90A4AE),
      keywordColor: Color(0xFF00E4FF),
      numberColor: Color(0xFFFFD500),
      punctuationColor: Color(0xFF90A4AE),
      stringColor: Color(0xFF1CE8b5),
      backgroundColor: Color(0xFF263238),
    );
  }

  factory DartCodeViewer.io19(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Colors.white,
      classColor: Color(0xFFEE675C),
      commentColor: Color(0xFF9AA0A6),
      constantColor: Color(0xFFFCC934),
      keywordColor: Color(0xFF669DF6),
      numberColor: Color(0xFFFCC934),
      punctuationColor: Color(0xFF9AA0A6),
      stringColor: Color(0xFF5BB974),
      backgroundColor: Color(0xFF202124),
    );
  }

  factory DartCodeViewer.flutterInteract19(String data) {
    return DartCodeViewer.textColor(
      data,
      baseColor: Color(0xFFFAFBFB),
      classColor: Color(0xFFD65BAD),
      commentColor: Color(0xFF808080),
      constantColor: Color(0xFFFF8383),
      keywordColor: Color(0xFF1CDEC9),
      numberColor: Color(0xFFBD93F9),
      punctuationColor: Color(0xFF8BE9FD),
      stringColor: Color(0xFFffa65c),
      backgroundColor: Color(0xFF241e30),
    );
  }

  final TextStyle baseStyle;
  final TextStyle classStyle;
  final TextStyle commentStyle;
  final TextStyle constantStyle;
  final TextStyle keywordStyle;
  final TextStyle numberStyle;
  final TextStyle punctuationStyle;
  final TextStyle stringStyle;
  final String data;

  final Color backgroundColor;
  final Text copyButtonText;
  final bool showCopyButton;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final codeTextStyle = GoogleFonts.robotoMono(
        fontSize: 12 * MediaQuery.of(context).textScaleFactor,
    );

    /// Uses device brightness to choose what type of theme to return.
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    bool lightModeOn = brightness == Brightness.light;

    TextStyle _defaultBaseStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.blueGrey.shade100 : Colors.blueGrey.shade50
    );
    TextStyle _defaultClassStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.purple.shade500 : Colors.purple.shade200
    );
    TextStyle _defaultCommentStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.pink.shade600 : Colors.pink.shade300
    );
    TextStyle _defaultConstantStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.indigo.shade50 : Colors.yellow.shade700
    );
    TextStyle _defaultKeywordStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.indigo.shade500 : Colors.cyan.shade300
    );
    TextStyle _defaultNumberStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.red.shade700 : Colors.yellow.shade700
    );
    TextStyle _defaultPunctuationalStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.blueGrey.shade800 : Colors.blueGrey.shade50
    );
    TextStyle _defaultStringStyle = codeTextStyle.copyWith(
      color: lightModeOn ? Colors.green.shade700 : Colors.lightGreen.shade400
    );

    Text _defaultCopyButtonText = Text(''
      'COPY ALL',
      style: Theme.of(context).textTheme.button.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
    bool _defaultShowCopyButton = true;

    DartCodeViewerThemeData dartCodeViewerThemeData = DartCodeViewerTheme.of(context);
    dartCodeViewerThemeData = dartCodeViewerThemeData.copyWith(
      baseStyle: baseStyle ?? dartCodeViewerThemeData.baseStyle ?? _defaultBaseStyle,
      classStyle: classStyle ?? dartCodeViewerThemeData.classStyle ?? _defaultClassStyle,
      commentStyle: commentStyle ?? dartCodeViewerThemeData.commentStyle ?? _defaultCommentStyle,
      constantStyle: constantStyle ?? dartCodeViewerThemeData.constantStyle ?? _defaultConstantStyle,
      keywordStyle: keywordStyle ?? dartCodeViewerThemeData.keywordStyle ?? _defaultKeywordStyle,
      numberStyle: numberStyle ?? dartCodeViewerThemeData.numberStyle ?? _defaultNumberStyle,
      punctuationStyle: punctuationStyle ?? dartCodeViewerThemeData.punctuationStyle ?? _defaultPunctuationalStyle,
      stringStyle: stringStyle ?? dartCodeViewerThemeData.stringStyle ?? _defaultStringStyle,
      backgroundColor: backgroundColor ?? dartCodeViewerThemeData.backgroundColor ?? Theme.of(context).colorScheme.background,
      copyButtonText: copyButtonText ?? dartCodeViewerThemeData.copyButtonText ?? _defaultCopyButtonText,
      showCopyButton: showCopyButton ?? dartCodeViewerThemeData.showCopyButton ?? _defaultShowCopyButton,
      height: height ?? dartCodeViewerThemeData.height ?? MediaQuery.of(context).size.height,
      width: width ?? dartCodeViewerThemeData.width ?? MediaQuery.of(context).size.width,
    );

    return DartCodeViewerTheme(
      data: dartCodeViewerThemeData,
      child: Container(
        color: dartCodeViewerThemeData.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: dartCodeViewerThemeData.height,
        width: dartCodeViewerThemeData.width,
        child: _DartCodeViewerPage(
          codifyString(data, dartCodeViewerThemeData),
        ),
      ),
    );
  }

  InlineSpan codifyString(String content, DartCodeViewerThemeData dartCodeViewerThemeData) {
    List<TextSpan> textSpans = [];
    final codeSpans = DartSyntaxPrehighlighter().format(content);
    // Converting CodeSpan to TextSpan by first converting to String and then TextSpan.
    for (final span in codeSpans) {
      textSpans.add(stringToTextSpan(span.toString(), dartCodeViewerThemeData));
    }
    return TextSpan(children: textSpans);
  }

  TextSpan stringToTextSpan(String string, DartCodeViewerThemeData dartCodeViewerThemeData) {
    return TextSpan(
      style: () {
        String styleString = RegExp(r'codeStyle.\w*').firstMatch(string).group(0);
        DartCodeViewerThemeData dartCodeViewerTheme = dartCodeViewerThemeData;

        switch (styleString) {
          case 'codeStyle.baseStyle':
            return dartCodeViewerTheme.baseStyle;
          case 'codeStyle.numberStyle':
            return dartCodeViewerTheme.numberStyle;
          case 'codeStyle.commentStyle':
            return dartCodeViewerTheme.commentStyle;
          case 'codeStyle.keywordStyle':
            return dartCodeViewerTheme.keywordStyle;
          case 'codeStyle.stringStyle':
            return dartCodeViewerTheme.stringStyle;
          case 'codeStyle.punctuationStyle':
            return dartCodeViewerTheme.punctuationStyle;
          case 'codeStyle.classStyle':
            return dartCodeViewerTheme.classStyle;
          case 'codeStyle.constantStyle':
            return dartCodeViewerTheme.constantStyle;
          default:
            return dartCodeViewerTheme.baseStyle;
        }
      }(),
      text: () {
        String textString = RegExp('\'.*\'').firstMatch(string).group(0);
        String subString = textString.substring(1, textString.length - 1);
        return decodeString(subString);
      }(),
    );
  }
}

class _DartCodeViewerPage extends StatelessWidget {
  const _DartCodeViewerPage(this.code);
  final InlineSpan code;

  @override
  Widget build(BuildContext context) {
    final _richTextCode = code;
    final _plainTextCode = _richTextCode.toPlainText();

    void _showSnackBarOnCopySuccess(dynamic result) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to Clipboard'),
        ),
      );
    }

    void _showSnackBarOnCopyFailure(Object exception) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Failure to copy to clipboard: $exception'),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (DartCodeViewerTheme.of(context).showCopyButton)
          FlatButton(
            color: Colors.white.withOpacity(0.15),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            onPressed: () async {
              await Clipboard.setData(
                  ClipboardData(text: _plainTextCode)
              ).then(_showSnackBarOnCopySuccess)
               .catchError(_showSnackBarOnCopyFailure);
            },
            child: DartCodeViewerTheme.of(context).copyButtonText,
          ),
        Expanded(
          child: SingleChildScrollView(
            child: RichText(
              textDirection: TextDirection.ltr,
              text: _richTextCode,
            ),
          ),
        ),
      ],
    );
  }
}

      ''',
       ),
      ),
    );
  }
}

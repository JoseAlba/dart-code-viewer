import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Holds the color, size, and text styles for a dart code viewer theme.
///
/// Use this class to configure a [DartCodeViewerThemeData] widget.
///
/// To obtain the current ambient dart code viewer theme, use [DartCodeViewerTheme.of].
///
/// The parts of the dart code viewer are:
/// * The 'data, which is the String that is supposed to be transformed into dart
/// highlighted code.
/// * The 'highlightedTextStyle' which the different type of highlighted code that
/// can be highlighted differently.
///
/// The simplest way to create a DartCodeThemeData is to use the [copyWith] on
/// the one you get from [DartCodeViewerTheme.of], or create an entirely new one
/// with [DartCodeViewerThemeData].
///
/// {@tool dartpad --template=stateless_widget_scaffold}
///
/// Here is an example of a small string that shows up as Dart code in a flutter
/// application. With [DartCodeViewerThemeData] applied
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return DartCodeViewerTheme(
///     data: DartCodeViewerThemeData(
///       backgroundColor: Colors.pink,
///       child: DartCodeViewer(r'class DartCodeViewer extends StatelessWidget {}'),
///     );
///   );
/// }
/// ```
/// {@end-tool}
///
/// See also:
/// * [DartCodeViewerThemeData], which describes the actual configuration of a
/// [DartCodeViewerTheme]
///  * [Code viewer online tool](https://romannurik.github.io/SlidesCodeHighlighter/)
///  is a useful tool that lets you choose the color for each different style.
///  On the left side you put your example code and on the right you can choose
///  the colors you want the code viewer to display.
///    background => backgroundColor
///    plain text => baseStyle
///    Punctuation => punctuationStyle
///    String, values => stringStyle
///    Keywords, tags => keywordStyle
///    Comments => commentStyle
///    Types => classStyle
///    Numbers => numberStyle
///    Declarations => constantStyle
@immutable
class DartCodeViewerThemeData with Diagnosticable {
  const DartCodeViewerThemeData({
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
    this.buttonStyle,
  });

  /// The text style for the plain text in code.
  final TextStyle? baseStyle;

  /// The text style for the code types in the code.
  ///
  /// For example:
  /// * The class name.
  /// * StatelessWidget and StatefulWidget.
  final TextStyle? classStyle;

  /// The text style for the commented out code.
  final TextStyle? commentStyle;

  /// The text style for the constant style code.
  final TextStyle? constantStyle;

  /// The text style for keywords. For example:
  /// * else
  /// * enum
  /// * export
  /// * external
  /// * factory
  /// * false
  final TextStyle? keywordStyle;

  /// The text style for numbers within the code.
  final TextStyle? numberStyle;

  /// The text style for punctuation code like periods and commas.
  final TextStyle? punctuationStyle;

  /// The text style for Strings. For example the data when using the [Text] widget.
  final TextStyle? stringStyle;

  /// The background Color of the code. By default it is [Theme.of(context).colorScheme.background].
  final Color? backgroundColor;

  /// The text shown in the copy button by default it is 'COPY ALL'.
  final Text? copyButtonText;

  /// Shows copy button that lets user copy all the code as a raw string. By
  /// default the button is showing.
  final bool? showCopyButton;

  /// The height of the [DartCodeViewer] by default it uses the [MediaQuery.of(context).size.height]
  final double? height;

  /// The width of the [DartCodeViewer] by default it uses the [MediaQuery.of(context).size.width]
  final double? width;

  /// The buttonThemeData for the [DartCodeViewer]. Useful if you want the copy
  /// button to appear differently than the default.
  final ButtonStyle? buttonStyle;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  DartCodeViewerThemeData copyWith({
    TextStyle? baseStyle,
    TextStyle? classStyle,
    TextStyle? commentStyle,
    TextStyle? constantStyle,
    TextStyle? keywordStyle,
    TextStyle? numberStyle,
    TextStyle? punctuationStyle,
    TextStyle? stringStyle,
    Color? backgroundColor,
    Text? copyButtonText,
    bool? showCopyButton,
    double? height,
    double? width,
    ButtonStyle? buttonStyle,
  }) {
    return DartCodeViewerThemeData(
      baseStyle: baseStyle ?? this.baseStyle,
      classStyle: classStyle ?? this.classStyle,
      commentStyle: commentStyle ?? this.commentStyle,
      constantStyle: constantStyle ?? this.constantStyle,
      keywordStyle: keywordStyle ?? this.keywordStyle,
      numberStyle: numberStyle ?? this.numberStyle,
      punctuationStyle: punctuationStyle ?? this.punctuationStyle,
      stringStyle: stringStyle ?? this.stringStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      copyButtonText: copyButtonText ?? this.copyButtonText,
      showCopyButton: showCopyButton ?? this.showCopyButton,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  /// Linearly interpolate between two dart code viewer themes.
  ///
  /// The arguments must not be null.
  static DartCodeViewerThemeData lerp(
    DartCodeViewerThemeData a,
    DartCodeViewerThemeData b,
    double t,
  ) {
    return DartCodeViewerThemeData(
      baseStyle: TextStyle.lerp(a.baseStyle, b.baseStyle, t),
      classStyle: TextStyle.lerp(a.classStyle, b.classStyle, t),
      commentStyle: TextStyle.lerp(a.commentStyle, b.commentStyle, t),
      constantStyle: TextStyle.lerp(a.constantStyle, b.constantStyle, t),
      keywordStyle: TextStyle.lerp(a.keywordStyle, b.keywordStyle, t),
      numberStyle: TextStyle.lerp(a.numberStyle, b.numberStyle, t),
      punctuationStyle: TextStyle.lerp(
        a.punctuationStyle,
        b.punctuationStyle,
        t,
      ),
      stringStyle: TextStyle.lerp(a.stringStyle, b.stringStyle, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      height: lerpDouble(a.height, b.height, t),
      width: lerpDouble(a.width, b.width, t),
    );
  }

  @override
  int get hashCode {
    return hashValues(
      baseStyle,
      classStyle,
      commentStyle,
      constantStyle,
      keywordStyle,
      numberStyle,
      punctuationStyle,
      stringStyle,
      backgroundColor,
      copyButtonText,
      showCopyButton,
      height,
      width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    return other is DartCodeViewerThemeData &&
        baseStyle == other.baseStyle &&
        classStyle == other.classStyle &&
        commentStyle == other.commentStyle &&
        constantStyle == other.constantStyle &&
        keywordStyle == other.keywordStyle &&
        numberStyle == other.numberStyle &&
        punctuationStyle == other.punctuationStyle &&
        stringStyle == other.stringStyle &&
        backgroundColor == other.backgroundColor &&
        copyButtonText == other.copyButtonText &&
        showCopyButton == other.showCopyButton &&
        height == other.height &&
        width == other.width;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'baseStyle',
        baseStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'classStyle',
        classStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'commentStyle',
        commentStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'constantStyle',
        constantStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'keywordStyle',
        keywordStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'numberStyle',
        numberStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'punctuationStyle',
        punctuationStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'stringStyle',
        stringStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle>(
        'stringStyle',
        stringStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Color>(
        'backgroundColor',
        backgroundColor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Text>(
        'copyButtonText',
        copyButtonText,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'showCopyButton',
        showCopyButton,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>(
        'height',
        height,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>(
        'width',
        width,
        defaultValue: null,
      ),
    );
  }
}

/// Applies a DartCodeViewerTheme to [DartCodeViewer].
///
/// The dart code viewer theme describes the color, size, and text styles for the
/// dart code viewer it is attached to.
///
/// Descendant widget obtains the current theme's [DartCodeViewerThemeData]
/// object using [DartCodeViewerTheme.of]. When a widget uses
/// [DartCodeViewerTheme.of], it is automatically rebuilt if the theme later
/// changes.
///
/// See also:
/// * [DartCodeViewer], a code viewer for the dart language.
/// * [DartCodeViewerThemeData], which describes the actual configuration of a
/// dart code viewer theme.
/// * [ThemeData], which describes the overall theme information for the
///    application.
class DartCodeViewerTheme extends InheritedTheme {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const DartCodeViewerTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Specifies the color, size, and text styles for the descendant dart code
  /// viewer widgets.
  final DartCodeViewerThemeData data;

  /// Returns the data from the closest [DartCodeViewerTheme] instances the
  /// encloses the given context.
  ///
  /// The default parameters is set within the [DartCodeViewer].
  ///
  /// {@tool dartpad --template=stateless_widget_scaffold}
  ///
  /// Here is an example of a small string that shows up as Dart code in a flutter
  /// application. With [DartCodeViewerThemeData] applied
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return DartCodeViewerTheme(
  ///     data: DartCodeViewerThemeData(
  ///       backgroundColor: Colors.pink,
  ///       child: DartCodeViewer(r'class DartCodeViewer extends StatelessWidget {}'),
  ///     );
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  /// * [DartCodeViewerThemeData], which describes the actual configuration of a
  /// [DartCodeViewerTheme]
  ///  * [Code viewer online tool](https://romannurik.github.io/SlidesCodeHighlighter/)
  ///  is a useful tool that lets you choose the color for each different style.
  ///  On the left side you put your example code and on the right you can choose
  ///  the colors you want the code viewer to display.
  ///    background => backgroundColor
  ///    plain text => baseStyle
  ///    Punctuation => punctuationStyle
  ///    String, values => stringStyle
  ///    Keywords, tags => keywordStyle
  ///    Comments => commentStyle
  ///    Types => classStyle
  ///    Numbers => numberStyle
  ///    Declarations => constantStyle
  static DartCodeViewerThemeData of(BuildContext context) {
    final dartCodeViewerTheme =
        context.dependOnInheritedWidgetOfExactType<DartCodeViewerTheme>();
    return dartCodeViewerTheme?.data ?? DartCodeViewerThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<DartCodeViewerTheme>();
    return identical(this, ancestorTheme)
        ? child
        : DartCodeViewerTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(DartCodeViewerTheme oldWidget) =>
      data != oldWidget.data;
}

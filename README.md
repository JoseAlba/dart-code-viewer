# google_fonts

The `dart_code_viewer` package for Flutter allows you to easily show and copy dart code in your Flutter application.

## Getting Started

![Dart Code Viewer Example in light and dark Theme Mode.](images/dart_code_viewer.gif)

With the `dart_code_viewer` package, you can show Dart code in a Flutter application. The dart_code_viewer is documented well and uses Flutters pattern with Theming.

The code viewer can be used to display dart code. By default the `DartCodeViewer` gives you a Theme based code view. If you are using a `ThemeMode` that is light than you will get the light option. Note that the default background of the code viewer is based off `ColorScheme.background`.

The code viewer requieres a non-null `data` String as required input.

The `DartCodeViewer` requires one of its ancestors to be a `Material` widget. This is because the code viewer uses the `MediaQuery` widget. Which is typically introduced by the [MaterialApp] or [WidgetsApp] widget at the top of your application widget tree.

To use `dart_code_viewer` first you must add the 'dart_code_viewer' package to your [oubspec dependencies](https://pub.dev/packages/dart_code_viewer#-installing-tab-)

To import `DartCodeViewer`;

```dart
import 'package:dart_code_viewer/dart_code_viewer.dart';
```

To use `DartCodeViewer` with the default DartCodeViewer:

```dart
DartCodeViewer(r'''
void main() {
  runApp(MyApp());
}
'''
),
```

`'''` is a handy dart pattern that lets you read multiple string as once instead. Which is really useful if you want to import your dart code as a String like this.

By simply using the code above you will get the example shown in the GIF.

You can also customize the theming of the `DartCodeViewer` by using its parameters:

```dart
DartCodeViewer(r'''
void main() {
  runApp(MyApp());
}
''',
  backgroundColor: GoogleFonts.robotoMono().copyWith(color: Colors.pink),
),
```

This will change the background color of the CodeViewer to Pink.

You can use this [Code viewer tool](https://romannurik.github.io/SlidesCodeHighlighter/) to choose the color for each different highlighted token style. On the left side you put your example code and on the right you can choose the colors you want the code viewer to display. Below is a table that shows you the difference between the code viewer tool and the dart code viewer parameter.

| Code Viewer Tool | Dart Code Viewer Parameter |
| --- | --- |
| background | backgroundColor |
| plain text | baseStyle |
|  Punctuation | punctuationStyle |
|  String, values | stringStyle |
|  Keywords, tags | keywordStyle |
|  Comments | commentStyle |
|  Types | classStyle |
|  Numbers | numberStyle |

You can use `DartCodeViewer` other constructor `DartCodeViewer.textColor` to change the color properties instead of the TextStyles. You can also set the TextStyle incase you don't want to use the default textStlye `RobotoMono`. Here is an example on how you can use this constructor:

```dart
DartCodeViewer.textColor(r'''
void main() {
  runApp(MyApp());
}
''',
  textStyle: GoogleFonts.lato(),
  commentColor: Colors.grey,
  baseColor: Colors.pink,
),
```

In the case above we are using the text style lato and we are changeing the default colors for comment and base color to grey and pink respectively.

If you are having a hard time figuering out how to choose the Color for this tool. There are a few default DartCodeViewers at your disposal. Here are the code viewers that are well known:

- `DartCodeViewer.light`
- `DartCodeViewer.lightAlt`
- `DartCodeViewer.dark`
- `DartCodeViewer.darkAlt`
- `DartCodeViewer.designDark`
- `DartCodeViewer.io17`
- `DartCodeViewer.io19`
- `DartCodeViewer.flutterInteract2019`

Here is an example on how to use these themed code viewers.

```dart
DartCodeViewer.designDark(r'''
void main() {
  runApp(MyApp());
}
''',
),
```

The DartCodeViewer can also be themed identical to how widgets in the material package get themed. You can theme the code viewer by having an ancestor of `DartCodeViewerTheme`. The dart code viewer theme describes the color, size, and text styles for the dart code viewer it is attached to.

Descendant widget obtains the current theme's `DartCodeViewerThemeData` object using `DartCodeViewerTheme.of`. When a widget uses `DartCodeViewerTheme.of`, it is automatically rebuilt if the theme later changes.

Using the `DartCodeViewerThemeData` returns the data from the closest `DartCodeViewerTheme` instances the encloses the given context. The default parameters is set within the `DartCodeViewer`.

`DartCodeViewerThemeData` holds the color, size, and text styles for a dart code viewer theme. Use this class to configure a [DartCodeViewerThemeData] widget. To obtain the current ambient dart code viewer theme, use [DartCodeViewerTheme.of].

The simplest way to create a DartCodeThemeData is to use the [copyWith] on the one you get from [DartCodeViewerTheme.of], or create an entirely new one with [DartCodeViewerThemeData].

Here is an example below:

```dart
DartCodeViewerTheme(
  data: DartCodeViewerThemeData(
    backgroundColor: Colors.pink,
    copyButtonText: Text('Copiar'),
  ),
  child: DartCodeViewer.textColor(r'''
void main() {
  runApp(MyApp());
}
''',
  textStyle: GoogleFonts.lato(),
  commentColor: Colors.grey,
  baseColor: Colors.pink,
  ),
),
```

You can use this [Code viewer tool](https://romannurik.github.io/SlidesCodeHighlighter/) to help you with Theming. On the left side you put your example code and on the right you can choose the colors you want the code viewer to display. Below is a table that shows you the difference between the code viewer tool and the dart code viewer parameter.

| Code Viewer Tool | Dart Code Viewer Parameter |
| --- | --- |
| background | backgroundColor |
| plain text | baseStyle |
|  Punctuation | punctuationStyle |
|  String, values | stringStyle |
|  Keywords, tags | keywordStyle |
|  Comments | commentStyle |
|  Types | classStyle |
|  Numbers | numberStyle |

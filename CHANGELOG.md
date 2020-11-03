
# [0.0.2] - 2020-11-03

The dart code viewer package has been updated and has been updated to use
not null be default.

The dart code viewer package is using the elevated button because it the 
elevated button is in the new button Universe. This will make it easier to
theme the buttons within the dart code viewer.

Removed dependency for the Google fonts package.

# [0.0.1] - 2020-05-22

The initial release has DartCodeViewer, DartCodeViewerTheme, and DartCodeViewerThemeData.

The code viewer for the dart language. The code viewer can be used to display dart code. By default the [DartCodeViewer] gives you a Theme based code view. If you are using a [ThemeMode] that is light than you will get the light option. Note that the default background of the code viewer is based off [ColorScheme.background].

Supplying a non-null [data] String is required as input.

Requires one of its ancestors to be a [Material] widget.

Requires one of its ancestors to be a [MediaQuery] widget. Typically, these
are introduced by the [MaterialApp] or [WidgetsApp] widget at the top of
your application widget tree.

String is codified and split into tokens. Depending on the token produced the TextSpan will be a different color. This is based of the [flutter gallery](https://gallery.flutter.dev/). You can find code source [here](https://github.com/flutter/gallery/tree/master/lib/codeviewer)

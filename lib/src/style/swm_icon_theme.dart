import 'package:flutter/material.dart';
import 'package:swm_icons/swm_icons.dart';

/// {@template swm_icon_theme}
/// A theme for SWM icons, allowing customization of icon styles.
/// {@endtemplate}
class SWMIconTheme extends InheritedTheme {
  /// {@macro swm_icon_theme}
  const SWMIconTheme({super.key, required super.child, required this.style});

  /// The style to be applied to SWM icons within this theme.
  final SWMIconStyles style;

  @override
  bool updateShouldNotify(covariant SWMIconTheme oldWidget) {
    return style != oldWidget.style;
  }

  /// Returns the style from the closest instance of this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  /// ```dart
  /// final String styleName = SWMIconsTheme.styleOf(context).name;
  /// ```
  static SWMIconStyles styleOf(BuildContext context) {
    final SWMIconStyles? swmIconStyles = maybeStyleOf(context);

    assert(swmIconStyles != null, 'There is no `SWMIconStyles` in context.');

    return swmIconStyles!;
  }

  /// Returns the style from the closest instance of this class that encloses the given context, if any.
  ///
  /// Typical usage is as follows:
  /// ```dart
  /// final String styleName = (SWMIconsTheme.maybeStyleOf(context) ?? SWMIconStyles.outline).name;
  /// ```
  static SWMIconStyles? maybeStyleOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SWMIconTheme>()?.style;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SWMIconTheme(style: style, child: child);
  }
}

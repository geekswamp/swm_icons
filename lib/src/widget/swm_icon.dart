import 'package:flutter/material.dart';
import 'package:swm_icons/swm_icons.dart';

/// {@template swm_icon}
/// A widget that displays a SWM (Software Mansion) icon with customizable properties.
///
/// This widget wraps Flutter's [Icon] widget and provides additional functionality
/// specifically for SWM icons. It supports various customization options including
/// color, size, and style variants.
///
/// Example usage:
/// ```dart
/// SWMIcon(
///   SWMIcons.air,
///   size: 24,
///   color: Colors.blue,
///   style: SWMIconStyles.curved,
/// )
/// ```
///
/// See also:
///  * [SWMIcons], which defines all available SWM icons
///  * [SWMIconStyles], which defines available icon styles (broken, curved, outline)
///  {@endtemplate}
final class SWMIcon extends StatelessWidget {
  /// {@macro swm_icon}
  const SWMIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
    this.style,
    this.semanticLabel,
  });

  /// The SWM icon to display. Must be a value from the [SWMIcons] enum.
  final SWMIcons icon;

  /// The icon's color. If null, defaults to the current [IconTheme]'s color.
  /// If there is no [IconTheme], defaults to [Colors.black].
  final Color? color;

  /// The icon's size in logical pixels. If null, defaults to the current [IconTheme]'s size.
  /// If there is no [IconTheme], defaults to 20.0.
  final double? size;

  /// The visual style variant of the icon.
  /// If null, defaults to the current [SWMIconsTheme]'s style.
  /// If there is no [SWMIconsTheme], defaults to [SWMIconStyles.outline].
  final SWMIconStyles? style;

  /// Semantic label for the icon. This is read out by screen readers and is important for accessibility.
  /// Should be a short, descriptive phrase describing the icon's purpose.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final double size = this.size ?? IconTheme.of(context).size ?? 20;
    final Color color =
        this.color ?? IconTheme.of(context).color ?? Colors.black;
    final String styleName =
        (style ?? SWMIconTheme.maybeStyleOf(context) ?? SWMIconStyles.outline)
            .name;

    return Icon(
      IconData(icon.codePoint, fontFamily: styleName, fontPackage: 'swm_icons'),
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}

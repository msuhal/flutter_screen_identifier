import 'package:flutter/material.dart';
import 'screen_identifier.dart';

class ScreenIdentifierBuilder extends StatelessWidget {
  /// It's a widget that takes a builder function and returns a widget that is built based on the screen
  /// size
  const ScreenIdentifierBuilder({
    Key? key,
    required this.builder,
    this.relative = false,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    ScreenIdentifier screenIdentifier,
  ) builder;

  /// If true, enable adjustment of multiple values based on parent widget size
  final bool relative;

  @override
  Widget build(BuildContext context) {
    // It's getting the screen width.
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
          context,
          ScreenIdentifier.init(
            relative ? constraints.maxWidth : screenWidth,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'screen_identifier.dart';

class ScreenIdentifierBuilder extends StatelessWidget {
  const ScreenIdentifierBuilder({
    super.key,
    required this.builder,
    this.relative = false,
  });

  final Widget Function(
    BuildContext context,
    ScreenIdentifier screenIdentifier,
  ) builder;

  /// If true, enable adjustment of multiple values based on parent widget size
  final bool relative;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
          context,
          ScreenIdentifier.init(relative ? constraints.maxWidth : screenWidth),
        );
      },
    );
  }
}

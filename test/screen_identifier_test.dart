import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_identifier/screen_identifier.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('screen identifier builder smoke test 1',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return Text(
              screenIdentifier.conditions<String>(
                xxxl: 'XXXL',
                xxl: 'XXL',
                xl: 'XL',
                lg: 'LG',
                md: 'MD',
                sm: 'SM',
                xs: 'XS',
              ),
            );
          },
        ),
      ),
    );
  });

  testWidgets('screen identifier builder smoke test 2',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: ScreenIdentifierBuilder(
          relative: true,
          builder: (context, screenIdentifier) {
            return Text(
              screenIdentifier.conditions<String>(
                xxxl: 'XXXL',
                xxl: 'XXL',
                xl: 'XL',
                lg: 'LG',
                md: 'MD',
                sm: 'SM',
                xs: 'XS',
              ),
            );
          },
        ),
      ),
    );
  });

  test('normal', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(1000);

    final value = screenIdentifier.conditions<int>(
      xxxl: 7,
      xxl: 6,
      xl: 5,
      lg: 4,
      md: 3,
      sm: 2,
      xs: 1,
    );
    expect(value, 4);
  });

  test('null check', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(1000);

    expect(
      () {
        final value = screenIdentifier.conditions<int>();
        expect(value, 4);
      },
      throwsAssertionError,
    );
  });

  test('scan down 1', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(1000);

    final value = screenIdentifier.conditions<int>(
      xxxl: 7,
      xxl: 6,
      xl: 5,
      md: 3,
      sm: 2,
      xs: 1,
    );
    expect(value, 3);
  });

  test('scan down 2', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(1000);

    final value = screenIdentifier.conditions<int>(
      xxl: 6,
      xs: 1,
    );
    expect(value, 1);
  });

  test('scan up 1', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(800);

    final value = screenIdentifier.conditions<int>(
      xxxl: 7,
      xxl: 6,
      xl: 5,
    );
    expect(value, 5);
  });

  test('scan up 2', () {
    ScreenIdentifier.instance.setMinimalWidth(
      xxxl: 1800,
      xxl: 1400,
      xl: 1200,
      lg: 992,
      md: 768,
      sm: 576,
    );
    final screenIdentifier = ScreenIdentifier.init(200);

    final value = screenIdentifier.conditions<int>(
      xxxl: 7,
      xl: 5,
      sm: 2,
    );
    expect(value, 2);
  });
}

import 'package:flutter/material.dart';
import 'package:screen_identifier/screen_identifier.dart';

void main() {
  /// [OPTIONAL] This is the custom minimum width set for each screen size.
  ScreenIdentifier.instance.setMinimalWidth(
    xxxl: 1800,
    xxl: 1400,
    xl: 1200,
    lg: 992,
    md: 768,
    sm: 576,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Screen Identifier Example';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const GridView1(),
    );
  }
}

class GridView1 extends StatelessWidget {
  const GridView1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        final crossAxisCount = screenIdentifier.conditions<int>(
          xxxl: 7,
          xxl: 6,
          xl: 5,
          lg: 4,
          md: 3,
          sm: 2,
          xs: 1,
        );
        const paddingPerCard = 8.0;
        const paddingGridView = 8.0;
        final heightCard = screenIdentifier.conditions<int>(
          xxxl: 196,
          xxl: 210,
          sm: 220,
          xs: 230,
        );
        final childAspectRatio = ((screenIdentifier.width / crossAxisCount) -
                paddingGridView -
                (paddingPerCard * crossAxisCount)) /
            heightCard;

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: 24,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(paddingPerCard),
              child: Card(
                color: screenIdentifier.conditions<Color>(
                  xxxl: Colors.brown,
                  xxl: Colors.deepOrange,
                  xl: Colors.deepPurple,
                  lg: Colors.green,
                  md: Colors.teal,
                  sm: Colors.blueGrey,
                  xs: Colors.pink,
                ),
                child: Center(
                  child: Text(
                    screenIdentifier.conditions<String>(
                      xxxl: 'XXXL',
                      xxl: 'XXL',
                      xl: 'XL',
                      lg: 'LG',
                      md: 'MD',
                      sm: 'SM',
                      xs: 'XS',
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

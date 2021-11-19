import 'package:flutter/material.dart';

import 'pixabay_one_screen.dart';
import 'pixabay_two_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expansion Tile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpansionTileApp(),
    );
  }
}

class ExpansionTileApp extends StatelessWidget {
  const ExpansionTileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion tile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return const PixabayOneScreen();
                  }),
                );
              },
              child: const Text("Example One"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return const PixabayTwoScreen();
                  }),
                );
              },
              child: const Text("Example two"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

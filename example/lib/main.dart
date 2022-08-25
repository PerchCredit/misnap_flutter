import 'package:flutter/material.dart';
import 'package:misnap_flutter/components/misnap_random_image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: const [
            MiSnapRandomImageView(
              width: 165.0,
              height: 116.0,
            )
          ],
        ),
      ),
    );
  }
}

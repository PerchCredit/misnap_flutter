import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MiSnapApp());
}

class MiSnapApp extends StatelessWidget {
  const MiSnapApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MiSnapPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MiSnapPage extends StatefulWidget {
  const MiSnapPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MiSnapPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MiSnapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[],
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:misnap_flutter/misnap_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Uint8List resultRandomImage;
  late Uint8List resultCheckBackImage;
  late Uint8List resultIdCardBackImage;
  late Uint8List resultPassportImage;
  late Uint8List resultAnyIdImage;

  @override
  void initState() {
    super.initState();
    resultRandomImage = Uint8List.fromList([]);
    resultCheckBackImage = Uint8List.fromList([]);
    resultIdCardBackImage = Uint8List.fromList([]);
    resultPassportImage = Uint8List.fromList([]);
    resultAnyIdImage = Uint8List.fromList([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            _miSnapCheckBack(150.0, 100.0),
            _miSnapIdCardBack(150.0, 100.0),
            _miSnapPassport(150.0, 100.0),
            _miSnapAnyId(150.0, 100.0),
          ],
        ),
      ),
    );
  }

  Widget _miSnapCheckBack(double width, double height) {
    return SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 245, 245, 245),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(100, 204, 204, 204),
                ),
              ),
              child: resultCheckBackImage.isNotEmpty
                  ? Image.memory(
                      resultCheckBackImage,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    )),
          onTap: () {
            MisnapFlutter().misnapCheckBack().then((value) => {
                  if (value != null && value.isNotEmpty)
                    setState(() {
                      resultCheckBackImage = value;
                    })
                });
          },
        ),
      ),
    );
  }

  Widget _miSnapIdCardBack(double width, double height) {
    return SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 245, 245, 245),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(100, 204, 204, 204),
                ),
              ),
              child: resultIdCardBackImage.isNotEmpty
                  ? Image.memory(
                      resultIdCardBackImage,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    )),
          onTap: () {
            MisnapFlutter().misnapIdCardBack().then((value) => {
                  if (value != null && value.isNotEmpty)
                    setState(() {
                      resultIdCardBackImage = value;
                    })
                });
          },
        ),
      ),
    );
  }

  Widget _miSnapPassport(double width, double height) {
    return SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 245, 245, 245),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(100, 204, 204, 204),
                ),
              ),
              child: resultPassportImage.isNotEmpty
                  ? Image.memory(
                      resultPassportImage,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    )),
          onTap: () {
            MisnapFlutter().misnapPassport().then((value) => {
                  if (value != null && value.isNotEmpty)
                    setState(() {
                      resultPassportImage = value;
                    })
                });
          },
        ),
      ),
    );
  }

  Widget _miSnapAnyId(double width, double height) {
    return SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 245, 245, 245),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(100, 204, 204, 204),
                ),
              ),
              child: resultAnyIdImage.isNotEmpty
                  ? Image.memory(
                      resultAnyIdImage,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    )),
          onTap: () {
            MisnapFlutter().misnapAnyId().then((value) => {
                  if (value != null && value.isNotEmpty)
                    setState(() {
                      resultAnyIdImage = value;
                    })
                });
          },
        ),
      ),
    );
  }
}

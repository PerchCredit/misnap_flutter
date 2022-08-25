import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:misnap_flutter/misnap_flutter.dart';

class MiSnapRandomImageView extends StatefulWidget {
  const MiSnapRandomImageView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<MiSnapRandomImageView> createState() => _RandomImageViewState();
}

class _RandomImageViewState extends State<MiSnapRandomImageView> {
  Uint8List resultData = Uint8List.fromList([]);

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android) {
      throw UnsupportedError("Unsupported platform view");
    }
    return _randomImageView(defaultTargetPlatform == TargetPlatform.android);
  }

  Widget _randomImageView(bool isAndroid) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
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
              child: resultData.isNotEmpty
                  ? Image.memory(
                      resultData,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    )),
          onTap: () {
            MisnapFlutter().loadRandomImage().then((value) => {
                  setState(() {
                    resultData = value!;
                  })
                });
          },
        ),
      ),
    );
  }
}

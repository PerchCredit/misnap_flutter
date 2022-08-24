import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:misnap_flutter/misnap_flutter.dart';

class MiSnapCheckBackView extends StatefulWidget {
  const MiSnapCheckBackView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<MiSnapCheckBackView> createState() => _CheckBackViewState();
}

class _CheckBackViewState extends State<MiSnapCheckBackView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android) {
      throw UnsupportedError("Unsupported platform view");
    }
    return _photoCheckBackView(defaultTargetPlatform == TargetPlatform.android);
  }

  Widget _photoCheckBackView(bool isAndroid) {
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
              child: Container()),
          onTap: () {
            MisnapFlutter()
                .misnapCheckBack()
                .then((value) => {print('object')});
          },
        ),
      ),
    );
  }
}

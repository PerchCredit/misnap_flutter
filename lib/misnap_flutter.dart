import 'dart:typed_data';

import 'misnap_flutter_platform_interface.dart';

class MisnapFlutter {
  Future<Uint8List?> loadRandomImage() async {
    return MisnapFlutterPlatform.instance.loadRandomImage();
  }

  Future<Uint8List?> misnapCheckBack() async {
    return MisnapFlutterPlatform.instance.misnapCheckBack();
  }

  Future<Uint8List?> misnapCheckFront() async {
    return MisnapFlutterPlatform.instance.misnapCheckFront();
  }

  Future<Uint8List?> misnapIdCardBack() async {
    return MisnapFlutterPlatform.instance.misnapIdCardBack();
  }

  Future<Uint8List?> misnapIdCardFront() async {
    return MisnapFlutterPlatform.instance.misnapIdCardFront();
  }
}

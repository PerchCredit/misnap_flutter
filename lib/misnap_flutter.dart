import 'dart:typed_data';

import 'misnap_flutter_platform_interface.dart';

export 'package:misnap_flutter/components/misnap_check_back_view.dart';
export 'package:misnap_flutter/components/misnap_check_front_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_back_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_front_view.dart';

class MisnapFlutter {
  Future<String?> getPlatformVersion() {
    return MisnapFlutterPlatform.instance.getPlatformVersion();
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

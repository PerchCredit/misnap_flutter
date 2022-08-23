import 'dart:io';

import 'misnap_flutter_platform_interface.dart';

export 'package:misnap_flutter/components/misnap_check_back_view.dart';
export 'package:misnap_flutter/components/misnap_check_front_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_back_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_front_view.dart';

class MisnapFlutter {
  Future<String?> getPlatformVersion() {
    return MisnapFlutterPlatform.instance.getPlatformVersion();
  }

  Future<File?> misnapCheckBack() async {
    return MisnapFlutterPlatform.instance.misnapCheckBack();
  }

  Future<File?> misnapCheckFront() async {
    return MisnapFlutterPlatform.instance.misnapCheckFront();
  }

  Future<File?> misnapIdCardBack() async {
    return MisnapFlutterPlatform.instance.misnapIdCardBack();
  }

  Future<File?> misnapIdCardFront() async {
    return MisnapFlutterPlatform.instance.misnapIdCardFront();
  }
}

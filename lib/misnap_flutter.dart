import 'misnap_flutter_platform_interface.dart';

export 'package:misnap_flutter/components/misnap_check_back_view.dart';
export 'package:misnap_flutter/components/misnap_check_front_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_back_view.dart';
export 'package:misnap_flutter/components/misnap_id_card_front_view.dart';

class MisnapFlutter {
  Future<String?> getPlatformVersion() {
    return MisnapFlutterPlatform.instance.getPlatformVersion();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'misnap_flutter_platform_interface.dart';

/// An implementation of [MisnapFlutterPlatform] that uses method channels.
class MethodChannelMisnapFlutter extends MisnapFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('misnap_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

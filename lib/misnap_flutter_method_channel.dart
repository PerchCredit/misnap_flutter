import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:misnap_flutter/misnap_config.dart';

import 'misnap_flutter_platform_interface.dart';

/// An implementation of [MisnapFlutterPlatform] that uses method channels.
class MethodChannelMisnapFlutter extends MisnapFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(MiSnapPluginConfig.pluginChannel);

  @override
  Future<Uint8List?> loadRandomImage() async {
    final image = await methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.randomImage);
    return image;
  }

  @override
  Future<Uint8List?> misnapCheckBack() async {
    final image = await methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.checkBack);
    return image;
  }

  @override
  Future<Uint8List?> misnapCheckFront() async {
    final image = await methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.checkFront);
    return image;
  }

  @override
  Future<Uint8List?> misnapIdCardBack() async {
    final image = await methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.idCardBack);
    return image;
  }

  @override
  Future<Uint8List?> misnapIdCardFront() async {
    final image = await methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.idCardFront);
    return image;
  }
}

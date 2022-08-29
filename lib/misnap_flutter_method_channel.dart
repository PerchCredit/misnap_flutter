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
    return methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.randomImage);
  }

  @override
  Future<Uint8List?> misnapCheckBack() async {
    return methodChannel.invokeMethod<Uint8List>(MiSnapPluginConfig.checkBack);
  }

  @override
  Future<Uint8List?> misnapCheckFront() async {
    return methodChannel.invokeMethod<Uint8List>(MiSnapPluginConfig.checkFront);
  }

  @override
  Future<Uint8List?> misnapIdCardBack() async {
    return methodChannel.invokeMethod<Uint8List>(MiSnapPluginConfig.idCardBack);
  }

  @override
  Future<Uint8List?> misnapIdCardFront() async {
    return methodChannel
        .invokeMethod<Uint8List>(MiSnapPluginConfig.idCardFront);
  }

  @override
  Future<Uint8List?> misnapPassport() async {
    return methodChannel.invokeMethod<Uint8List>(MiSnapPluginConfig.passport);
  }

  @override
  Future<Uint8List?> misnapAnyId() async {
    return methodChannel.invokeMethod<Uint8List>(MiSnapPluginConfig.anyId);
  }
}

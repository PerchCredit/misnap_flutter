import 'dart:io';
import 'dart:typed_data';

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
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Uint8List?> misnapCheckBack() async {
    final image = await methodChannel.invokeMethod<Uint8List>('check-back');
    return image;
  }

  @override
  Future<Uint8List?> misnapCheckFront() async {
    final image = await methodChannel.invokeMethod<Uint8List>('check-front');
    return image;
  }

  @override
  Future<Uint8List?> misnapIdCardBack() async {
    final image = await methodChannel.invokeMethod<Uint8List>('id-card-back');
    return image;
  }

  @override
  Future<Uint8List?> misnapIdCardFront() async {
    final image = await methodChannel.invokeMethod<Uint8List>('id-card-front');
    return image;
  }
}

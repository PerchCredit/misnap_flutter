import 'dart:io';

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
  Future<File?> misnapCheckBack() async {
    final image = await methodChannel.invokeMethod<File>('check-back');
    return image;
  }

  @override
  Future<File?> misnapCheckFront() async {
    final image = await methodChannel.invokeMethod<File>('check-front');
    return image;
  }

  @override
  Future<File?> misnapIdCardBack() async {
    final image = await methodChannel.invokeMethod<File>('id-card-back');
    return image;
  }

  @override
  Future<File?> misnapIdCardFront() async {
    final image = await methodChannel.invokeMethod<File>('id-card-front');
    return image;
  }
}

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:misnap_flutter/misnap_flutter_method_channel.dart';
import 'package:misnap_flutter/misnap_flutter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMisnapFlutterPlatform
    with MockPlatformInterfaceMixin
    implements MisnapFlutterPlatform {
  @override
  Future<Uint8List?> loadRandomImage() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapCheckBack() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapCheckFront() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapIdCardBack() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapIdCardFront() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapAnyId() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> misnapPassport() {
    throw UnimplementedError();
  }
}

void main() {
  final MisnapFlutterPlatform initialPlatform = MisnapFlutterPlatform.instance;

  test('$MethodChannelMisnapFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMisnapFlutter>());
  });
}

import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'misnap_flutter_method_channel.dart';

abstract class MisnapFlutterPlatform extends PlatformInterface {
  /// Constructs a MisnapFlutterPlatform.
  MisnapFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static MisnapFlutterPlatform _instance = MethodChannelMisnapFlutter();

  /// The default instance of [MisnapFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelMisnapFlutter].
  static MisnapFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MisnapFlutterPlatform] when
  /// they register themselves.
  static set instance(MisnapFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Uint8List?> misnapCheckBack() {
    throw UnimplementedError('misnapCheckBack() has not been implemented.');
  }

  Future<Uint8List?> misnapCheckFront() {
    throw UnimplementedError('misnapCheckFront() has not been implemented.');
  }

  Future<Uint8List?> misnapIdCardBack() {
    throw UnimplementedError('misnapIdCardBack() has not been implemented.');
  }

  Future<Uint8List?> misnapIdCardFront() {
    throw UnimplementedError('misnapIdCardFront() has not been implemented.');
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:misnap_flutter/misnap_flutter.dart';
import 'package:misnap_flutter/misnap_flutter_platform_interface.dart';
import 'package:misnap_flutter/misnap_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMisnapFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements MisnapFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MisnapFlutterPlatform initialPlatform = MisnapFlutterPlatform.instance;

  test('$MethodChannelMisnapFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMisnapFlutter>());
  });

  test('getPlatformVersion', () async {
    MisnapFlutter misnapFlutterPlugin = MisnapFlutter();
    MockMisnapFlutterPlatform fakePlatform = MockMisnapFlutterPlatform();
    MisnapFlutterPlatform.instance = fakePlatform;
  
    expect(await misnapFlutterPlugin.getPlatformVersion(), '42');
  });
}

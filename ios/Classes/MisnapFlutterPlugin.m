#import "MisnapFlutterPlugin.h"
#if __has_include(<misnap_flutter/misnap_flutter-Swift.h>)
#import <misnap_flutter/misnap_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "misnap_flutter-Swift.h"
#endif

@implementation MisnapFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMisnapFlutterPlugin registerWithRegistrar:registrar];
}
@end

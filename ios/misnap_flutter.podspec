#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint misnap_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'misnap_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A MiSnap Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'MiSnapSDK/**/*.h'
  s.dependency 'Flutter'

  # s.dependency 'MiSnap'
  # s.dependency 'MiSnapUX'

  s.platform = :ios, '9.0'

  s.preserve_paths = 'MiSnapSDK.xcframework', 'MiSnapSDKCamera.xcframework', 'MiSnapSDKMibiData.xcframework', 'MiSnapSDKScience.xcframework', 'MobileFlow.xcframework', 'MiSnapUX/UX2_Files'
  s.resources = ['MiSnapSDK/MiSnapUX/UXResources/*']
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework MiSnapSDK -framework MiSnapSDKCamera -framework MiSnapSDKMibiData -framework MiSnapSDKScience -framework MobileFlow' }
  s.vendored_frameworks = 'MySDK.framework', 'MySDK2.framework'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end

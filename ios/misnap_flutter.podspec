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
  s.source_files = 'Classes/**/*', 'MiSnapSDK/MiSnapUX/UX_Files/**/*.*'
  s.public_header_files = 'MiSnapSDK/MiSnapUX/UX_Files/**/*.h'
  s.resources = ['MiSnapSDK/MiSnapUX/UXResources/*']
  s.dependency 'Flutter'
#  s.dependency 'MiSnap'
#  s.dependency 'MiSnapUX'

  s.platform = :ios, '13.0'

s.vendored_frameworks = 'MiSnapSDK/MiSnapSDK.xcframework', 'MiSnapSDK/MiSnapSDKCamera.xcframework', 'MiSnapSDK/MiSnapSDKMibiData.xcframework', 'MiSnapSDK/MiSnapSDKScience.xcframework', 'MiSnapSDK/MobileFlow.xcframework'
s.xcconfig = { 'OTHER_LDFLAGS' => '-framework MiSnapSDK -framework MiSnapSDKCamera -framework MiSnapSDKMibiData -framework MiSnapSDKScience -framework MobileFlow ' }


  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.5'
end

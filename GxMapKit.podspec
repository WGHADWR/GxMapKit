#
# Be sure to run `pod lib lint GxMapKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GxMapKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of GxMapKit.'
	s.swift_version = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wghadwr@gmail.com/GxMapKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wghadwr@gmail.com' => 'wghadwr@gmail.com' }
  s.source           = { :git => 'https://github.com/wghadwr/GxMapKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GxMapKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GxMapKit' => ['GxMapKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
	
	s.subspec 'BaiduMapKit' do |ss|
		# ss.source_files = 'GxMapKit/Library/BaiduMap_IOSSDK_Lib/*.framework/Headers/**.h'
		# ss.public_header_files = 'GxMapKit/Library/BaiduMap_IOSSDK_Lib/*.framework/Headers/**.h'
		
		ss.frameworks   =  'CoreLocation', 'QuartzCore', 'OpenGLES', 'SystemConfiguration', 'CoreGraphics', 'Security', 'CoreTelephony'
		ss.libraries    = 'sqlite3.0', 'stdc++'
		
		ss.vendored_frameworks =  'GxMapKit/Library/BaiduMap_IOSSDK_Lib/*.framework'
		ss.vendored_libraries = 'GxMapKit/Library/BaiduMap_IOSSDK_Lib/thirdlibs/*.a'
		
		ss.preserve_paths = 'GxMapKit/Library/BaiduMap_IOSSDK_Lib/*.framework', 'GxMapKit/Library/BaiduMap_IOSSDK_Lib/thirdlibs/*.a'
		ss.pod_target_xcconfig = { 'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GxMapKit/Library/BaiduMap_IOSSDK_Lib/' }
	end
end

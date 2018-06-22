source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'

use_frameworks!
inhibit_all_warnings!

target 'instadog' do
  pod 'SkyFloatingLabelTextField', '~> 3.0'
  pod 'Alamofire', '~> 4.7'
  pod 'ObjectMapper', '~> 3.2'
  pod 'KeychainAccess', '~> 3.0'
  pod 'Kingfisher', '~> 4.0'

  target 'instadogTests' do
    inherit! :complete
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.1'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end

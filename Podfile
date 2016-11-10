platform :ios, '9.3'
use_frameworks!
xcodeproj 'DiagnosticsApp/DiagnosticsApp.xcodeproj'
pod 'RealmSwift'
pod 'Signals', '~> 4.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

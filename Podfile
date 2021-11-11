# Uncomment this line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!

target 'InterAACtionPad' do
    pod "GCDWebServer", "~> 3.0"
end

workspace 'InterAACtionPad'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end

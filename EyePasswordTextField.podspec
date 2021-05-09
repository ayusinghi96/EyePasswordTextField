Pod::Spec.new do |s|
  s.name             = 'EyePasswordTextField'
  s.version          = '0.1.0'

  s.summary          = 'A custom password field SDK for iOS, completely written in Swift'
  s.homepage         = 'https://github.com/ayusinghi96/EyePasswordTextField'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ayush Singhi' => 'ayusinghi96@gmail.com' }
  s.source           = { :git => 'https://github.com/ayusinghi96/EyePasswordTextField.git', :tag => s.version.to_s }

  s.platforms        = { :ios => '11.0' }
  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'EyePasswordTextField/Classes'

  s.frameworks = 'UIKit'
end

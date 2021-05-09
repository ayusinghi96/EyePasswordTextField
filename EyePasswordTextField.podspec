Pod::Spec.new do |s|
  s.name             = 'EyePasswordTextField'
  s.version          = '0.1.0'
  s.summary          = 'A short description of EyePasswordTextField.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ayusinghi96/EyePasswordTextField'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ayush Singhi' => 'ayusinghi96@gmail.com' }
  s.source           = { :git => 'https://github.com/ayusinghi96/EyePasswordTextField.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'EyePasswordTextField/Classes'
  s.resources = 'EyePasswordTextField/*.xcassets'

  s.frameworks = 'UIKit'
end

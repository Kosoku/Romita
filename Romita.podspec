Pod::Spec.new do |s|
  s.name             = 'Romita'
  s.version          = '1.1.0'
  s.summary          = 'Romita is a Swift iOS/macOS/tvOS/watchOS framework that extends the AppKit, UIKit, and WatchKit frameworks.'

  s.description      = <<-DESC
*Romita* is a Swift iOS/macOS/tvOS/watchOS framework that extends the `AppKit`, `UIKit`, and `WatchKit` frameworks. It includes a number of macros, functions, categories and classes that make repetitive tasks easier.
                       DESC

  s.homepage         = 'https://github.com/Kosoku/Romita'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  s.author           = { 'William Towe' => 'willbur1984@gmail.com' }
  s.source           = { :git => 'https://github.com/Kosoku/Romita.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '5.0'
  
  s.requires_arc = true

  s.source_files = 'Romita/**/*.{h,m,swift}'

  s.swift_versions = ['5']

  s.dependency 'Feige'

  s.ios.frameworks = ['Foundation', 'UIKit']
  s.osx.frameworks = ['Foundation', 'AppKit']
  s.tvos.frameworks = ['Foundation', 'UIKit']
  s.watchos.frameworks = ['Foundation', 'WatchKit']
end

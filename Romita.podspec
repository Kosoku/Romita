Pod::Spec.new do |s|
  s.name             = 'Feige'
  s.version          = '1.3.0'
  s.summary          = 'Feige is a Swift iOS/macOS/tvOS/watchOS framework that extends the Foundation framework.'

  s.description      = <<-DESC
Feige is an iOS/macOS/tvOS/watchOS framework that extends the `Foundation` framework. It includes a number of macros, functions, categories and classes that make repetitive tasks easier.
                       DESC

  s.homepage         = 'https://github.com/Kosoku/Feige'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  s.author           = { 'William Towe' => 'willbur1984@gmail.com' }
  s.source           = { :git => 'https://github.com/Kosoku/Feige.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '5.0'
  
  s.requires_arc = true

  s.source_files = 'Feige/**/*.{h,m,swift}'

  s.swift_versions = ['5']

  s.frameworks = 'Foundation'
end

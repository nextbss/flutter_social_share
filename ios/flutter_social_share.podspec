#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_social_share'
  s.version          = '0.0.1'
  s.summary          = 'A plugin that allows content to be shared to social networks.'
  s.description      = <<-DESC
A plugin that allows content to be shared to social networks.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'FacebookCore', '0.6.0'
  s.dependency 'FacebookShare', '0.6.1'

  s.ios.deployment_target = '8.0'
end


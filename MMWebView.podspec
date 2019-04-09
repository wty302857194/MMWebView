
Pod::Spec.new do |s|
  s.name             = "MMWebView"
  s.version          = "1.2"
  s.summary          = "A web load progress control used on iOS."
  s.homepage         = "https://github.com/ChellyLau/MMWebView"
  s.license          = 'MIT'
  s.author           = { "Chelly Lau" => "1625977078@qq.com" }
  s.source           = { :git => "https://github.com/ChellyLau/MMWebView.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = 'MMWebView/**/*.{h,m}'
  s.frameworks       = 'WebKit'
  s.ios.frameworks   = 'UIKit', 'WebKit'

end

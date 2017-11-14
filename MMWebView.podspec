
Pod::Spec.new do |s|
  s.name             = "MMWebView"
  s.version          = "1.1"
  s.summary          = "A web load progress control used on iOS."
  s.homepage         = "https://github.com/CheeryLau/MMWebView"
  s.license          = 'MIT'
  s.author           = { "Cheery Lau" => "1625977078@qq.com" }
  s.source           = { :git => "https://github.com/CheeryLau/MMWebView.git", :tag => s.version.to_s }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'MMWebView/**/*.{h,m}'
  s.frameworks       = 'Foundation', 'UIKit', 'WebKit'

end

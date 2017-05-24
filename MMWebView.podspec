
Pod::Spec.new do |s|
  s.name             = "MMWebView"
  s.version          = "1.0"
  s.summary          = "A web load progress control used on iOS."
  s.homepage         = "https://github.com/dexianyinjiu/MMWebView"
  s.license          = 'MIT'
  s.author           = { "得闲饮酒" => "1625977078@qq.com" }
  s.source           = { :git => "https://github.com/dexianyinjiu/MMWebView.git", :tag => s.version.to_s }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'MMWebView/**/*.{h,m}'
  s.frameworks       = 'Foundation', 'UIKit', 'WebKit'

end

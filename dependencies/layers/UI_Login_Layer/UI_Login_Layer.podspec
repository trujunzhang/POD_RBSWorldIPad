
Pod::Spec.new do |s|
  s.name     = 'UI_Login_Layer'
  s.version  = '0.1.0'
  s.license  = 'MIT'
  s.summary  = 'UI_Login_Layer aims to be a drop-in replacement for UITabBarController.' 
  s.description = 'UI_Login_Layer aims to be a drop-in replacement of UITabBarController with the intention of letting developers easily customise its appearance. JBTabBar uses .'
  s.homepage = 'http://www.github.com/wanghaogithub720'
  s.author   = { 'Jin Budelmann' => 'jin@bitcrank.com' }
  s.source   = { :git => 'https://github.com/wanghaogithub720/mxYoutube.git', :tag => '0.1.0' }
  s.platform = :ios

  s.resources = "Pod/Assets/*/*.*"
  s.requires_arc = true

  s.subspec 'LoginViewController' do |sub|
    sub.source_files = 'Pod/Classes/LoginViewController/*.{h,m}'
  end

  s.subspec 'LoginView' do |sub|
    sub.source_files = 'Pod/Classes/LoginView/*.{h,m}'
  end

end


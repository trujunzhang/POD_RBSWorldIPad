Pod::Spec.new do |s|
  s.name         = "UI_VideoTable_Layer"
  s.version      = "0.0.2"
  s.summary      = "Painlessly and natively play YouTube, Vimeo, and .MP4, .MOV, .MPV, .3GP videos and fetch thumbnails on your iOS devices"
  s.homepage     = "https://github.com/YasKuraishi/UI_VideoTable_Layer"
  s.license      = 'MIT'
  s.author       = { "Yas Kuraishi" => "kuraishi@gmail.com" }
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '6.0'

  s.requires_arc = true

  s.subspec 'VideoList' do |sub|
    sub.source_files = 'Pod/Classes/VideoList/*.{h,m}'
  end

  s.subspec 'AsCollectionCellNode' do |sub|
    sub.source_files = 'Pod/Classes/AsCollectionCellNode/*.{h,m}'
  end

  s.subspec 'AsRowCellNode' do |sub|
    sub.source_files = 'Pod/Classes/AsRowCellNode/*.{h,m}'
  end

  s.subspec 'CollectionView-Effect' do |sub|
    sub.source_files = 'Pod/Classes/CollectionView-Effect/*.{h,m}'
  end

end


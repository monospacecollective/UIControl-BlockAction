Pod::Spec.new do |s|
  s.name         = 'UIControl-BlockAction'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.platform     = :ios, '5.0'

  s.summary      = 'UIControl-BlockAction allows for block actions to be set on UIControls'
  s.homepage     = 'https://github.com/monospacecollective/UIControl-BlockAction'
  s.author       = { 'Eric Horacek' => 'eric@monospacecollective.com' }
  s.source       = { :git => 'https://github.com/monospacecollective/UIControl-BlockAction.git', :tag => s.version.to_s }

  s.source_files = 'UIControl-BlockAction/*.{h,m}'
  
  s.requires_arc = true
end

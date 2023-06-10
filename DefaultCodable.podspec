Pod::Spec.new do |s|

  s.name          = "DefaultCodable"
  s.version       = "1.0.0"
  s.summary       = "DefaultCodable"
  s.homepage      = "https://github.com/moliya/DefaultCodable"
  s.license       = "MIT"
  s.author        = {'Carefree' => '946715806@qq.com'}
  s.source        = { :git => "https://github.com/moliya/DefaultCodable.git", :tag => s.version}
  s.requires_arc  = true
  s.platform      = :ios, '10.0'

  s.source_files = 'Sources/DefaultCodable/*.swift'

end

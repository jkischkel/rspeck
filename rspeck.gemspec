require 'date'

Gem::Specification.new do |s|
  s.name        = 'rspeck'
  s.summary     = 'simple rspec running'
  s.description = 'rspec + ack = <3'
    
  s.version     = '0.1.3'
  s.date        =  Date.today.to_s

  s.authors     = ["Jan Kischkel"]
  s.email       = 'jk@soundcloud.com'
  s.homepage    = 'https://github.com/jkischkel/rspeck'

  s.files       = Dir.glob("{bin,lib}/**/*")
  s.executables = ['rspeck']
end

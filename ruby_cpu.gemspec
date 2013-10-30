Gem::Specification.new do |s|
  s.name        = 'ruby_cpu'
  s.version     = '0.0.1'
  s.date        = '2013-10-30'
  s.summary     = "RubyCPU"
  s.description = "A gem which exposes the OpenCPU interface to ruby"
  s.authors     = ["Frank Blaauw"]
  s.email       = 'frank.blaauw@gmail.com'
  s.files       = 'lib/**/*'
	s.require_path = 'lib'
	s.test_files  = Dir.glob("spec/**/*.rb")
  s.homepage    = 'http://frbl.eu'
  s.license     = 'none'
	s.add_development_dependency 'rspec', '~> 2.14'
	s.add_development_dependency 'rake', '>= 0.9'
end
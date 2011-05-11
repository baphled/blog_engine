# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "blog_engine"
  s.summary = "Insert BlogEngine summary."
  s.description = "Insert BlogEngine description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  
  s.add_dependency('mongoid')
  s.add_dependency('bson_ext')
  s.add_dependency('devise')
  s.add_dependency('redcarpet')
end
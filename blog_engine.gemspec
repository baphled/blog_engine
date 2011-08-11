# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "blog_engine"
  s.summary = "A Rails Engine based blogging system"
  s.description = "Adding a blog to your application shouldn't be a hassle"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  
  s.add_dependency('mongoid')
  s.add_dependency('mongoid_taggable')
  s.add_dependency('mongoid_slug')
  s.add_dependency('simple_form')
  s.add_dependency('bson_ext')
  s.add_dependency('devise')
  s.add_dependency('redcarpet')
end
# encoding: utf-8
Gem::Specification.new do |s|
  s.name = "active-list"
  File.open("VERSION", "rb") do |f|
    s.version = f.read
  end
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.author = "Brice Texier"
  s.email  = "burisu@oneiros.fr"
  s.summary = "Easy tables in Rails app"
  s.description = "Generates action methods to"+
    " provide clean tables."
  s.extra_rdoc_files = [ "LICENSE", "README" ]
  s.test_files = `git ls-files test/test_*.rb`.split("\n") 
  exclusions = [ "#{s.name}.gemspec", ".travis.yml", ".gitignore", "Gemfile", "Gemfile.lock", "Rakefile", "lib/assets/images/active-list.svg"]
  s.files = `git ls-files`.split("\n").delete_if{|f| exclusions.include?(f)}
  s.homepage = "http://github.com/burisu/active-list"
  s.license = "MIT"
  s.require_path = "lib"
  add_runtime_dependency = (s.respond_to?(:add_runtime_dependency) ? :add_runtime_dependency : :add_dependency)
  s.send(add_runtime_dependency, "rails", [">= 3.1"])
  s.send(add_runtime_dependency, "compass-rails", [">= 1"])
  s.send(add_runtime_dependency, "fastercsv", [">= 1.5"])
  s.send(add_runtime_dependency, "i18n-complements", [">= 0"])
  s.add_development_dependency("sqlite3", [">= 0"])
end


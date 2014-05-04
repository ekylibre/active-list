# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = "active-list"
  s.version = "6.0.0"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.author = "Brice Texier"
  s.email  = "burisu@oneiros.fr"
  s.summary = "Dummy transitional package for active_list"
  s.homepage = "http://github.com/burisu/active-list"
  s.license = "MIT"

  s.files = `git ls-files LICENSE README.rdoc`.split("\n")

  s.add_dependency "active_list", ">= 6.0.0"
end


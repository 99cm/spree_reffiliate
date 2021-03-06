# encoding: UTF-8

require_relative './lib/spree_reffiliate/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_reffiliate'
  s.version     = SpreeReffiliate.version
  s.author      = 'Alejandro AR'
  s.email       = 'abarcadabra@gmail.com'
  s.summary     = 'Spree Affiliate and Referrals extension'
  s.description = 'Configurable affiliates and referrals features for Spree'
  s.homepage    = 'https://github.com/vinsol-spree-contrib/spree_reffiliate'
  s.license     = 'New-BSD'

  s.required_ruby_version = '>= 2.2.0'

  s.files        = `git ls-files`.split($/)
  s.test_files   = s.files.grep(%r{^spec/})
  s.require_path = 'lib'

  spree_version = '>= 3.2.0', '< 4.0.0'

  s.add_dependency 'spree_core', spree_version

end

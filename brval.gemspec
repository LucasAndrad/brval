lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brval/version'

Gem::Specification.new do |spec|
  spec.name          = 'brval'
  spec.version       = Brval::VERSION
  spec.authors       = ['Lucas Andrade']
  spec.email         = ['lucasandrad@yandex.com']

  spec.summary       = 'Gem to validates many Brazilian codes'
  spec.description   = 'Gem to validates Brazilian codes, like CPF, CNPJ, CNH, PIS ...'
  spec.homepage      = 'https://github.com/LucasAndrad/brval'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'TODO: Set to 'http://mygemserver.com''

  #   spec.metadata['homepage_uri'] = spec.homepage
  #   spec.metadata['source_code_uri'] = 'TODO: Put your gem's public repo URL here.'
  #   spec.metadata['changelog_uri'] = 'TODO: Put your gem's CHANGELOG.md URL here.'
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*', 'README.md']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17', '>= 1.17.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8', '>= 3.8.0'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'rubycritic', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.62.0'
  spec.add_development_dependency 'json', '~> 2.1'
  spec.add_dependency 'httparty', '~> 0.21.0'

end

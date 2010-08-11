# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{worldart}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pavel Musolin"]
  s.date = %q{2010-08-11}
  s.description = %q{Access the public information on World-Art.ru}
  s.email = %q{pavel@harizma.lv}
  s.extra_rdoc_files = ["README", "lib/worldart.rb", "lib/worldart/movie.rb", "lib/worldart/search.rb"]
  s.files = ["Manifest", "README", "Rakefile", "VERSION", "lib/worldart.rb", "lib/worldart/movie.rb", "lib/worldart/search.rb", "spec/fixtures/24154", "spec/fixtures/search_nacnalo", "spec/spec.opts", "spec/spec_helper.rb", "spec/worldart/movie_spec.rb", "spec/worldart/search_spec.rb", "spec/worldart/worldart_spec.rb", "worldart.gemspec"]
  s.homepage = %q{http://github.com/pmisters/WorldArt}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Worldart", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{worldart}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Access the public information on World-Art.ru}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.1"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.8.1"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.8.1"])
  end
end

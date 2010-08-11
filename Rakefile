require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require "echoe"

namespace :fixtures do
  desc 'Refresh spec fixtures with fresh data from World-Art.ru'
  task :refresh do
    require File.expand_path(File.join(File.dirname(__FILE__), 'spec', 'spec_helper'))
    
    REMOTE_SAMPLES.each do |url, response|
      output = File.expand_path File.join(File.dirname(__FILE__), 'spec', 'fixtures', response)
      `wget --output-document="#{output}" --verbose --save-headers "#{url}"`
    end
  end
end

Spec::Rake::SpecTask.new(:spec) do |s|
  s.spec_opts = ['--options', 'spec/spec.opts']
  s.spec_files = FileList['spec/**/*_spec.rb']
end

Echoe.new('wordart', File.read('VERSION').strip) do |g|
  g.author = 'Pavel Musolin'
  g.email = 'pavel@harizma.lv'
  g.description = 'Access the public information on World-Art.ru'
  g.files = FileList["{lib,spec}/**/*.rb"].to_a
  g.url = 'http://github.com/pmisters/WorldArt'
  g.has_rdoc = false
  g.platform = Gem::Platform::RUBY
  g.dependencies = ["hpricot >=0.8.1"]
end

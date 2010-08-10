require 'rubygems'
require 'rake'

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

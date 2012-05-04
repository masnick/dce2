require 'sprockets'
require 'sprockets-sass'
require 'coffee_script'
require 'sass'

ROOT = File.dirname(__FILE__)

# Compile SCSS
sprockets = Sprockets::Environment.new
sprockets.append_path(File.join(ROOT, 'stylesheets'))

guard 'sprockets2', :sprockets => sprockets, :assets_path => File.join(ROOT, 'assets'), :precompile => [ %r{stylesheets\.css} ], :digest => false, :gz => false, :clean => false do
  watch(%r{^stylesheets/.+$})
end

# Compile JS
sprockets = Sprockets::Environment.new
sprockets.append_path(File.join(ROOT, 'javascripts'))

guard 'sprockets2', :sprockets => sprockets, :assets_path => File.join(ROOT, 'assets'), :precompile => [ %r{javascripts\.js} ], :digest => false, :gz => false, :clean => false do
  watch(%r{^javascripts/.+$})
end
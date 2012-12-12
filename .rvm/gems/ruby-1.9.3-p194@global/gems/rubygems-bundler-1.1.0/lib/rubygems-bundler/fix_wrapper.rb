msg = "\n\nOlder rubygems-bundler found, please uninstall it with:\n\n    "

here = Regexp.new(__FILE__)
error_source = caller.to_a.reject{|s| s=~ here }.find{|s| s=~/\/rubygems-bundler-/ }.first
gem_source = File.expand_path("../../../..", error_source)
gem_version = error_source.sub(/^.*\/rubygems-bundler-([^\/]+)\/.*$/,'\1')

if ENV['GEM_HOME'] or ENV['GEM_PATH']
  msg << "GEM_HOME=\"#{gem_source}\" " unless ENV['GEM_HOME'] == gem_source
end

msg << "gem uninstall -ax rubygems-bundler -v #{gem_version}\n\n"

raise msg

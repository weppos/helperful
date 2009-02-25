require 'rubygems'
require 'rake'
require 'echoe'

$:.unshift(File.dirname(__FILE__) + "/lib")
require 'helperful'


PKG_NAME    = ENV['PKG_NAME']    || Helperful::GEM
PKG_VERSION = ENV['PKG_VERSION'] || Helperful::VERSION
PKG_SUMMARY = "A collection of useful Rails helpers."
PKG_FILES   = FileList.new("{lib,rails,tasks,test}/**/*") do |files|
  files.include %w(*.{rdoc,rb})
  files.include %w(Rakefile)
end
RUBYFORGE_PROJECT = nil

if ENV['SNAPSHOT'].to_i == 1
  PKG_VERSION << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end
 
 
Echoe.new(PKG_NAME, PKG_VERSION) do |p|
  p.author        = "Simone Carletti"
  p.email         = "weppos@weppos.net"
  p.summary       = PKG_SUMMARY
  p.description   = <<-EOD
    Helperful aims to be a collection of useful and reusable Rails helpers.
  EOD
  p.url           = "http://code.simonecarletti.com/helperful"
  p.project       = RUBYFORGE_PROJECT

  p.need_zip      = true
  p.rcov_options  = ["--main README.rdoc -x Rakefile -x mocha -x rcov"]
  p.rdoc_pattern  = /^(lib|CHANGELOG.rdoc|README.rdoc|LICENSE.rdoc)/

  p.development_dependencies += ["rake  >=0.8",
                                 "echoe >=3.1",
                                 "mocha >=0.9"]
end


begin
  require 'code_statistics'
  desc "Show library's code statistics"
  task :stats do
    CodeStatistics.new(["Helperful", "lib"],
                       ["Tests", "test"]).to_s
  end
rescue LoadError
  puts "CodeStatistics (Rails) is not available"
end

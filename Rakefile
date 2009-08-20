$:.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'rake'
require 'echoe'
require 'helperful'


PKG_NAME    = ENV['PKG_NAME']    || Helperful::GEM
PKG_VERSION = ENV['PKG_VERSION'] || Helperful::VERSION
RUBYFORGE_PROJECT = nil

if ENV['SNAPSHOT'].to_i == 1
  PKG_VERSION << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end
 
 
Echoe.new(PKG_NAME, PKG_VERSION) do |p|
  p.author        = "Simone Carletti"
  p.email         = "weppos@weppos.net"
  p.summary       = "A collection of useful Rails helpers."
  p.url           = "http://code.simonecarletti.com/helperful"
  p.project       = RUBYFORGE_PROJECT
  p.description   = <<-EOD
    Helperful aims to be a collection of useful and reusable Rails helpers.
  EOD

  p.need_zip      = true

  p.development_dependencies += ["rake  ~>0.8",
                                 "echoe ~>3.1",
                                 "mocha ~>0.9.7"]

  p.rcov_options  = ["-Itest -x mocha,rcov,Rakefile"]
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

#
# = Helperful
#
# A collection of useful Rails helpers.
#
#
# Category::    Rails
# Package::     Helperful
# Author::      Simone Carletti <weppos@weppos.net>
# Copyright::   2007-2008 The Authors
# License::     MIT License
#
#--
#
#++


Dir.glob(File.dirname(__FILE__) + '/helperful/*_helper.rb').each { |helper| require helper }
require 'helperful/deprecations'


module Helperful
end
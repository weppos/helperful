#
# = Helperful
#
# A collection of useful Rails helpers.
#
#
# Category::    Rails
# Package::     Helperful
# Author::      Simone Carletti <weppos@weppos.net>
# Copyright::   2008-2009 The Authors
# License::     MIT License
#
#--
#
#++


module Helperful

  module Version
    MAJOR = 0
    MINOR = 5
    TINY  = 2

    STRING = [MAJOR, MINOR, TINY].join('.')
  end

  VERSION         = Version::STRING
  STATUS          = 'alpha'
  BUILD           = nil

end

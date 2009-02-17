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


unless defined?(TitleHelper)
  module TitleHelper
    def self.included(base)
      ActiveSupport::Deprecation.warn("TitleHelper is deprecated and will be removed in a future version. " +
                                      "Please include Helperful::TitleHelper instead.", caller)
      base.send :include, Helperful::TitleHelper
    end
  end
end
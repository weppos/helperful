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

  module ControllerMixin

    def helperful(*args, &block)
      args.flatten.each do |arg|
        case arg
          when String, Symbol
            file_name = 'helperful/' + arg.to_s.underscore
            helper(file_name)
          else
            helper(arg, &block)
        end
      end
    end

  end

end
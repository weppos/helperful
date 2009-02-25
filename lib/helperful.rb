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


Dir.glob(File.dirname(__FILE__) + '/helperful/*_helper.rb').each { |helper| require helper }
require 'helperful/deprecations'
require 'helperful/version'


module Helperful
  
  NAME            = 'Helperful'
  GEM             = 'helperful'
  AUTHORS         = ['Simone Carletti <weppos@weppos.net>']
  
  
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
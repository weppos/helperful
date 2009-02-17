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


require 'test/unit'
require 'rubygems'
require 'active_support'
require 'action_controller'
require 'action_controller/cgi_ext'
require 'action_controller/test_process'
require 'action_view/test_case'

$:.unshift File.dirname(__FILE__) + '/../lib'

RAILS_ROOT = '.'    unless defined? RAILS_ROOT
RAILS_ENV  = 'test' unless defined? RAILS_ENV

ActionController::Base.logger = nil
ActionController::Routing::Routes.reload rescue nil

# Unit tests for Helpers are based on unit tests created and developed by Rails core team.
# See action_pack/test/abstract_unit for more details.

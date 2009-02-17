require 'test_helper'

class HelperfulController < ActionController::Base
end

%w(First Second Third).each do |name|
  class_eval <<-RUBY
    module Helperful::#{name}Helper
    end
  RUBY
end


class HelperfulTest < Test::Unit::TestCase
  
  def setup
    @controller = HelperfulController
  end
  
  def test_helperful_should_delegate_module
    @controller.expects(:helper).with(Helperful::FirstHelper)
    @controller.helperful(Helperful::FirstHelper)
  end
  
  def test_helperful_should_delegate_modules
    @controller.expects(:helper).with(Helperful::FirstHelper)
    @controller.expects(:helper).with(Helperful::SecondHelper)
    @controller.helperful(Helperful::FirstHelper, Helperful::SecondHelper)
  end
  
  def test_helperful_should_prepend_namespace_and_delegate_string_symbol
    @controller.expects(:helper).with('helperful/first')
    @controller.helperful('first')

    @controller.expects(:helper).with('helperful/first')
    @controller.helperful(:first)
  end
  
  def test_helperful_should_prepend_namespace_and_delegate_strings_symbols
    @controller.expects(:helper).with('helperful/first')
    @controller.helperful('first')

    @controller.expects(:helper).with('helperful/first')
    @controller.helperful(:first)

    @controller.expects(:helper).with('helperful/first')
    @controller.expects(:helper).with('helperful/second')
    @controller.helperful('first', 'second')

    @controller.expects(:helper).with('helperful/first')
    @controller.expects(:helper).with('helperful/second')
    @controller.helperful(:first, :second)
  end
  
end

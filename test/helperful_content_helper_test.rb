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


require 'test_helper'
require 'helperful_content_helper'


class ContentController < ActionController::Base
  def self.controller_name; "content"; end
  def self.controller_path; "content"; end
  
  helper HelperfulContentHelper
  
  def sidebar
    render :layout => "content"
  end
  
  def sidebar_concatenate
    render :layout => "content"
  end
  
  def rescue_action(e) raise end
end

ContentController.view_paths = [ File.dirname(__FILE__) + "/fixtures/" ]


class CaptureTest < Test::Unit::TestCase
  
  def setup
    @controller = ContentController.new
    @controller.logger = Logger.new(nil)
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @request.host = "test.host"
  end

  def test_sidebar
    get :sidebar
    assert_equal expected_content_for_output, @response.body
  end

  def test_sidebar_concatenate
    get :sidebar_concatenate
    assert_equal expected_content_for_output, @response.body
  end

  protected
  
    def expected_content_for_output
<<-EOS
<title>This is the title</title>
<div id="first">
  <p>First Sidebar</p>
</div>
<div id="second">
  <p>Second Sidebar</p>
</div>
EOS
    end
    
end

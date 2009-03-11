require 'test_helper'

class ContentController < ActionController::Base
  def self.controller_name; "content"; end
  def self.controller_path; "content"; end
  
  helperful "content"
  
  def sidebar
    render :layout => "sidebar"
  end
  
  def sidebar_concatenate
    render :layout => "sidebar"
  end
  
  def has_content
    render :layout => "has_content"
  end

  def has_content_is_called_alone
    render :layout => false
  end

  def rescue_action(e) raise end
end

ContentController.view_paths = [ File.dirname(__FILE__) + "/fixtures/" ]


class ContentTest < ActiveSupport::TestCase
  
  def setup
    @controller = ContentController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @request.host = "test.host"
  end

  def test_sidebar
    get :sidebar
    assert_equal expected_sidebar_content_for_output, @response.body
  end

  def test_sidebar_concatenate
    get :sidebar_concatenate
    assert_equal expected_sidebar_content_for_output, @response.body
  end

  def test_has_content
    get :has_content
    assert_equal %Q{
`one' has content: this is :one for :one\n
`two' has content: this is 'two' for 'two'\n
\n
`four' has content: this is 'four' for :four\n
`five' has content: this is 'five' for :five\n}, @response.body
  end

  def test_has_content_is_called_alone
    get :has_content_is_called_alone
    assert_response :success
    assert_equal('bar', @response.body)
  end

  protected
  
    def expected_sidebar_content_for_output
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

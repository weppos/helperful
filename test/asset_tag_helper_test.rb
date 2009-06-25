require 'test_helper'

class AssetTagHelperTest < ActionView::TestCase
  tests Helperful::AssetTagHelper

  def setup
    ActionController::Base.perform_caching = false
    ActionController::Base.asset_host = nil
    ENV.delete('RAILS_ASSET_ID')
  end


  JavascriptToTag = {
    %(javascript) => %(javascript_include_tag),
    %(javascript(["foo", "bar"])) => %(javascript_include_tag(["foo", "bar"])),
    %(javascript("foo", "bar")) => %(javascript_include_tag("foo", "bar")),
    %(javascript("foo", "bar", :cache => true)) => %(javascript_include_tag("foo", "bar", :cache => true)),
  }

  test "javascript" do
    JavascriptToTag.each do |method, content|
      expects(:content_for).with(:head, eval(content))
      eval(method)
    end
  end


  StylesheetToTag = {
    %(stylesheet) => %(stylesheet_link_tag),
    %(stylesheet(["foo", "bar"])) => %(stylesheet_link_tag(["foo", "bar"])),
    %(stylesheet("foo", "bar")) => %(stylesheet_link_tag("foo", "bar")),
    %(stylesheet("foo", "bar", :cache => true)) => %(stylesheet_link_tag("foo", "bar", :cache => true)),
  }

  test "stylesheet" do
    StylesheetToTag.each do |method, content|
      expects(:content_for).with(:head, eval(content))
      eval(method)
    end
  end

end

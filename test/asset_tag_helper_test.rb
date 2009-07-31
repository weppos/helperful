require 'test_helper'

class AssetTagHelperTest < ActionView::TestCase
  tests Helperful::AssetTagHelper

  def setup
    ActionController::Base.perform_caching = false
    ActionController::Base.asset_host = nil
    ENV.delete('RAILS_ASSET_ID')
    
    @controller = Class.new do
      attr_accessor :request
      def url_for(*args)
        case arg = args.first
        when String
          arg
        when Hash
          "http://www.example.com?#{arg.to_param}"
        else
          "http://www.example.com"
        end
      end
    end.new
    
    @request = Class.new do
      def protocol() 'http://' end
      def ssl?() false end
      def host_with_port() 'localhost' end
    end.new
    
    @controller.request = @request
  end
  
  
  CanonicalToTag = {
    %(canonical_link_tag) => %(<link href="http://www.example.com?only_path=false" rel="canonical" />),
    %(canonical_link_tag(:action => "show")) => %(<link href="http://www.example.com?action=show&amp;only_path=false" rel="canonical" />),
    %(canonical_link_tag("http://localhost/show")) => %(<link href="http://localhost/show" rel="canonical" />),
  }
  
  test "canonical_link_tag" do
    CanonicalToTag.each do |method, tag|
      assert_dom_equal(tag, eval(method))
    end
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

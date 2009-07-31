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

  #
  # = Asset Tag Helper
  #
  # Provides a set of helpers for generating HTML that links views to assets such
  # as images, javascripts, stylesheets, and feeds.
  #
  # ==== Requirements
  #
  # The following requirements are mandatory for this module.
  # Including this helper will automatically include them unless already included.
  #
  # * ActionView::Helpers::AssetTagHelper
  #
  module AssetTagHelper

    def self.included(base)
      base.class_eval do
        base.included_modules.include?(ActionView::Helpers::AssetTagHelper) || include(ActionView::Helpers::AssetTagHelper)
      end
    end
    
    # Returns a link tag that search engine crawlers may use to determine
    # the preferred version of a page with multiple URLs.
    #
    # More details about the canonical link tag are available
    # at the following sources:
    # * http://www.mattcutts.com/blog/canonical-link-tag/
    # * http://googlewebmastercentral.blogspot.com/2009/02/specify-your-canonical.html
    #
    # Control the link options in url_for format using the +url_options+.
    #
    # ==== Examples
    # 
    #   canonical_link_tag
    #   # => <link rel="canonical" href=http://www.currenthost.com/controller/action" />
    #   canonical_link_tag(:action => "show")
    #   # => <link rel="canonical" href=http://www.currenthost.com/controller/show" />
    #   canonical_link_tag("http://www.example.com/product.php?item=swedish-fish")
    #   # => <link rel="canonical" href="http://www.example.com/product.php?item=swedish-fish" />
    #
    def canonical_link_tag(url_options = {})
      tag(
        "link",
        "rel"   => "canonical",
        "href"  => url_options.is_a?(Hash) ? url_for(url_options.merge(:only_path => false)) : url_options
      )
    end

    # Converts given +files+ in javascript include statements
    # and appends them in the head section of the page.
    # 
    # ==== Examples
    # 
    #   # in your index.html.erb view
    #   <% javascript :foo, :bar, :cache => "foobar" %>
    # 
    #   # this is equivalent to
    #   <% content_for :head, javascript_include_tag(:foo, :bar, :cache => "foobar") %>
    # 
    #   # in your application
    #   <% yield :head %>
    # 
    def javascript(*files)
      content_for(:head, javascript_include_tag(*files))
    end

    # Converts given +files+ in stylesheet link statements
    # and appends them in the head section of the page.
    # 
    # ==== Examples
    # 
    #   # in your index.html.erb view
    #   <% stylesheet :foo, :bar, :cache => "foobar" %>
    # 
    #   # this is equivalent to
    #   <% content_for :head, stylesheet_link_tag(:foo, :bar, :cache => "foobar") %>
    # 
    #   # in your application
    #   <% yield :head %>
    # 
    def stylesheet(*files)
      content_for(:head, stylesheet_link_tag(*files))
    end

  end
end
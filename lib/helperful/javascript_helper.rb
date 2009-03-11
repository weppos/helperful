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
  # = Javascript Helper
  # 
  # Provides a set of helpers for working with JavaScript in your views.
  # 
  # ==== Requires
  # 
  # The following requirements are mandatory for this module.
  # Including this helper will automatically include them unless already included.
  # 
  # * ActionView::Helpers::CaptureHelper
  # * ActionView::Helpers::JavaScriptHelper
  #
  module JavascriptHelper
    
    def self.included(base)
      base.class_eval do
#        base.included_modules.include?(ActionView::Helpers::CaptureHelper) || include(ActionView::Helpers::CaptureHelper)
#        base.included_modules.include?(ActionView::Helpers::JavaScriptHelper) || include(ActionView::Helpers::JavaScriptHelper)
      end
    end

    #
    # Mixes the features of <tt>content_for</tt> and <tt>javascript_tag</tt> into a single helper.
    #
    # Supports all original method options and features, including the ability to use write the content
    # in a block and javascript tag options.
    #
    # ==== Examples
    #
    #   <% javascript_content_for :head do %>
    #     $("#id").hide();
    #   <% end %>
    #
    # The block is passed as it is to <tt>javascript_tag</tt>,
    # then the result is stored as <tt>content_for</tt> :head.
    # Now you can call <tt>yield</tt> and output your javascript content.
    #
    #   <%= yield :head %>
    #
    #   <script>$("#id").hide();</script>
    #
    # This example is equal to the following statements.
    #
    #   <% javascript_content_for :head do; javascript_tag do %>
    #     $("#id").hide();
    #   <% end; end %>
    #
    #   <% javascript_content_for :head do %>
    #     <script>$("#id").hide();</script>
    #   <% end %>
    #
    # You can make subsequent calls to <tt>javascript_content_for</tt> and <tt>content_for</tt>,
    # the result for each call will be appended to the value currently stored for <tt>name</tt>. 
    #
    def javascript_content_for(name, content_or_options_with_block = nil, html_options = {}, &block)
      if block_given?
        content_for(name, javascript_tag(content_or_options_with_block, &block))
      else
        content_for(name, javascript_tag(content_or_options_with_block, html_options))
      end
    end  
  
  end
end
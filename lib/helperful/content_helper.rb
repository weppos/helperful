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


module Helperful
  
  # 
  # = Content Helper
  # 
  # Provides a set of helpers for capturing and working with your page content
  # in a more effective way.
  # 
  # ==== Requires
  # 
  # The following requirements are mandatory for this module.
  # Including this helper will automatically include them unless already included.
  # 
  # * ActionView::Helpers::CaptureHelper
  #
  module ContentHelper
    
    def self.included(base)
      base.class_eval do
        base.included_modules.include?(ActionView::Helpers::CaptureHelper) || include(ActionView::Helpers::CaptureHelper)
        alias_method_chain :content_for, :has
      end
    end
    
    # 
    # Evaluates the content of <tt>block</tt> and stores the result as <tt>content_for :sidebar</tt>.
    # 
    # Because <tt>content_for</tt> concatenates the block, you can call <tt>sidebar</tt> multiple time
    # and yield all the final content once.
    # 
    # See <tt>ActionView::Helpers::CaptureHelper#content_for</tt> for the full API documentation.
    # 
    # ==== Examples
    # 
    #   <% sidebar do %>
    #     <p>Sidebar</p>
    #   <% end %>
    #   
    #   <%= yield :sidebar %>
    #   # => <p>Sidebar</p>
    # 
    def sidebar(&block)
      content_for :sidebar, &block
    end
    
    #
    # Returns <tt>true</tt> if <tt>name</tt> has any content,
    # in other workds if content_for(name) has ever been called.
    # 
    # ==== Important
    # 
    # Some important details to keep in mind.
    # 
    # Due to the way <tt>content_for</tt> stores data, it doesn't matter
    # whether name is a Symbol or a String.
    # They are treated in the same way. The following calls are equivalent.
    # 
    #   has_content? :foo   # => true
    #   has_content? "foo"  # => true
    # 
    # This method doesn't make any difference between an empty, 
    # blank or nil content. It always returns <tt>true</tt> if
    # <tt>content_for</tt> has been called with <tt>name</tt>,
    # it doesn't matter which content is stored.
    # A call to <tt>has_content?</tt> will always return true
    # in any of the following cases:
    # 
    #   content_for :name, nil
    #   content_for :name, ''
    #   content_for :name, []
    #   content_for :name, 'A real content'
    #   content_for :name do
    #     "nothing here"
    #   end
    #
    def has_content?(name)
      @has_content.key?(name.to_s)
    end
    
    # Flags +name+ to ensure <tt>has_content?</tt> will work as expected.
    # You would probably never call this method directly.
    # In fact, you are encouraged to not do so.
    def has_content!(name) # :nodoc:
      @has_content ||= {}
      @has_content[name.to_s] = true
    end
    
    #
    # Despite its name, this method is a transparent replacement for
    # the original <tt>content_for</tt> Rails helper.
    # 
    # It forwards any request to the original Rails helper,
    # but before it keep tracks of every request to ensure <tt>has_content?</tt>
    # will work as expected.
    # 
    # == Behind this original name
    # 
    # For those of you interested in, this name arises from the need 
    # to chain it with <tt>alias_method_chain</tt>, following
    # Rails best practice for extending original core methods.
    #
    def content_for_with_has(*args, &block) # :nodoc:
      has_content!(args.first)
      content_for_without_has(*args, &block)
    end
  
  end
end
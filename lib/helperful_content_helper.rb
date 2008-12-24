module HelperfulContentHelper
  
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
  
end
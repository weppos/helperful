require 'test_helper'

class JavascriptHelperTest < ActionView::TestCase
  tests Helperful::JavascriptHelper

  attr_accessor :output_buffer

  def setup
    @content_for_name = nil
  end

  def test_javascript_content_for
    javascript_content_for(:name, "alert('hello')")

    assert_dom_equal "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end

  def test_javascript_content_for_with_block_in_erb
    __in_erb_template = ''
    javascript_content_for(:name) { concat "alert('hello')" }
    
    assert_dom_equal "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end

  def test_javascript_content_for_with_block_out_of_erb
    javascript_content_for(:name) { "alert('hello')" }
    
    assert_dom_equal "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end

  def test_javascript_content_for_with_options
    javascript_content_for(:name, "alert('hello')", :id => "the_js_tag")

    assert_dom_equal "<script id=\"the_js_tag\" type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end

  def test_javascript_content_for_with_options_and_block_in_erb
    __in_erb_template = ''
    javascript_content_for(:name, :id => "the_js_tag") { concat "alert('hello')" }

    assert_dom_equal "<script id=\"the_js_tag\" type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end

  def test_javascript_content_for_with_options_and_block_out_of_erb
    javascript_content_for(:name, :id => "the_js_tag") { "alert('hello')" }
    
    assert_dom_equal "<script id=\"the_js_tag\" type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>",
      @content_for_name
  end
  
  def test_javascript_content_for_with_subsequent_calls
    javascript_content_for(:name, "alert('hello')")
    javascript_content_for(:name, "alert('world')")

    expected  = "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>"
    expected += "<script type=\"text/javascript\">\n//<![CDATA[\nalert('world')\n//]]>\n</script>"

    assert_dom_equal expected,
      @content_for_name
  end

  def test_javascript_content_for_with_subsequent_calls_and_block_in_erb
    __in_erb_template = ''

    javascript_content_for(:name) { concat "alert('hello')" }
    javascript_content_for(:name) { concat "alert('world')" }

    expected  = "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>"
    expected += "<script type=\"text/javascript\">\n//<![CDATA[\nalert('world')\n//]]>\n</script>"

    assert_dom_equal expected,
      @content_for_name
  end

  def test_javascript_content_for_with_subsequent_calls_and_block_out_of_erb
    javascript_content_for(:name) { "alert('hello')" }
    javascript_content_for(:name) { "alert('world')" }

    expected  = "<script type=\"text/javascript\">\n//<![CDATA[\nalert('hello')\n//]]>\n</script>"
    expected += "<script type=\"text/javascript\">\n//<![CDATA[\nalert('world')\n//]]>\n</script>"

    assert_dom_equal expected,
      @content_for_name
  end

end

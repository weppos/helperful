require 'test_helper'
require 'helperful_title_helper'

class TitleHelperTest < Test::Unit::TestCase
  include HelperfulTitleHelper

  def setup
    reset!
  end

  def test_title_should_accepts_zero_or_more_params
    assert_nothing_raised { title }
    assert_nothing_raised { title('One') }
    assert_nothing_raised { title('One', 'Two', 'Three') }
  end

  def test_title_should_return_content
    assert_equal('', title)
    assert_equal('One', title('One'))
  end

  def test_title_should_return_empty_string_if_empty
    assert_equal('', title)
  end

  def test_title_should_store_content
    assert_equal('', title)
    assert_equal('One', title('One'))
    assert_equal('One', title)
  end

  def test_title_should_join_content
    assert_equal('', title)
    assert_equal('One', title('One'))
    assert_equal('One - Two', title('Two'))
    assert_equal('One - Two - Three - Four', title('Three', 'Four'))
  end

  def test_title_should_join_content_with_separator
    assert_equal('One - Two', title('One', 'Two'))
    assert_equal('One | Two', title(:separator => ' | '))
    assert_equal('One x Two x Three', title('Three', :separator => ' x '))
  end

  def test_title_should_append_headline_to_content
    assert_equal('One - Two', title('One', 'Two'))
    assert_equal('One - Two - Cool!', title(:headline => 'Cool!'))
    assert_equal('One - Two - Three - Yeah!', title('Three', :headline => 'Yeah!'))
  end

  def test_title_should_append_site_to_content
    assert_equal('One - Two', title('One', 'Two'))
    assert_equal('One - Two - Cool!', title(:site => 'Cool!'))
    assert_equal('One - Two - Three - Yeah!', title('Three', :site => 'Yeah!'))
  end

  def test_title_should_append_site_then_headline
    assert_equal('One - Two', title('One', 'Two'))
    assert_equal('One - Two - Cool!', title(:site => 'Cool!'))
    assert_equal('One - Two - Cool! - Yeah!', title(:headline => 'Yeah!'))
  end


  protected

    def reset!
      title(nil)
    end

end
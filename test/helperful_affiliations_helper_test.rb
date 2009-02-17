require 'test_helper'
require 'helperful_affiliations_helper'

class HelperfulAffiliationsHelperTest < ActionView::TestCase
  include HelperfulAffiliationsHelper
  
  def test_tradedoubler_verification_tag
    assert_equal('<!-- TradeDoubler site verification 112233 -->', tradedoubler_verification_tag('112233'))
    assert_equal('<!-- TradeDoubler site verification 112233 -->', tradedoubler_verification_tag(112233))
    assert_equal('<!-- TradeDoubler site verification  -->', tradedoubler_verification_tag(nil))
  end
  
end

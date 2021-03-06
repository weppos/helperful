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
  # = Affiliations Helper
  # 
  # Provides a set of helpers for working with online affiliations.
  #
  module AffiliationsHelper
  
    # 
    # Returns the tradedoubler site verification tag for +publisher_id+.
    # 
    #   tradedoubler_verification_tag('123456')
    #   # => "<! -- TradeDoubler site verification 123456 -->"
    #   
    #   tradedoubler_verification_tag(123456)
    #   # => "<! -- TradeDoubler site verification 123456 -->"
    #   
    #   tradedoubler_verification_tag(nil)
    #   # => "<! -- TradeDoubler site verification  -->"
    #
    def tradedoubler_verification_tag(publisher_id)
      "<!-- TradeDoubler site verification #{publisher_id.to_s} -->"
    end
  
  end
end
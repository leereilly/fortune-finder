require 'helper'

class TestFortuneFinder < Test::Unit::TestCase
  should "get a response for a domain name" do
    record = FortuneFinder::lookup('att.com')
    assert_equal 11, record.rank
    assert_equal 'AT&T', record.name
  end

  should "know when a domain is an alias" do
    record = FortuneFinder::lookup('ebay.com')
    assert_equal true, record.alias
    assert_equal 'ebayinc.com', record.domain
  end
end

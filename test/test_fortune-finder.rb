require 'helper'

class TestFortuneFinder < Test::Unit::TestCase
  should "get a response for a domain name" do
    record = FortuneFinder::lookup('att.com')
    assert_equal 11, record.rank
    assert_equal 'AT&T', record.name
  end
end

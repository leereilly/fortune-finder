require 'helper'

class TestFortuneFinder < Test::Unit::TestCase
  should "get a response for a domain name" do
    assert_equal Fortune::lookup('att.com'), {:rank => 11, :name => 'AT&T'}
  end
end

require 'helper'

class TestFortuneFinderRecord < Test::Unit::TestCase
  def setup
    @record = FortuneFinder.lookup "att.com"
  end

  should "know that it exists" do
    assert @record.exists?
  end

  should "know the name" do
    assert_equal "AT&T", @record.name
  end

  should "know the rank" do
    assert_equal 12, @record.rank
  end

  should "know the domain" do
    assert_equal "att.com", @record.domain
  end

  should "know if it's an alias" do
    refute @record.alias?
  end
end

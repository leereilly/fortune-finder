require 'helper'

class TestFortuneFinder < Test::Unit::TestCase

  def cleanup
    file = File.expand_path "symlink.com.toml", FortuneFinder.domains_path
    FileUtils.rm file if File.exists? file
  end

  should "know the domains path" do
    expected = File.expand_path "../lib/data/2015", File.dirname(__FILE__)
    assert_equal expected, FortuneFinder.domains_path
  end

  should "lookup a domain via the class method" do
    record = FortuneFinder.lookup 'att.com'
    assert_equal 12, record.rank
    assert_equal 'AT&T', record.name
  end

  should "know if a domain is valid via the class method" do
    assert FortuneFinder.valid? 'att.com'
    assert FortuneFinder.ranked? 'att.com'
  end

  should "know if a domain exists via the instance method" do
    finder = FortuneFinder.new('att.com')
    assert finder.ranked?
    assert finder.valid?
  end

  should "lookup a record via the class method" do
    finder = FortuneFinder.new('att.com')
    record = finder.lookup
    assert_equal 12, record.rank
    assert_equal 'AT&T', record.name
  end

  should "get a response for a domain name" do
    record = FortuneFinder::lookup('att.com')
    assert_equal 12, record.rank
    assert_equal 'AT&T', record.name
  end

  should "know when a domain is an alias" do
    to = File.expand_path "symlink.com.toml", FortuneFinder.domains_path
    from = File.expand_path "walmart.com.toml", FortuneFinder.domains_path
    FileUtils.ln_s(from, to) unless File.exists? to

    record = FortuneFinder::lookup('symlink.com')
    assert_equal true, record.alias?
    assert_equal 'walmart.com', record.domain
  end

  should "return all records" do
    record = FortuneFinder.all.first
    assert_equal 1, record.rank
    assert_equal 'Walmart', record.name
  end

  should "know if a domain is fortune 50" do
    assert FortuneFinder.new("walmart.com").fortune50?
  end

  should "know if a domain is fortune 100" do
    assert FortuneFinder.new("aa.com").fortune100?

  end

  should "know if a domain is fortune 500" do
    assert FortuneFinder.new("capitalone.com").fortune500?
  end

  should "not blow up on invalid domains" do
    refute FortuneFinder.valid?("foo.invalid")
    refute FortuneFinder.valid?("some phrase")
    refute FortuneFinder.lookup("1234nonsense")
  end
end

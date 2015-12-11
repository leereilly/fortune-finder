require 'public_suffix'
require 'toml'
require 'naughty_or_nice'
require_relative 'fortune-finder/record'

class FortuneFinder
  include NaughtyOrNice

  YEAR = 2015

  class << self

    alias_method :ranked?, :valid?

    def domains_path
      @domains_path ||= File.expand_path "./data/#{YEAR}", File.dirname(__FILE__)
    end

    def lookup(domain)
      FortuneFinder.new(domain).lookup
    end

    def all
      @all ||= Dir["#{domains_path}/*.toml"].map { |d| lookup File.basename(d, ".toml") }.sort_by { |d| d.rank }
    end
  end

  def valid?
    record.exists?
  end
  alias_method :ranked?, :valid?
  alias_method :fortune1000?, :valid?

  def fortune100?
    ranked? && record.rank <= 100
  end

  def fortune500?
    ranked? && record.rank <= 500
  end

  # Look up a domain name to see if it's the Fortune 2000 list.
  #
  # Returns a hash with the ranking and company name if one is found e.g.
  #   #=> {:rank => 1, :name => 'GitHub'}
  # returns nil if nothing is found.
  def record
    @record ||= FortuneFinder::Record.new(domain)
  end
  alias_method :lookup, :record
end

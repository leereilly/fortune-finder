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
  end

  def valid?
    record.exists?
  end

  # Look up a domain name to see if it's the Fortune 2000 list.
  #
  # Returns a hash with the ranking and company name if one is found e.g.
  #   #=> {:rank => 1, :name => 'GitHub'}
  # returns nil if nothing is found.
  def lookup
    FortuneFinder::Record.new(domain)
  end
  alias_method :record, :lookup
end

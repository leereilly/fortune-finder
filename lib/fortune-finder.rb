require 'public_suffix'
require 'toml'
require 'fortune-finder/record'

module Fortune
  class << self
    # Look up a domain name to see if it's the Fortune 2000 list.
    #
    # Returns a hash with the ranking and company name if one is found e.g.
    #   #=> {:rank => 1, :name => 'GitHub'}
    # returns nil if nothing is found.
    def lookup(domain)
      return if domain.nil? or domain.index('.') < 1 or !ranked?(domain)
      domain = cleanse_domain domain
      record = FortuneFinder::Record.new(domain)
    end

     # Returns true if a file is found matching the domain; false otherwise.
    def ranked?(domain)
      domain = cleanse_domain(domain)
      File.exists?(File.expand_path(__FILE__+"/../data/2012/#{domain}.toml"))
    end

    # Clean the domain of things like 'http(s)://', 'www',
    # '?foo=bar', etc.
    #
    # Return the domain string.
    def cleanse_domain(domain)
      domain.downcase!
      domain = domain.sub(/^https?\:\/\//, '').sub(/^www./,'')
      domain = domain.split("/").first
      domain = domain.split("@").last

      domain = PublicSuffix.parse(domain)
      domain = "#{domain.sld}.#{domain.tld}"
      domain
    end
  end
end

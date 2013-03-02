require 'public_suffix'

class Fortune
  # Look up a domain name to see if it's the Fortune 2000 list.
  #
  # Returns a hash with the ranking and company name if one is found e.g.
  #   #=> {:rank => 1, :name => 'GitHub'}
  # returns nil if nothing is found.
  def self.lookup(query)
    return if query.nil? or query.index('.') < 1

    query = cleanse_query query
    data  = extract_data query
  end

  # Verify if a domain name is ranked in the Fortune 2000.
  #
  # Returns true if a file is found matching the domain; false otherwise.
  def self.ranked?(url)
    File.exists?(File.expand_path("../../lib/data/2012/#{url}", __FILE__))
  end

  # Grab the rank and company name from the domain file.
  #
  # Returns a hash with the ranking and company name e.g.
  # {:rank => 1, :name => 'GitHub'}
  # or nil if nothing's found.
  def self.extract_data(url)
    f = File.open(File.expand_path("../../lib/data/2012/#{url}", __FILE__))
    c = f.readlines
    data = Hash.new
    data[:rank] = c[1].to_i
    data[:name] = c[0].to_s.strip
    return data
  end

  # Clean the input query of things like 'http(s)://', 'www',
  # '?foo=bar', etc.
  #
  # Return the query string.
  def self.cleanse_query(query)
    query.downcase!
    query = query.sub(/^https?\:\/\//, '').sub(/^www./,'')
    query = query.split("/").first
    query = query.split("@").last

    domain = PublicSuffix.parse(query)
    query = "#{domain.sld}.#{domain.tld}"
    query
  end
end

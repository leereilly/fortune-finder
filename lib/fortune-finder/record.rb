module FortuneFinder
  class Record
    attr_accessor :domain
    attr_accessor :name
    attr_accessor :rank
    attr_accessor :alias

    def initialize(domain)
      begin
        toml_record = TOML.load_file(File.expand_path(__FILE__+"/../../data/2012/#{domain}.toml"))
        @name       = toml_record["name"]
        @rank       = toml_record["rank"]
        @domain     = toml_record["domain"]

        if File.symlink?(File.expand_path(__FILE__+"/../../data/2012/#{domain}.toml"))
          @alias = true
        else
          @alias = false
        end
      rescue Error => e
        puts e.inspect
      end
    end
  end
end
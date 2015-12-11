class FortuneFinder
  class Record
    attr_accessor :domain

    def initialize(domain)
      @domain = domain
    end

    def exists?
      @exits ||= File.exists? file_path
    end

    def name
      @name ||= toml["name"] if exists?
    end

    def rank
      @rank ||= toml["rank"] if exists?
    end

    def file_path
      @file_path ||= File.expand_path "#{domain}.toml", FortuneFinder.domains_path
    end

    def alias?
      @alias ||= File.symlink? file_path
    end
    alias_method :alias, :alias?

    private

    def toml
       @toml ||= TOML.load_file file_path
    end
  end
end

class FortuneFinder
  class Record

    def initialize(raw_domain)
      @raw_domain = raw_domain.to_s
    end

    def exists?
      @exits ||= File.exists? file_path
    end

    def domain
      @domain ||= toml["domain"] if exists?
    end

    def name
      @name ||= toml["name"] if exists?
    end

    def rank
      @rank ||= toml["rank"] if exists?
    end

    def alias?
      @alias ||= File.symlink? file_path
    end
    alias_method :alias, :alias?

    private

    def file_path
      @file_path ||= File.expand_path "#{@raw_domain}.toml", FortuneFinder.domains_path
    end

    def toml
       @toml ||= TOML.load_file file_path
    end
  end
end

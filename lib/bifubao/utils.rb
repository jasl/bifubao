module Bifubao
  module Utils
    def self.stringify_keys(hash)
      new_hash = {}
      hash.each do |key, value|
        new_hash[(key.to_s rescue key) || key] = value
      end
      new_hash
    end

    def self.check_required_options(options, names)
      names.each do |name|
        raise "Bifubao error: missing required option: #{name}" unless options.has_key?(name)
      end
    end
  end
end

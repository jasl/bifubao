require 'cgi'
require 'json'
require 'rest-client'

module Bifubao
  module Service
    API_HOST = "https://api.bifubao.com/#{Bifubao::API_VERSION}"

    CREATE_EXTERNAL_REQUIRED_OPTIONS = %w(external_order_id price_btc price_cny display_name)

    def self.create_external(options)
      options = {
          '_app_hash_id_' => Bifubao.app_hash_id,
          '_time_' => Time.now.to_i,
          'price_btc' => 0,
          'price_cny' => 0,
          '_sign_algo_' => 'sha1'
      }.merge(Utils.stringify_keys(options))

      check_required_options(options, CREATE_EXTERNAL_REQUIRED_OPTIONS)
      if options['price_btc'] + options['price_cny'] == 0 || options['price_btc'] * options['price_cny'] != 0
        raise "Bifubao error: price_btc and price_cny should only one above 0"
      end

      JSON.parse RestClient.post("#{API_HOST}/order/createexternal/", sign_query(options))
    end

    def self.sign_query(options)
      options.merge('_signature_' => Bifubao::Sign.generate(options))
    end

    def self.check_required_options(options, names)
      names.each do |name|
        raise "Bifubao error: missing required option: #{name}" unless options.has_key?(name)
      end
    end
  end
end

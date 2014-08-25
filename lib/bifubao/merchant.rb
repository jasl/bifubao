require 'cgi'
require 'json'
require 'rest-client'

module Bifubao
  module Merchant
    API_HOST = "https://www.bifubao.com/merchant-api/order"

    CREATE_PAY_REQUIRED_OPTIONS = %w(external_order_id price_btc price_cny display_name
                                          external_callback_url external_redirect_url)

    def self.create_payment(options)
      options = {
          '_app_hash_id_' => Bifubao.app_hash_id,
          '_time_' => Time.now.to_i,
          'price_btc' => 0,
          'price_cny' => 0,
          '_sign_algo_' => 'sha1'
      }.merge(Utils.stringify_keys(options))

      Utils.check_required_options(options, CREATE_PAYMENT_REQUIRED_OPTIONS)
      if options['price_btc'] + options['price_cny'] == 0 || options['price_btc'] * options['price_cny'] != 0
        raise "Bifubao error: price_btc and price_cny should only one above 0"
      end

      JSON.parse RestClient.post("#{API_HOST}/order/createexternal/", sign_query(options))
    end

    def self.sign_query(options)
      options.merge('_signature_' => Bifubao::Sign.generate_sdk_sign(options))
    end
  end
end

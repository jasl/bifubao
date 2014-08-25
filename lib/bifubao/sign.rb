require 'base64'
require 'openssl'

module Bifubao
  module Sign
    def self.to_sign_data(params)
      params = Bifubao::Utils.stringify_keys(params)

      params.delete '_signature_sha1_'
      params.delete '_signature_'
      params.delete '_checksum_'

      params.sort.map do |key, value|
        "#{key}#{value}"
      end.join('')
    end

    def self.generate_sdk_sign(params)
      Base64.encode64(Bifubao.private_key.sign(OpenSSL::Digest::SHA1.new, to_sign_data(params)))
    end

    def self.generate_merchant_api_sign(params)
      Digest::MD5.hexdigest(to_sign_data(params) + Bifubao.key)
    end

    def self.verify?(params)
      sign = params.delete(:'_signature_') || params.delete(:'_signature_sha1_')

      Bifubao::OFFICIAL_PUBLIC_KEY.verify(OpenSSL::Digest::SHA1.new, Base64.decode64(sign), to_sign_data(params))
    end
  end
end

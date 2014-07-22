require 'base64'
require 'openssl'

module Bifubao
  module Sign
    def self.to_sign_data(params)
      params.sort.map do |key, value|
        "#{key}#{value}"
      end.join('')
    end

    def self.generate(params)
      Base64.encode64(Bifubao.private_key.sign(OpenSSL::Digest::SHA1.new, to_sign_data(params)))
    end

    def self.verify?(params)
      params = Bifubao::Utils.stringify_keys(params)
      params.delete '_signature_sha1_'

      sign = params.delete('_signature_')

      Bifubao::OFFICIAL_PUBLIC_KEY.verify(OpenSSL::Digest::SHA1.new, Base64.decode64(sign), to_sign_data(params))
    end
  end
end

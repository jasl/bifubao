require 'openssl'

require 'bifubao/version'
require 'bifubao/utils'
require 'bifubao/sign'

require 'bifubao/service'

module Bifubao
  class << self
    attr_accessor :private_key
    attr_accessor :app_hash_id

    OFFICIAL_PUBLIC_KEY_PEM = "-----BEGIN PUBLIC KEY-----\n" +
        "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqUSnx8dqJ0UC0jvFTEdL\n" +
        "gde7BSmKi8GzDnxvu/AMQw7TG3pRKAAKQJRYUSqpgMyOwUSrv3yfu3gBJwufjWJz\n" +
        "Kgtm8D9TOoYnZMJm4x5Lv9/EpYEg0zrAsmU/6rZJ9mYRaNPrt811Thju0/19fa77\n" +
        "XnsQ78UmvV4zCePkKAArO70SsU/hf1SinDX//t0a3/UOk0DhKoJZpzjb5mb+dcXM\n" +
        "GOJKpAONDGDK2UE1W67HmIG72b/R/G8CAFYbw4MGCjb0/Ee6obcAGK3Cj1JcuHjH\n" +
        "NzymBH0NuDvyz7fJuTg9Eplnh1blNeCJoG/vv7VLZNKetTMTx+H2X534RUQ4XheX\n" +
        "4QIDAQAB\n" +
        "-----END PUBLIC KEY-----"

    OFFICIAL_PUBLIC_KEY = OpenSSL::PKey::RSA.new(OFFICIAL_PUBLIC_KEY_PEM)
  end
end

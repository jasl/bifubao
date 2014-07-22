require 'test/unit'
require 'bifubao'

# cheat from https://github.com/bifubao/app_demo/blob/master/pay_redirect.php
DEMO_APP_HASH_ID = '4e589c175d6a483562e1c50f54351250367d4253ed146d411dbe612eb63b52d3'
DEMO_PRIVATE_KEY_PEM = "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDUoRth9cZtSOx+\n" +
    "7MWFCRJAXSZAOA9kDzJ65yuc6KpkwKKR1yS416yGlYfbgABAcUv8D8O4/NgjaFA2\n" +
    "m84SQaCYalmCD8cxuq2n0KIEM8z/9U/SqMIg71GKdFKePJDUpEsdwgJ8UwQq1dAb\n" +
    "z3j3VJcp7+JxlsCSWkwJz31Uc74OxU81TAji0hZPPBhb4zEdGCfhTjGfrVaBVbSv\n" +
    "AdyFcBjDpDxx7LRH1Ao1TchGIxlb+ekisQhaeIEmuYP2JH/gPr+W7XEaVuXwfDTn\n" +
    "McCEDi2a9tRX29e1TWnUZPos8H++2pqjQx5T10+S+Y4nW329JL7Jx1dNbOxP6ntT\n" +
    "FcyfPM8lAgMBAAECggEAbUgcPb3G7RYkzps8bUKbSc9WQH1Pk7qn1DkJ1kxSfxPu\n" +
    "ugwcSJA4kLc7qxnfhz9zsSodCu+Q2qnbSCXNxN5L/unx9QHM/AcZB34YNxa0jvzy\n" +
    "uK+ZjrnRa9qbN86jFVcXcETtaB52rtlTa2e3oU6tnpU3CfBUKyQTnpswq/4MuaPI\n" +
    "xIc2xy+ZU6SJG4RAxbZ5zV0j2x8iTAk1u0MupNemEo7xCr0pxJid1nJlHpMS6KXZ\n" +
    "BEWl8yU6qorj7J9rgbNOKoPSba3rhtYRAfyTxRDi1EaZagVllqA96LDp0yFp9t+T\n" +
    "aszaJOSdjKEXuBcouN6kEv40ljt7nNY5+Lm4v3qUZQKBgQD6Zx3LkAyYaWNHrNEB\n" +
    "WpPbOdO0RDESn6l3ARYauzeZB24yVnXsr2AFezwj3Xj9/vJowm36n01l4/kLkVG6\n" +
    "Lq5CTPMTDadpfZqUpuk3mfRDqB8C0zouBfx9lLsytR3ncZrhpPfdsmcBh2b82dZL\n" +
    "7iH/4/wZEj6fSAciWFxqsu3ezwKBgQDZYdbAHvkEit13632Pn1FrVnXCuRsMAMbh\n" +
    "tHNBYCJE0PmVFKkBirV/xldySQfaQvZT0JDsoi1lRiE16v71kRrmJMo6SVVBDfH5\n" +
    "sNLgeOm4qNvVb2PiGAixgbX/GgqCaSkeAXYSpK+S4vl+1S+jxFRfgHUU/R/FNiUB\n" +
    "/qAbpkEPywKBgG6CMaET+qsM37bTKw5Y5iX7GFZXPf0FH6oYfaPgegH8SILIq5SA\n" +
    "NXVV1M3TQUF/UYYwQI853NOZz+BuCs6LKXazNRd0kCy7NQxjuUtDk4yEVuNNS0Di\n" +
    "fXMCv7b6Pa9V8M+imY1q3ZDMLARtMukhuDmRaUG7To3HIPbkXizsuJP7AoGASM9j\n" +
    "faAiKipU+bivqq5jN/+Sm/EiJQgRlUG6pPgNIl2Yax2rae/K0Qxe99GMRsfM98/Q\n" +
    "6uF7MQOnVgbq9NdwWguSjKlJW+vO06ItT7BQIGC2mSuhGfaQ2tumWNahFIMimYFF\n" +
    "ygLNJ/bMOHYxabn1xLMjBC+wN37mMF/XwssR2bcCgYEAzDHa2JcmEfZngYXqFID0\n" +
    "upEybl1tPFfxjAukBuCuG4Y8wdyCqHxIrU42rhJEbw4Db/zyD4/i3dilyuN7mhk8\n" +
    "6Ekaty5YiG7y3yKjQlkim4DWCc5YBSLmCSKnbnKViEnqlCw4x0+2HjYLalORwYyH\n" +
    "Dtrdb07S7MpHL04pohQ7H94=\n" +
    "-----END PRIVATE KEY-----"

Bifubao.private_key = OpenSSL::PKey::RSA.new(DEMO_PRIVATE_KEY_PEM)
Bifubao.app_hash_id = DEMO_APP_HASH_ID

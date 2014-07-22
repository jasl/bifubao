require 'test_helper'

class Bifubao::ServiceTest < Test::Unit::TestCase
  def test_create_external
    options = {
        external_order_id: SecureRandom.uuid,
        price_cny: 1,
        display_name: 'foo'
    }

    assert_nothing_raised do
      Bifubao::Service.create_external(options)
    end
  end

  def test_create_external_with_cny_and_btc
    options = {
        external_order_id: SecureRandom.uuid,
        price_cny: 1,
        price_btc: 1,
        display_name: 'foo'
    }

    assert_raise RuntimeError do
      Bifubao::Service.create_external(options)
    end
  end
end

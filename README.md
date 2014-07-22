# Bifubao

A simple bifubao ruby gem, without unnecessary magic or wraper, it's directly facing how bifubao api works.

Please read bifubao official document first: <http://wiki.bifubao.com/twiki/bin/view/Main/WebHome> .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bifubao'
```

or development version

```ruby
gem 'bifubao', :github => 'jasl/bifubao'
```

And then execute:

```sh
$ bundle
```

## Usage

### Config

```ruby
Bifubao.private_key = YOUR_PRIVATE_KEY
Bifubao.app_hash_id = YOUR_HASH_ID
```

### Create external

Official API document: <http://wiki.bifubao.com/twiki/bin/view/Main/V1OrderCreateexternal>

```ruby
options = {
  :external_order_id => 'YOUR_ORDER_ID',         # 20130801000001
  :display_name      => 'YOUR_ORDER_SUBJECCT',   # Test Good
  :price_cny         => 100
}

Bifubao::Service.create_external(options) # returns json contains result
```

### Verify notify

TODO

## Contributing

Bug report or pull request are welcome.

### Make a pull request

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please write unit test with your code if necessary.

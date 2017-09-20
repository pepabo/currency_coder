# CurrencyCoder

This library provides a functionality to allow you to convert strings to some currency-like code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currency_coder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install currency_coder

## Usage

```ruby
cc = CurrencyCoder.new

currency_map = {
  "osamu"    => "OSM",
  "mayoto"   => "MYT",
  "kurotaki" => "KRT",
  "putchom"  => "PTM",
  "antipop"  => "ATP",
  "jitsuzon" => "JZN"
}

currency_map.each do |name, code|
  assert_equal code, cc.as_currency_code(name)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/currency_coder.

## Author

[Kentaro Kuribayashi](https://kentarok.org/)

## License

Copyright (c) 2017 [GMO Pepabo, Inc.](https://pepabo.com/)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

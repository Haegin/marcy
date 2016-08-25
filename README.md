# Marcy

This is a Ruby client gem for accessing HMRC's new APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'marcy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marcy

## Usage

```
[1] pry(main)> require "marcy/user"
=> true
[2] pry(main)> require "marcy/hello/world"
=> true
[3] pry(main)> require "marcy/hello/user"
=> true
[4] pry(main)> require "marcy/national_insurance/annual_summary"
=> true
[5] pry(main)> user = Marcy::User.new(access_token: "dc89817a6bd7924b44347018ecc0dd", refresh_token: "db7428d73d8843a859c27608348bdb")
=> #<Marcy::User:0x007ff97d2625b8 @access_token="dc89817a6bd7924b44347018ecc0dd", @refresh_token="db7428d73d8843a859c27608348bdb">
[6] pry(main)> Marcy::Hello::World.new.get.json
=> {"message"=>"Hello World"}
[7] pry(main)> Marcy::Hello::User.new(user).get.json
=> {"message"=>"Hello Sandbox User"}
[8] pry(main)> Marcy::NationalInsurance::AnnualSummary.new(user).get(utr: "2234567890", tax_year: "2014-15").json
=> {"class1"=>{"totalNICableEarnings"=>10.0}, "class2"=>{"totalDue"=>20.0}, "maxNICsReached"=>false}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Haegin/marcy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


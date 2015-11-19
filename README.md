# AvoidMetreon

A simple generator that looks up the schedule for events at Moscone Center and generates a page warning whether to expect the surrounding areas (Metreon, Yerba Buena, etc) to be crowded. If the event is one of the known large events in the area, it will return with a status of 'Avoid.' If there's an event in general, it will return with a status of 'Warning.' Otherwise, things are presumed to be 'Okay' within the area.

## Really?

Look, I decided to go to the area not realizing Dreamforce was going on. Then I did it again during Oracle World. A bad time was had.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avoid_metreon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avoid_metreon

## Usage

To generate a page, simply run:

    $ avoid_metreon <date>

This will output the page to standard out, from which you may save it to a file, upload to S3, etc. Date should be passed in yyyy-mm-dd format. If date is omitted, then a page for the current date is generated.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ystros/avoid_metreon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

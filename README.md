# Matey

📈 User Engagement Tracking Components for [Ahoy][https://github.com/ankane/ahoy] 🏴‍☠️

A suite of user engagment ViewComponents for plug and play use right from your Ahoy data! 
No need to spend time finding what information you need and how to write the queries to set that up.
Simply install the gem, input the required data and track how your users are responding to your application!

This gem includes components for the following reports:

* Active Users

This gem assumes that event data is coming from [Ahoy](https://github.com/ankane/ahoy) which is a fantastic library
for tracking visits and events. Your project must have Ahoy installed and configured in order to benefit from Matey.

This gem assumes that you have [Bootstrap 5.1](https://getbootstrap.com/docs/5.1/getting-started/introduction/) loaded 
in your project. It will work without Bootstrap, however, you will need to provide your own custom styling for the 
Bootstrap equivalent classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'matey', github: 'harled/matey', branch: 'main'
```

And then execute:

    $ bundle install

## Usage

...

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

A sample application is included in this repository to help with exploring the components and testing. To use the 
sample application: 

1. cd sample
2. bundle
3. rails s
4. Open a browser to localhost:3000

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harled/matey. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/harled/matey/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Matey project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/harled/matey/blob/master/CODE_OF_CONDUCT.md).

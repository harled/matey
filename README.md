# Matey

![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/harled/matey) 
![GitHub issues](https://img.shields.io/github/issues-raw/harled/matey) 
![GitHub Repo stars](https://img.shields.io/github/stars/harled/matey?logoColor=purple&style=social)

📈 User Engagement Tracking ViewComponents for [Ahoy](https://github.com/ankane/ahoy) data 🏴‍☠️

This gem provides a suite of prebuilt [ViewComponents](https://github.com/github/view_component) to observe user engagement in an Ahoy-powered Ruby on Rails application.


## Installation

`matey` depends on:
* [Ahoy](https://github.com/ankane/ahoy) installed, configured and  tracking user visit and event data
* [Bootstrap 5.1](https://getbootstrap.com/docs/5.1/getting-started/introduction/) available for styling

Add this line to the Gemfile:

```ruby
# latest from rubygems
gem 'matey'

# or latest from github
gem 'matey', github: 'harled/matey', branch: 'main'
```

And then execute:

    $ bundle install

## Usage

Once `matey` is installed, the next step is to render a component. The data required varies by component. 
Below is an example of how the `Matey::ActiveUsersComponent` would be 
called in an application. This component reports on the number of active users within the past two weeks.

Below the component is called with two named parameters which include `events` (ahoy event data) and 
the `time_window`, which is the period to report on.

```ruby
# dashboard.html.erb
<%= render Matey::ActiveUsersComponent.new(events: Ahoy::Event.all, time_window: 1.week) %>
```

It is that simple! There should now be a card displaying the number of active users within the past week.

View the list of available components [here](COMPONENTS.md).

**Note**: The more data, the more interesting the components will be. A common and helpful pattern is to capture events on all controller actions. Details on doing this can be found [here](https://github.com/ankane/ahoy#ruby).

## Development

After checking our the repository, run the following commands to get started:

```bash
# install required packages
bin/setup  

# run test cases and ensure everything is passing
rake spec  

# an interactive prompt that will allow you to experiment with matey (currently broken!)
bin/console
```

To install `matey` and make it available as a regular rubygem, run the following command: `bundle exec rake install`

### Sample Application

ViewComponents are pretty hard to test without a Ruby on Rails application. This repository includes a sample application that makes it easy to see how a component renders and make quick adjustments.

To use the sample application: 

1. `cd spec/sample`
2. `bundle`
3. `rails s`
4. Open a browser to `localhost:3000`

## Testing

To run the test cases:

1. `rails db:test:prepare`
2. `bundle exec rake`

## Releasing a New Version

To release a new version:

1. Update the version number in `version.rb`
2. Run `bundle exec rake release`

The rake task will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Please take a look at our [Contribution Guidelines](https://github.com/harled/matey/blob/main/docs/CONTRIBUTING.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the *Matey* project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/harled/matey/blob/master/CODE_OF_CONDUCT.md).

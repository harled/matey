# Matey

📈 User Engagement Tracking Components for [Ahoy](https://github.com/ankane/ahoy) 🏴‍☠️

A suite of user engagment ViewComponents for plug and play use right from your Ahoy data! 
No need to spend time finding what information you need and how to write the queries to set that up.
Simply install the gem, input the required data and track how your users are responding to your application!

This gem assumes that event data is coming from [Ahoy](https://github.com/ankane/ahoy) which is a fantastic library
for tracking visits and events. Your project must have Ahoy installed and configured in order to benefit from Matey.

This gem assumes that you have [Bootstrap 5.1](https://getbootstrap.com/docs/5.1/getting-started/introduction/) loaded in your project. It will work without Bootstrap, however, you will need to provide your own custom styling for the Bootstrap equivalent classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'matey', github: 'harled/matey', branch: 'main'
```

And then execute:

    $ bundle install

You will now have the latest version of Matey on your project. Checkout the Usage section to see what components there are and how to use them in your app!

## Usage

Look here to see what components Matey offers and how to use them 🛠️

### Common Flows

Some common flows to recognize how the named paramaters work for the components. This is what a Matey view component render line would look like in your view file:

```
<%= render Matey::ComponentName.new(events: Ahoy::Event.all, time_window: 1.week) %>
```

Here we can see that all components begin with **`Matey::`** followed by the name of the component. The **`data`** parameter will take in Ahoy data as an ***ActiveRecordRelation*** collection. 

The **`time_window`** takes in an amount of time that the component will look calculate the data for and uses this to set the specific date range that the data will be taken from. This is an optional parameter and the default will be a 1 week time window.

In this example, the component will take the **`Ahoy::Events`** data and show information about the week of data.

**Note**: The data the component is completely limited by the extent of your [Ahoy](https://github.com/ankane/ahoy) data. Setting up events on each controller action can be seen [here](https://github.com/ankane/ahoy#ruby) and can be done in the base controller so that all other controllers inherit from here and will create Ahoy events.

Also, if you have a lot of data, you can cut down the data that you are passing through by reducing the time the events have occurred, however the comparison between the current and previous `time_window` will require two time windows worth of data (ie. for data from last week, this will compare to data from 2 weeks ago)

### New Users Component

![New Users Component](./images/newUsersComponent.png)

The New Users component will calculate the number of new users that have been created in the given time window and show you the amount and percentage change from the previous time period. The code should look like this:

```
<%= render Matey::NewUsersComponent.new(users: User.all, time_window: 2.month) %>
```

Here we are passing in all of our **User** model data for the component to find the new users that were made in the last 2 months, but we can filter this data to only include a specific subset of users or from a specific time period. The component will find the new users created in the past month and show us the increase/decrease since the last period.
### Active Users

![Active Users Component](./images/activeUsersComponent.png)

The Active Users component will calculate the number of active users that have been created in the given time window and show you the amount and percentage change from the previous time period. This component counts active users as those who have been involved in an Ahoy event in the given time window. The code should look like this:

```
<%= render Matey::ActiveUsersComponent.new(events: Ahoy::Event.all, time_window: 1.month) %>
```

Here we are passing in all of our **Ahoy::Event** model data for the component to find the user that were triggered some Ahoy Event, but we can filter this data to only include a specific subset of Ahoy Events or from a specific time period. The component will find the active users created in the past month and show us the increase/decrease since the last period.

### New Activity Component

![New Activity Component](./images/newActivityComponent.png)

The New Activity component will calculate the number of Ahoy events that have been created in the given time window and show you the amount and percentage change from the previous time period. The implementation should look like:

```
<%= render Matey::NewActivityComponent.new(events: Ahoy::Event.all, time_window: 1.month) %>
```

Here we are passing in all of our **Ahoy::Event** model data for the component to count all Ahoy Event, but we can filter this data to only include a specific subset of Ahoy Events or from a specific time period. The component will find the Ahoy events created in the past month and show us the increase/decrease since the last period.
### Top Visited Landing Pages Component

![Top Visited Landing Pages Component](./images/topVisitedPages.png)

The Top Visited Pages Table Component component will take advantage of **`Ahoy::Visit`** and gives you a list of the top visited paths. Just pass in the Ahoy::Visit.all and the component will calculate the top landing pages based on the visits that have been created in the given time window. The *`limit`* parameter limits the number of results and is 10 by default. The implementation should look like:

```
<%= render(Matey::TopVisitedPagesTableComponent.new(events: Ahoy::Visit.all, time_window: 1.month, limit: 10)) %>
```

### Top Events Component

![Top Events Component](./images/topEvents.png)

The Top Events Component component will give you a list of the top Ahoy::Event's that are triggered by your users. Just pass in the Ahoy::Event.all and the component will calculate the top events that have been triggered in the given time window. The *`limit`* parameter limits the number of results and is 10 by default. The implementation should look like:

```
<%= render(Matey::TopEventsComponent.new(events: Ahoy::Event.all, time_window: 1.month, limit: 10)) %>
```

### Custom Card Component
*Coming Soon...*
### Custom Table Component
*Coming Soon...*
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

A sample application is included in this repository to help with exploring the components and testing. To use the 
sample application: 

1. cd spec/sample
2. bundle
3. rails s
4. Open a browser to localhost:3000

## Testing

Use the folloiwng steps to run the test cases:

1. rails db:test:prepare
2. bundle exec rake

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harled/matey. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/harled/matey/blob/master/CODE_OF_CONDUCT.md).

### Contribution Steps:

Want to help us out? Here are some steps to make sure you are contributing 

1. Find an issue you like, or create a new issue [here](https://github.com/harled/matey/issues) 
    - Please ask for any questions or clarifications in the associated issues or in new issues! 🤔
2. Assign yourself to the issue and create a branch , following GitHub Issue's naming scheme. 🛠️
    - The naming scheme should follow (#issueNumber-issue-name) ie. (#10-create-new-component)
3. Get on your local machine and [ensure you have the repo cloned](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). Checkout the branch you just made with `git checkout branch-name` and pull the latest merged changes from the repo with `git pull origin main` to make sure you have the most up-to-date code from the repo. 👩‍💻
4. Add your amazing changes along with any documentation you feel would be useful. Then commit and push your changes. 🌟
5. Go back to the repo on GitHub and create a pull request! Then wait for an admin of the repo to get back to your pull request, address any comments and once you are finally approved, merge your code into Matey! 🎉

If you want some more tips on contributing to GitHub projects, [check out this resource from Data School](https://www.dataschool.io/how-to-contribute-on-github/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Matey project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/harled/matey/blob/master/CODE_OF_CONDUCT.md).

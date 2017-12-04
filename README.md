[![Coverage](https://codeclimate.com/github/jjeremydiaz/OpenHouse/badges/coverage.svg)](https://codeclimate.com/github/jjeremydiaz/OpenHouse/coverage)

[![Maintainability](https://api.codeclimate.com/v1/badges/3bccb3728ff552747b0c/maintainability)](https://codeclimate.com/github/jjeremydiaz/OpenHouse/maintainability)

[![Build Status](https://travis-ci.org/jjeremydiaz/OpenHouse.svg?branch=master)](https://travis-ci.org/jjeremydiaz/OpenHouse)

# OpenHouse
OpenHouse is a platform for freelancers to connect and share workspaces. Users of the app can rent out their houses by the hour or per day to other users who want places to work, and they can connect with others in the OpenHouse community.

Some of the features the app supports include:
* Users can create and delete accounts and use them to log in and out.
* Users can search for nearby available rentals by typing in an address.
* Users can customize their public-facing profile pages and post information about their rentals.
* Users can send messages to each other through the app.
* Users can reserve an open house for a specific day and time range.

## Screenshots

This is what a host's public-facing profile page looks like. They have a name and picture for their house, a name and picture for themselves, and some information about their house. They also have a list of amenities that their house has to offer.

![Profile Page Image](app/assets/images/screenshot_for_readme_user_profile.png?raw=true "Profile Page")

This is what the app looks like when you press "Search." The results are shown on the left and their corresponding price tags are displayed on the right-side map.

![Search Page Image](app/assets/images/screenshot_for_readme_search.png?raw=true "Search Page")

The bar at the top of the page also has some useful buttons that can be used to navigate the site.

## Screencast

Here is a link to a [video][3] of the app being used.

## Instructions

### Setup

1. Clone the repo.

    `git clone https://github.com/jjeremydiaz/OpenHouse.git`
    
2. Navigate to the OpenHouse folder

    `cd OpenHouse`

3. Install Ruby 2.3.5 (if needed)

    `rvm install ruby-2.3.5`

4. Install bundler

    `gem install bundler`

5. Run Bundler

    `bundle install`

6. Start the Postgres SQL server
    
    `sudo service postgresql restart`
    OR (depends on your setup)
    `pg_ctl -D /usr/local/var/postgres start`

7. Set up the database

    `rake db:setup`
    
    The following error is common while setting up the database. It concerns an encoding problem with the database:
    
    `Called from /usr/local/rvm/gems/ruby-2.3.5/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in 'load_dependency'
    PG::InvalidParameterValue: ERROR:  new encoding (UTF-8) is incompatible with the encoding of the template database (SQL_ASCII)`
    
    If this error occurs, go to OpenHouse -> config -> database.yml, and change the encoding in line 3 to match your database template.
    In the case of the above example, we would change it from the incompatible UTF-8 to SQL_ASCII.
    
    Replace `encoding: UTF-8` with `encoding: SQL_ASCII`

8. Run the app

    `sudo screen -d -m rails s`
    OR (depends on your setup)
    `rails server`

9. Access the app via your web browser (localhost:3000 or whatever your Cloud9 port and ip are).

Note: 
* During application development, postgresql needs to be reset often. When the following error appears:
    `Called from /usr/local/rvm/gems/ruby-2.3.5/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in 'load_dependency'
could not connect to server: Connection refused
        Is the server running locally and accepting
        connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?`
    
    When this happens, run the following command to solve this problem:
    `sudo service postgresql restart`
* To reset the database if it is giving you issues, run
    `rake db:reset`. In postgresql, this will drop the previous tables, create the required tables, and run all migrations for you as well. If you run `rails server` or an equivalent command right resetting the database, it should work.
  
    
    
### Testing

To run cucumber tests, just use `cucumber`

To run rspec tests, just use `rspec`

### Shutdown

To stop the server, go into the screen and kill it

`screen -r`

`<Ctrl-c>`

`exit`

## Helpful Links
[Pivotal Tracker][1]

[Heroku App][2]

## Future Tasks

The app is far from complete. There are a lot of things that could be added that would make it much more useable and finished. Here are our ideas:

* Make available times show up properly
    * There ought to be a Gantt chart showing the times that are already rented
    * It may be useful to show information about who else is renting at those times
* Pricing fixes: once the user has chosen to rent the space for a certain amount of hours, then the app will charge them for the day instead of per hour
* Integration with a 3rd party application for charging or paying a user for a reservation
    * Once this is completed, implement a method within the app to officially confirm the reservation upon billing authentication
* Dynamic calendar selection
    * Instead of selecting starting and ending times for reservation, users should be able to use a more visual interface to select the time they want
* Users should be able to post more than one house for rent
* User profile page customization
    * Users should be able to add more photos of their homes and/or themselves
    * Users should be able to change the order/layout of their photos
    * Users should be able to use old photos instead of uploading new ones each time they want to make a change
* There could be a "friends" feature
    * It would be good if users could connect a little more than just reserving places and going to them
* Add more animation to the site overall
* Tutorial
    * There really ought to be a tutorial or some instructions somewhere that tell people how to use the site
    * There could just be little (i) symbols next to things that tell you little blurbs about things
* Make the app more mobile-friendly
* Rating system
    * People might want to leave public feedback about other people's houses

[3]: https://www.google.com/
[2]: http://openhouse-1.herokuapp.com/
[1]: https://www.pivotaltracker.com/n/projects/2117895

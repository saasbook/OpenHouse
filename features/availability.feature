# Pivotal Tracker ID: 151973931
Feature: User can see another user's available times
  As a user
  So that I can change rent my space
  I want users to be able to see my availability
  
Background: a user has been created in the database
    Given the following accounts exist:
      | email          | password | home_street_address     | home_city         | home_state         | home_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv | available_time_start | available_time_end | searchable  | price |
      | dave@gmail.com | 12345678 | 2398 Telegraph Avenue   | Berkeley          | California         | 94704         | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 | 06:00                | 18:00              | true        | 10    |
  
  Given I am on the homepage
  When I press "Search"
  Then I should see "Available: 6:00 a.m. - 6:00 p.m."

Scenario: availability of profile on the profile page
  Given I am on the home page
  When I press "Search"
  Then I should see "Available: 6:00 a.m. - 6:00 p.m."
  
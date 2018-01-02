# Pivotal Tracker ID: 151974066
Feature: User can click on search results' profile
  As a User
  So that I can know if a rental space is good for me
  I want to be able to click on a search result to see their profile.

Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 3845 Market Street  | Oakland       | CA          | 94608         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |

Scenario: user can view other user's profile
  Given I am on the home page
  And I fill in "search-bar" with "Oakland"
  When I press "Search"
  And I click a post with id "link_3845 Market Street"
  Then I should see "3845 Market Street"
  And I should not see "Edit Profile"

# Pivotal Tracker ID: 151974086
# Pivotal Tracker ID: 151973994

Feature: Users can send each other messages
  As a User
  So that I can communicate with other users
  I want to be able to receive messages.

Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address   | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 3845 Market Street    | Oakland       | CA          | 94608         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |
    | terminator@future.com   | password   | 2575 Telegraph Avenue | Berkeley      | CA          | 94704         | Compact             | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 | true       | 200   |

  And I log in with email "terminator@future.com" and password "password"
  And I am on the home page
  And I press "Search"
  And I click a post with id "link_3845 Market Street"
  And I should see "3845 Market Street"
  And I follow "Reserve"
  And I follow "Log Out"
  And I log in with email "aladdin@agrabah.com" and password "12341001"

Scenario: User can see a request via the chat
  Given I follow "View Requests"
  And I follow "Terminator"
  Then I should see "I would like to reserve your place."

Scenario: User can see a request via the chat
  Given I follow "View Requests"
  And I follow "Terminator"
  When I fill in "message_body" with "Too bad."
  And I press "Add Reply"
  Then I should see "Too bad."


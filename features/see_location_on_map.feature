# Pivotal Tracker ID: 151974069

Feature: Guest wants to see location of a search result
    As a Guest,
    So I can see if a rental space is good for me,
    I want to see its location on a map.
  
Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 101 Agrabah Dessert | Agrabah       | ME          | 10101         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |
    | terminator@future.com   | password   | 1234 Robots Factory | New Berkeley  | NCA         | 76767         | Compact             | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 | true       | 200   |

Scenario: Click a search result and see its location
  Given I am on the home page
  Given I fill in "Address" with "2368 Le Conte Ave"
  Given I fill in "City" with "Berkeley"
  Given I fill in "State" with "CA"
  And I press "Search"
  Then I should be on the search results page
  And I should see object "div" with id "map"

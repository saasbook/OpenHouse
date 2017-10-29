Feature: User can click on search results' profile
  As a User
  So that I can know if a rental space is good for me
  I want to be able to click on a search result to see their profile.
  
Scenario: user clicks on search result to learn more
  Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
  And I am on the home page
  When I press "Search"
  And I follow "See More"
  Then I should see "aladdin@agrabah.com"
  
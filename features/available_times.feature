Feature: Users inputting space availability for rental spaces
  As a User,
  So that I can get my space rented,
  I want to be able to input times I have available for the next two weeks.
    

Background: user accounts have been added to database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
    And I log in with email "aladdin@agrabah.com" and password "12341001"
    And I am on the home page
Scenario: host can go to edit space availability
  Given I follow "Edit Profile"
  Then I should be on the edit page
  And I fill in "available_time_start" with "12:00"
  And I fill in "available_time_end" with "5:00"
  And I press "Save Changes"
  And I am on the home page
  When I press "Search"
  Then I should see "12:00 p.m. - 5:00 p.m."
  
Scenario: when users create a post, it will ask for space availability
  Given I am not logged in
  And I am on the OpenHouse home page
  When I click "Create New Account"
  And I fill in "email" with "myemail"
  And I fill in "password" with "mypassword"
  And I input "house" into "Rental Space"
  Then I input "availability" in the availability field
  Then I click "Publish"
  Then I should go to the "List of Rental Spaces"
  And I should see "availability" in the availability field for "Post".

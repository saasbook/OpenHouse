Feature: User can view and edit profile information
  As a user
  So I can see what other users see on my profile
  I want to be able to view my profile
  
Background: user accounts have been added to database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
    And I log in with email "aladdin@agrabah.com" and password "12341001"
    And I am on the home page

Scenario: View Profile Information
  Given I follow "View Profile"
  Then I should be on the user profile page
  Then I should see "aladdin@agrabah.com"
  Then I should see "Ali"
  Then I should see "Ababwa"
  Then I should see "Agrabah Dessert"
  Then I should see "Agrabah"
  Then I should see "Middle East"
  Then I should see "10101"
  Then I should see "1234567812345678"
  Then I should see "25-Nov-2300"
  Then I should see "101"

Scenario: Edit Profile Information
  Given I follow "Edit Profile"
  Then I should be on the edit page
  And I fill in "Billing Street Address" with "Real Address"
  And I fill in "Billing City" with "Real City"
  And I fill in "Billing State" with "Liquid State"
  And I fill in "Billing Zip Code" with "77877"
  And I fill in "First Name" with "Reyal"
  And I fill in "Last Name" with "Pearson"
  And I fill in "Credit Card Number" with "7777777777777777"
  And I fill in "Expiration Date" with "31-Dec-9999"
  And I fill in "CVV" with "777"
  And I press "Submit"
  
  And I go to the user profile page
  Then I should see "Reyal"
  Then I should see "Pearson"
  Then I should see "Real Address"
  Then I should see "Real City"
  Then I should see "Liquid State"
  Then I should see "77877"
  Then I should see "7777777777777777"
  Then I should see "31-Dec-9999"
  Then I should see "777"
  And account with email "aladdin@agrabah.com" should not exist

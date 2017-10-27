Feature: User deletes account
  As a OpenHouse User
  So that I can stop using OpenHouse
  I want to delete my account
  
Background: a user has been created in the database
  Given I am on the user creation page
  And I create the OpenHouse user
  Then a user with the following fields should exist:
    | email          | password | billing_street_address | billing_city | billing_state | billing_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
    | dave@gmail.com | 12345678 | 2700 Mars              | Berkeley     | California    | 94720            | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: delete account
  Given that I am on the user edit page
  And I press on the delete account button at the bottom
  And I press on the confirm button 
  Then I expect my account to be deleted from the database
  
Scenario: delete account
  Given that I am on the user edit page
  And I press on the delete account button at the bottom
  And I press on the cancel button 
  Then I expect my account to still exist in the database
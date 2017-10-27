Feature: User Logout
    As a User
    So that I can have a life
    I want to be able to log out
    
Background: a user has been created in the database
    Given I am on the user creation page
    And I create the OpenHouse user
    Then a user with the following fields should exist:
      | email          | password | billing_street_address | billing_city | billing_state | billing_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
      | dave@gmail.com | 12345678 | 2700 Mars              | Berkeley     | California    | 94720            | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: Host can log out after being logged in
    Given I am logged in
    And I am on the OpenHouse main page
    When I press the "Log Out" button
    Then I should be logged out

Scenario: Host cannot log out if he already logged out in another tab
    Given I am logged in
    And I have OpenHouse open in two browser tabs
    And I am on the OpenHouse home page
    And I press the "Log Out" button in one of the browser tabs
    Then I should be logged out
    And when I attempt to log out from the other tab
    Then I should be taken to the main page
    And I should be logged out

Scenario: Host cannot log out if not logged in
    Given I am not logged in
    And I am on the OpenHouse home page
    Then I should not see the option to log out

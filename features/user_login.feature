Feature: User Login
    As a User
    So that I can manage my account
    And interact with OpenHouse
    I want to be able to log in
    And I don't want others to log in
    
Background: a user has been created in the database
    Given the following accounts exist:
      | email          | password | billing_street_address | billing_city | billing_state | billing_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
      | dave@gmail.com | 12345678 | 2700 Mars              | Berkeley     | California    | 94720            | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: Host can log in with correct credentials
    Given I am on the login page
    And I fill in "Email" with "dave@gmail.com"
    And I fill in "Password" with "12345678"
    When I press "Log in" 
    Then I should be logged in as user with email "dave@gmail.com"
    And I should not see "Log In"
    And I should see "Log Out"

Scenario: Host cannot log in with incorrect email
    Given I am on the login page
    And I fill in "Email" with "jonathan@gmail.com"
    When I press "Log in" 
    Then I should see "Invalid email/password combination"
    And I should see "Log in"
    And I should not see "Log Out"
    
Scenario: Host cannot log in with incorrect password
    Given I am on the login page
    And I fill in "Password" with "12345679"
    When I press "Log in" 
    Then I should see "Invalid email/password combination"
    And I should see "Log in"
    And I should not see "Log Out"

Scenario: Host cannot log in with incorrect email and password
    Given I am on the login page
    And I fill in "Email" with "jonathan@gmail.com"
    And I fill in "Password" with "12345679"
    When I press "Log in"
    Then I should see "Invalid email/password combination"
    And I should see "Log in"
    And I should not see "Log Out"

Scenario: Host cannot log in if already logged in
    And I am on the home page
    Then I should not see "Log In"

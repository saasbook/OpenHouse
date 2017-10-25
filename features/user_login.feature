Feature: User Login
    As a User
    So that I can manage my account
    And interact with OpenHouse
    I want to be able to log in

Scenario: Host can log in with correct credentials
    Given I am not logged in
    And username "Joe" with password "pass" exists
    And I am on the OpenHouse main page
    When I fill in username with "Joe"
    And I fill in password with "pass"
    And I press "Log In"
    Then I should be logged in

Scenario: Host cannot log in with incorrect credentials
    Given I am not logged in
    And username "Joe" with password "pass" does not exist
    And I am on the OpenHouse main page
    When I fill in username with "Joe"
    And I fill in password with "pass"
    And I press the "Log In"
    Then I should see "Invalid Username or Password"

Scenario: Host cannot log in if already logged in
    Given username "Joe" with password "pass" exists
    And I am logged in
    And I am on the OpenHouse home page
    Then I should not see "Log In"

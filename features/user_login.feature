Feature: User Login
    As a User
    So that I can manage my account
    And interact with OpenHouse
    I want to be able to log in

Scenario: Host can log in with correct credentials
    GIVEN I am not logged in
    AND I am on the OpenHouse home page
    AND I enter my credentials
    WHEN I press the "Log In" button
    THEN I should be logged in

Scenario: Host cannot log in with incorrect credentials
    GIVEN I am not logged in
    AND I am on the OpenHouse home page
    AND I enter invalid credentials
    WHEN I press the "Log In" button
    THEN I should see an error message

Scenario: Host cannot log in if already logged in
    GIVEN I am logged in
    AND I am on the OpenHouse home page
    THEN I should not see the option to log in

Feature: Account Creation
    As a human
    So that I can start using OpenHouse
    I want to create an OpenHouse account
Scenario: Human can create an account with an unused username
    GIVEN I am not logged in
    AND I am on the OpenHouse home page
    WHEN I click "Create New Account"
    AND I fill in an unused username
    AND I fill in the rest of the details
    WHEN I press "Create Account"
    THEN my new account should exist
    THEN I should see a confirmation message

Scenario: Human cannot create an account with a used username
    GIVEN I am not logged in
    AND I am on the OpenHouse home page
    WHENI click "Create New Account"
    AND I fill in a used username
    AND I fill in the rest of the details
    WHENI press "Create Account"
    THEN my account should not exist
    THEN I should see an error message

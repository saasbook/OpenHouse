# Pivotal Tracker ID: 153126773
Feature: Account Creation With Invalid Information
    As a human
    So that I can start using OpenHouse
    I want to create an OpenHouse account
    And if I input invalid information I do not want my fields whiped

Background: accounts have been added to database
  Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
    
  Scenario: User signs up with invalid email
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101.gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "First Name" with "David"
    And I fill in "Last Name" with "Morrison"
    And I fill in "Personal Description" with "Hi, My name is David. Nice to meet yall."
    When I press "Submit"
    Then I should see "email is invalid"
    And the "E-mail Address" field should contain "dave101.gmail.com"
    And the "Password" field should not contain "12345678"
    And the "First Name" field should contain "David"
    And the "Last Name" field should contain "Morrison"
    And the "Personal Description" field should contain "Hi, My name is David. Nice to meet yall."
    
  Scenario: User signs up with invalid password
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "1234"
    And I fill in "First Name" with "David"
    And I fill in "Last Name" with "Morrison"
    And I fill in "Personal Description" with "Hi, My name is David. Nice to meet yall."
    When I press "Submit"
    Then I should see "password is too short (minimum is 8 characters)"
    And the "E-mail Address" field should contain "dave101@gmail.com"
    And the "Password" field should not contain "1234"
    And the "First Name" field should contain "David"
    And the "Last Name" field should contain "Morrison"
    And the "Personal Description" field should contain "Hi, My name is David. Nice to meet yall."
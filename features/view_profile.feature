Feature: User can view profile information
  
  As a user
  So I can see what other users see on my profile
  I want to be able to view my profile
  
Background: user accounts have been added to database, and posts are made

  Given the user accounts exist:
  | username | password  | name      | email          | credit_card_number  | address |
  | jello    | test1234  | Ice Cream | test@gmail.com | 1234 5678 9876 5432 | 123 Rainbow Road |
  And I am on the home page

Scenario: Change account information
  When I follow "View Profile"
  Then I should see "jello"
  Then I should see "test@gmail.com"
  Then I should see "123 Rainbow Road"
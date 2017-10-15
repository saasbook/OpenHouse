Feature: post details page
  
  As a host,
  So that I can customize the view of my posts
  I want to a preview of the post before posting it

Background: user accounts have been added to database, and posts are made

  Given the user accounts exist:
  | name        | password  | credit card   |
  | Aladdin     | password  | 11111111      |
  | Terminator  | 12345     | 00010001      |
  | Pepsiman    | pepsi     | 12341234      |
  Then "Terminator" makes a post "p1"
  
Scenario: preview in edit page
  Given I log in as "Terminator"
  And I go to the edit page for "p1"
  And I follow "Preview"
  Then I should be in the preview page for "p"

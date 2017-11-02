Feature: Guest can see description of rental space
  As a Guest
  So I can look quickly learn more about the space
  I want to see a brief description of the space

  
Scenario: guest sees description of rental space
  Given I am logged in as a Guest
  When I click on the post
  Then I should see a brief description of the space
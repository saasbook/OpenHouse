Feature: Guests can see pictures in search
  As a guest
  So that I can search for a space to rent
  I want to see pictures of the space I rent

Scenario: guest sees picture in search and clicks on picture
  Given I am logged in as a Guest
  When I search rental spaces and click on picture
  Then I should be able to go to see more pictures of the post

Scenario: guest sees picture in search and clicks on description
  Given I am logged in as a Guest
  When I search rental spaces and click on the description of the picture 
  Then I should be able to go to the post page
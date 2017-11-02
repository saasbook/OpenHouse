Feature: view Post image in fullscreen
  
  as a Guest user
  so that I can view Post images well
  I'd like to be able to view images in fullscreen by clicking them.
  
  Given I am logged in as a Guest
  And I am on a "Post Page" page 
  
Scenario: view image in fullscreen
  When I click on one of the Post images
  Then I should see the image in fullscreen
  
Scenario: get out of fullscreen view
  When I click on one of the Post images
  And I should see the image in fullscreen
  And I click outside the image
  Then I should go back to the regular Post view
  

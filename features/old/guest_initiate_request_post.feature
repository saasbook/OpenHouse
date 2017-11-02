Feature: initiate request on a Post as a Guest user
  As a Guest user
  So that I can make use of an available post
  I want to be able to request a post
  
  Given that I have a Guest user account 
  And I am logged in as a Guest user
  And I am viewing a Post page
  
Scenario: initiate a request on a Post
  When I click on the "Reserve" button
  Then I should see "Your request has been sent"
  And I should see "You will be notified if the Host confirms or denies your request."
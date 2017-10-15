Feature: Host can edit profile information
  
  As a host
  So I can change change my account information
  I want to be able to edit my profile information
  
Scenario: Change account information
  When I follow "Edit Profile"
  And I change my "Email address" to "test@gmail.com"
  And I follow "Save"
  Then I should see "test@gmail.com"
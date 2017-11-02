Feature: Hosts inputting space availability for rental spaces

    As a Host,
    So that I can get my space rented,
    I want to be able to input times I have available for the next two weeks.
    
Scenario: host can go to edit space availability
  Given I am a host
  And "Post" exists
  And "Post" is a host post
  When I click "Edit" on "Post"
  Then I go to the "Edit Rental Space Information" page
  Then I input "availability" in the availability field
  Then I click "Save Changes"
  Then I should go to the "List of Rental Spaces"
  And I should see "availability" in the availability field for "Post".
  
Scenario: when hosts create a post, it will ask for space availability
  Given I am a host
  And "Post" exists
  And "Post" is a host post
  When I click "Create New"
  Then I go to the "Edit Rental Space Information" page
  Then I input "availability" in the availability field
  Then I input "Post" in the name field
  Then I click "Publish"
  Then I should go to the "List of Rental Spaces"
  And I should see "availability" in the availability field for "Post".
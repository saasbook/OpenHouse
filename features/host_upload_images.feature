Feature: Users can upload images
    As a User who wants to rent my house
    So that I can attract other users and make my home look inviting
    I want to upload images of my space

Scenario: user uploads images
    Given I am logged in
    And I am on the edit profile page
    When I choose an image to upload
    And I press the upload button
    Then images should be added to the post

Scenario: user uploads the wrong type of file
    Given I am logged in
    And I am on the edit profile page
    When I choose a video to upload
    And I press the upload button
    Then I should see an error message
    Then the file should not be uploaded

Scenario: user tries to upload nothing
    Given I am logged in
    And I am on the edit profile page
    When I press the upload button
    Then I should see an error message
    And the profile should remain unchanged

Scenario: user selects a file and forgets to upload it
    Given I am logged in
    And I am on the edit profile page
    When I choose an image to upload
    And I press the back button
    Then I should see an error

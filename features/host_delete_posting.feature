Feature: As a Host who has published a posting for space, I want to be able to delete it.

    As a Host,
    So that I can remove my undesired rental spaces,
    I want to be able to delete a rental space post.
    
Scenario: host can delete a post
  Given I am a host
  And "Post" exists
  And "Post" is a host post
  When I click "Delete" on "Post"
  Then I should see a confirmation window
  When I click "Yes" on the confirmation window
  Then I should see "Post was deleted"
  When I refresh
  Then I should not see "Post"
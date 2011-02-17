Feature: Manage artists
  In order to manage
  Artists
  I want to add artists to a given user
  
  Scenario: Add a new artist only when authenticated
    Given I am logged in as "mjohann@web.de" with password "123456"
    And I am on the home page
    Then I should see "You are logged in as mjohann@web.de"
    And I go to the new artist page
    And I fill in "Artist name" with "Johann Könich"
    And I press "Save"
    Then I should see "Artist was successfully created."

  Scenario: Try to add an artist as anonymous fails
    Given I am not authenticated
    And I am on the home page
    And I should see "Sign in Not registered? Sign up"
    And I go to the new artist page
    Then I should see "Sign in"
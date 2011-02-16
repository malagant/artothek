Feature: Manage artists
  In order to manage
  Artists
  I want to add artists
  
  Scenario Outline: Add a new artist only when authenticated
    Given I am logged in as "mjohann@web.de" with password "1223456"
    And I am on the home page
    And I should see "You are logged in as mjohann@web.de"
    And I go to the new artist page
    And I fill in "artist_name" with "<name>"
    And I press "Save"
    Then I should see "Artist was successfully created."

  Examples:
    | name  |
    | Helge Schneider |
    | Marek Fis       |
    | Sascha Grammel  |
    | Johann Könich   |

  Scenario: Try to add an artist as anonymous fails
    Given I am not authenticated
    And I am on the home page
    And I should see "Sign in Not registered? Sign up"
    And I go to the new artist page
    Then I should see "Sign in"

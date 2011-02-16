Feature: Manage users
  In order to work with artothek
  User
  wants to be registered to login
  
  Scenario: Anonymous user can register
    Given I am not authenticated
    And I am on the homepage
    And I go to the sign up page
    Then I should see "Sign up"
    When I fill in "Email" with "steve@apple.com"
    And I fill in "Password" with "123456"
    And I fill in "Password confirmation" with "123456"
    And I press "Sign up"
    Then I should be on the homepage
    Then I should see "Welcome to artothek"

  Scenario: Anonymous user can login
    Given I am registered as "mjohann@web.de" with password "123456"
    And I am on the homepage
    When I go to the sign in page
    Then I should see "Sign in"
    And I fill in "Email" with "mjohann@web.de"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should be on the homepage
    Then I should see "Welcome to artothek"
    Then I should see "You are logged in as mjohann@web.de. Logout."

  Scenario: Login user without credentials
    Given I am on the homepage
    When I go to the sign in page
    Then I should see "Sign in"
    And I press "Sign in"
    Then I should be on the sign in page
    Then I should see "Sign in"
    Then I should not see "You are logged in as mjohann@web.de. Logout."

  Scenario: Logout authenticated user
    Given I am on the homepage
    And I am logged in as "mjohann@web.de" with password "123456"
    And I should see "You are logged in as mjohann@web.de. Logout."
    When I go to the sign out page
    Then I should be on the homepage
    Then I should see "Welcome to artothek"

  Scenario: Anonymous user can list users
    Given I am not authenticated
    And the following users:
      | email                          | password | artist        |
      | mjohann@rails-experts.com      | 123456   | Johann Könich |
      | helge@schneider.com            | 123456   | Otto Waalkes  |
      | steve@apple.com                | 123456   | Jack Rabbit   |

    And I am on the home page
    When I go to the users page
    Then I should see "User list"
    And I should not see "mjohann@web.de"
    And I should see "helge@schneider.com"
    And I should see "steve@apple.com"
    And I should not see "New artist"

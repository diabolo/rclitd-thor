Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  @wip
  Scenario: App just runs
    When I run `todo help`
    Then the exit status should be 0


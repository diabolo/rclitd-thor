Feature: Custom location

  As a todoer
  I want to store my todo's in a location of my choosing
  So I can control where my todo's are stored

  Scenario: Store todo's in custom location
    Given there is a custom location
    When I add a task with the custom location
    Then my task should be stored in the custom location

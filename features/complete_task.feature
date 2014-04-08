Feature: Complete task
  When I complete a task
  I want to record that the task is done
  So that I don't duplicate effort and I have a record of achievement


  Background:
    Given I have added some tasks

  Scenario: Complete a task
    When I complete a task
    Then there should be a completed task

  Scenario: List completed task
    When I complete a task
    And I list my completed tasks
    Then I should see one task



Feature: Account details
 
  Background:
    Given the customer is logged in
    And the customer is on the "Account details" page

  @positive
  Scenario Outline: Customer updates account details with valid information
    When the customer enters first name "<firstName>"
    And the customer enters last name "<lastName>"
    And the customer enters display name "<displayName>"
    And the customer enters email "<email>"
    And the customer clicks on the "SAVE CHANGES" button
    Then the system updates the customer account details
    And the system displays the message "<successMessage>"

    Examples:
      | firstName | lastName | displayName  | email                    | successMessage                |
      | Georges   | Moukala  | Georges241   | georges.tester@gmail.com | Account details changed successfully. |
      | Erwin     | Kayden   | ErwinKgl     | erwin.kgl@gmail.com      | Account details changed successfully. |
      | Christian | Byi      | ChristianQA  | christian.qa@gmail.com   | Account details changed successfully. |

  @negative
  Scenario Outline: System prevents updating account details with missing or invalid data
    When the customer enters first name "<firstName>"
    And the customer enters last name "<lastName>"
    And the customer enters display name "<displayName>"
    And the customer enters email "<email>"
    And the customer clicks on the "SAVE CHANGES" button
    Then the system displays the message "<errorMessage>"
    And the system does not update the customer account details
    And the system keeps the customer on the "Account details" page

    Examples:
      | firstName | lastName | displayName | email                    | errorMessage                                                       |
      |           | Moukala  | Georges241  | georges.tester@gmail.com | First name is a required field.                                    |
      | Georges   |          | Georges241  | georges.tester@gmail.com | Last name is a required field.                                     |
      | Georges   | Moukala  |             | georges.tester@gmail.com | Display name is a required field.                                  |
      | Georges   | Moukala  | Georges241  |                          | Email address is a required field.                                 |
      | Georges   | Moukala  | Georges241  | invalid-email            | Please provide a valid email address.                              |

  @positive
  Scenario: Customer changes password with valid credentials
    When the customer enters current password "ValidPassword123!"
    And the customer enters new password "NewStrongPass2026!"
    And the customer confirms new password "NewStrongPass2026!"
    And the customer clicks on the "SAVE CHANGES" button
    Then the system updates the customer password
    And the system displays the message "Account details changed successfully."

  @negative
  Scenario Outline: System prevents changing password with invalid input
    When the customer enters current password "<currentPassword>"
    And the customer enters new password "<newPassword>"
    And the customer confirms new password "<confirmPassword>"
    And the customer clicks on the "SAVE CHANGES" button
    Then the system displays the message "<errorMessage>"
    And the system does not update the customer password

    Examples:
      | currentPassword   | newPassword        | confirmPassword    | errorMessage                               |
      | WrongPassword123! | NewStrongPass2026! | NewStrongPass2026! | Your current password is incorrect.        |
      | ValidPassword123! | NewStrongPass2026! | DifferentPass999!  | New passwords do not match.              |
      | ValidPassword123! | 123                | 123                | Password must meet the minimum length.     |
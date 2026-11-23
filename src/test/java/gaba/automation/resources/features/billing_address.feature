Feature: Billing Address

  Background:
    Given the customer is logged in
    And the customer is on the "Addresses" page
    And the customer clicks on "Edit" button of the Billing address section

  @positive
  Scenario Outline: Customer updates billing address with valid information
    When the customer enters billing first name "<firstName>"
    And the customer enters billing last name "<lastName>"
    And the customer selects billing country "<country>"
    And the customer enters billing street address "<streetAddress>"
    And the customer enters billing city "<city>"
    And the customer enters billing postal code "<postalCode>"
    And the customer enters billing phone "<phone>"
    And the customer enters billing email "<email>"
    And the customer clicks on the "SAVE ADDRESS" button
    Then the system updates the customer billing address
    And the system displays the message "<successMessage>"

    Examples:
      | firstName | lastName | country | streetAddress       | city       | postalCode | phone         | email                    | successMessage                |
      | Georges   | Moukala  | Rwanda  | KG 123 St           | Kigali     | 00000      | +250788000001 | georges.tester@gmail.com | Address changed successfully. |
      | Erwin     | Kayden   | Gabon   | Boulevard Triomphal | Libreville | 24100      | +24107000002  | erwin.kgl@gmail.com      | Address changed successfully. |

  @negative
  Scenario Outline: System prevents updating billing address with missing or invalid required fields
    When the customer enters billing first name "<firstName>"
    And the customer enters billing last name "<lastName>"
    And the customer selects billing country "<country>"
    And the customer enters billing street address "<streetAddress>"
    And the customer enters billing city "<city>"
    And the customer enters billing phone "<phone>"
    And the customer enters billing email "<email>"
    And the customer clicks on the "SAVE ADDRESS" button
    Then the system displays the message "<errorMessage>"
    And the system does not update the customer billing address
    And the system keeps the customer on the "Billing address" page

    Examples:
      | firstName | lastName | country | streetAddress | city   | phone         | email                    | errorMessage                                |
      |           | Moukala  | Rwanda  | KG 123 St     | Kigali | +250788000001 | georges.tester@gmail.com | Billing First name is a required field.     |
      | Georges   |          | Rwanda  | KG 123 St     | Kigali | +250788000001 | georges.tester@gmail.com | Billing Last name is a required field.      |
      | Georges   | Moukala  | Rwanda  |               | Kigali | +250788000001 | georges.tester@gmail.com | Billing Street address is a required field. |
      | Georges   | Moukala  | Rwanda  | KG 123 St     |        | +250788000001 | georges.tester@gmail.com | Billing Town / City is a required field.    |
      | Georges   | Moukala  | Rwanda  | KG 123 St     | Kigali |               | georges.tester@gmail.com | Billing Phone is a required field.          |
      | Georges   | Moukala  | Rwanda  | KG 123 St     | Kigali | +250788000001 | invalid-email            | Invalid billing email address.              |
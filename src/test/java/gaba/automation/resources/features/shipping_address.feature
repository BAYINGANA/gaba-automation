Feature: Shipping Address


  Background:
    Given the customer is logged in
    And the customer is on the "Address" page
    And the customer clicks on "Edit" button of the Shipping address section


  @positive
  Scenario Outline: Customer updates shipping address with valid information
   When the customer enters shipping first name "<firstName>"
    And the customer enters shipping last name "<lastName>"
    And the customer selects shipping country "<country>"
    And the customer enters shipping street address "<streetAddress>"
    And the customer enters shipping city "<city>"
    And the customer enters shipping postal code "<postalCode>"
    And the customer clicks on the "SAVE ADDRESS" button
    Then the system updates the customer shipping address
    And the system displays the message "<successMessage>"

    Examples:
      | firstName | lastName | country | streetAddress       | city       | postalCode | successMessage                |
      | Georges   | Moukala  | Rwanda  | KN 45 Ave           | Kigali     | 00000      | Address changed successfully. |
      | Erwin     | Kayden   | Gabon   | Boulevard Triomphal | Libreville | 24100      | Address changed successfully. |

  @negative
  Scenario Outline: System prevents updating shipping address with missing required fields
    When the customer enters shipping first name "<firstName>"
    And the customer enters shipping last name "<lastName>"
    And the customer selects shipping country "<country>"
    And the customer enters shipping street address "<streetAddress>"
    And the customer enters shipping city "<city>"
    And the customer clicks on the "SAVE ADDRESS" button
    Then the system displays the message "<errorMessage>"
    And the system does not update the customer shipping address
    And the system keeps the customer on the "Shipping address" page

    Examples:
      | firstName | lastName | country | streetAddress | city   | errorMessage                                 |
      |           | Moukala  | Rwanda  | KN 45 Ave     | Kigali | Shipping First name is a required field.     |
      | Georges   |          | Rwanda  | KN 45 Ave     | Kigali | Shipping Last name is a required field.      |
      | Georges   | Moukala  | Rwanda  |               | Kigali | Shipping Street address is a required field. |
      | Georges   | Moukala  | Rwanda  | KN 45 Ave     |        | Shipping Town / City is a required field.    |
Feature: Account creation during checkout

  Background:

    Given the customer is on the Checkout page with products in the cart

  @positive
  Scenario Outline: Customer places an order and creates an account during checkout
    When the customer enters <BillingEmail> in the "Email address" field
    When the customer ticks the "Create an account?" checkbox
    When the customer enters <AccountUsername> in the "Account username" field
    When the customer enters <AccountPassword> in the "Create account password" field
    When the customer selects <PaymentMethod> as the payment method
    When the customer clicks the "Place order" button
    Then the order received page is displayed with the message "Thank you. Your order has been received."

    Examples:
      | BillingEmail          | AccountUsername | AccountPassword | PaymentMethod        |
      | gabanew01@example.com | gabanew01       | Gaba@2026!New1  | Direct bank transfer |
      | gabanew03@example.com | gabanew03       | Gaba@2026!New3  | Check payments       |
      | gabanew04@example.com | gabanew04       | Gaba@2026!New4  | Cash on delivery     |

  @positive
  Scenario Outline: Customer gets an account with the billing email address after placing the order
    When the customer enters <BillingEmail> in the "Email address" field
    When the customer ticks the "Create an account?" checkbox
    When the customer enters <AccountUsername> in the "Account username" field
    When the customer enters <AccountPassword> in the "Create account password" field
    When the customer clicks the "Place order" button
    When the customer opens the Account page
    When the customer clicks "Account details" in the account menu
    Then the "Email address" field contains <BillingEmail>

    Examples:
      | BillingEmail          | AccountUsername | AccountPassword |
      | gabanew01@example.com | gabanew01       | Gaba@2026!New1  |
      | gabanew02@example.com | gabanew02       | Gaba@2026!New2  |

  @positive
  Scenario Outline: Customer places an order without creating an account
    When the customer enters <BillingEmail> in the "Email address" field
    When the customer clicks the "Place order" button
    Then the order received page is displayed with the message "Thank you. Your order has been received."

    Examples:
      | BillingEmail          |
      | gabanew18@example.com |
      | gabanew19@example.com |
      | gabanew17@example.com |


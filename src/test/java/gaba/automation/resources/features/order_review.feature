Feature: Order review
  Background:

    Given the customer is on the AskOmDch website

  @positive
  Scenario: Customer opens the Checkout page and sees the headings of the Your order table
    Given the customer is on the Cart page with at least one product in the cart
    When the customer clicks the "Proceed to checkout" button
    Then the Checkout page is displayed with the "Your order" section
    Then the "Your order" table displays the column headings "Product" and "Subtotal"

  @positive
  Scenario Outline: Customer sees the same products, quantities and Subtotal on the Checkout page as on the Cart page
    When the customer clicks the "Add to cart" button of <Product1> on the Store page
    When the customer clicks the "Add to cart" button of <Product2> on the Store page
    When the customer clicks the "Add to cart" button of <Product3> on the Store page
    When the customer clicks the "View cart" link
    When the customer enters <Quantity1> in the quantity field of <Product1>
    When the customer enters <Quantity2> in the quantity field of <Product2>
    When the customer enters <Quantity3> in the quantity field of <Product3>
    When the customer clicks the "Update cart" button
    When the customer clicks the "Proceed to checkout" button
    Then the Checkout page is displayed with the "Your order" section
    Then the "Your order" table displays one row per product in the same order as on the Cart page: "<Product1> × <Quantity1>", "<Product2> × <Quantity2>" and "<Product3> × <Quantity3>"
    Then the Subtotal row displays <Subtotal>, equal to the Subtotal of the Cart page

    Examples:
      | Product1         | Quantity1        | Product2 | Quantity2 | Product3 | Quantity3 | Subtotal |        |               |               |         |
      | Anchor Bracelet  | Basic Blue Jeans | 1        | 1         | $10.00   | $30.00    | $10.00   | $30.00 | sale price    | regular price | $40.00  |
      | Anchor Bracelet  | Basic Blue Jeans | 2        | 3         | $20.00   | $90.00    | $10.00   | $30.00 | sale price    | regular price | $110.00 |
      | Basic Blue Jeans | Anchor Bracelet  | 1        | 4         | $30.00   | $40.00    | $30.00   | $10.00 | regular price | sale price    | $70.00  |


  @positive
  Scenario Outline: Customer sees the Subtotal, Shipping, state tax and Total rows of the Your order table for a United States state
    When the customer clicks the "Add to cart" button of <Product1> on the Store page
    When the customer clicks the "Add to cart" button of <Product2> on the Store page
    When the customer clicks the "View cart" link
    When the customer enters <Quantity1> in the quantity field of <Product1>
    When the customer enters <Quantity2> in the quantity field of <Product2>
    When the customer clicks the "Update cart" button
    When the customer clicks the "Proceed to checkout" button
    When the customer selects <State> in the State field
    Then <State> is selected
    Then the rows below the product rows are displayed in this order: Subtotal <Subtotal>, Shipping "<ShippingText>", <TaxLabel> <TaxAmount>, Total <Total>
    Then the Subtotal equals the sum of the line subtotals of the product rows
    Then the Total equals the Subtotal plus the Shipping cost plus <TaxAmount>
    Then all amounts are displayed with the $ symbol and two decimal places

    Examples:
      | Product1        | Quantity1        | Product2 | Quantity2 | State      | Subtotal | ShippingText     | TaxLabel     | TaxAmount | Total   |
      | Anchor Bracelet | Basic Blue Jeans | 1        | 1         | California | $40.00   | Flat rate: $5.00 | CA State Tax | $3.00     | $48.00  |
      | Anchor Bracelet | Basic Blue Jeans | 1        | 1         | New York   | $40.00   | Flat rate: $5.00 | NY State Tax | $1.60     | $46.60  |
      | Anchor Bracelet | Basic Blue Jeans | 3        | 2         | California | $90.00   | Flat rate: $5.00 | CA State Tax | $6.75     | $101.75 |
      | Anchor Bracelet | Basic Blue Jeans | 3        | 2         | New York   | $90.00   | Flat rate: $5.00 | NY State Tax | $3.60     | $98.60  |


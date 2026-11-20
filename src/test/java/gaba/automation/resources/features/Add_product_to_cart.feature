Feature: Add product to cart

  Background:
    Given the customer is on the Store page

  @positive
  Scenario: Customer adds a product to the cart from the Store page
    When the customer clicks the "ADD TO CART" button of the product "Denim Blue Jeans".
    Then the system adds "Denim Blue Jeans" to the cart with a quantity of 1.
    Then the system displays a "View cart" link under the selected product.

  @positive
  Scenario Outline: Customer adds a product to the cart from a Category page
    When the customer goes to the "<Category>" category page
    When the customer clicks the "ADD TO CART" button of "<Product>"
    Then "<Product>" is added to the shopping cart
    Then the system displays a clickable "View cart" link

    Examples:
      | Category    | Product              |
      | Men         | Basic Blue Jeans     |
      | Women       | Anchor Bracelet      |
      | Accessories | Boho Bangle Bracelet |

  @positive
  Scenario Outline: Customer adds a product with the default quantity from the Product Details page
    When the customer selects "<Product>" from the Store page
    When the customer leaves the quantity field unchanged
    When the customer clicks the "ADD TO CART" button
    Then the system displays the message "<Product>" has been added to your cart.
    Then the system displays a "VIEW CART" button

    Examples:
      | Product          | Default Quantity |
      | Denim Blue Jeans |                1 |
      

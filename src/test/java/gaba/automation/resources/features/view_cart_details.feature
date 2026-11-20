Feature: View cart details

  Background:
    Given the customer is on the Cart page.

  @positive
  Scenario Outline: Cart displays the correct total including subtotal, flat-rate shipping and CA State Tax
    Given the customer's cart contains products.
    When the customer add "<product_1>" with its "<quantity_1>"
    When the customer add "<product_2>" with its "<quantity_2>"
    When the customer Click the "View cart" link
    When the customer Compare the Subtotal, CA State Tax and Total in the cart totals
    Then the system displays the "<cart_subtotal_expected>"
    Then the system displays the"<flat_rate_shipping_expected>"
    Then the system displays the "<ca_state_tax_expected>"
    Then the system displays the "<cart_total_expected>"

    Examples:
      | product_1        | product_url_1                                  | quantity_1 | unit_price_1 | product_2        | product_url_2                                  | quantity_2 | unit_price_2 | cart_subtotal_expected | flat_rate_shipping_expected | ca_state_tax_expected | cart_total_expected |
      | Denim Blue Jeans | https://askomdch.com/product/denim-blue-jeans/ |          1 |        100.0 | Basic Blue Jeans | https://askomdch.com/product/basic-blue-jeans/ |          1 |         30.0 |                  130.0 |                             |                       |                     |

  @positive
  Scenario: PROCEED TO CHECKOUT button is displayed when the cart contains products (GABA-440)
    Given the customer's cart contains a product.
    When the customer Click the "ADD TO CART" button
    When the customer Click the "View cart" link (or open the Cart page).
    When the customer Looks at the cart totals section.
    Then A PROCEED TO CHECKOUT button is displayed.

  @positive
  Scenario: PROCEED TO CHECKOUT button redirects the customer to the Checkout page
    Given the customer's cart contains aproduct.
    When the cutomer click the "ADD TO CART" button.
    When the customer click the "View cart" link (or open the Cart page)
    When the customer click the PROCEED TO CHECKOUT button.
    Then the customer is redirected to the Checkout page.

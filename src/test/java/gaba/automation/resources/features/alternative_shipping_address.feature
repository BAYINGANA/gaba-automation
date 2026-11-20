Feature: Alternative Shipping Address

    Background:
        Given the Customer is on the "Checkout-Page"
        Given the Customer have products in the cart

    @positive
    Scenario: Display and Open Alternative Shipping Address Form
        When the Customer navigates the "Checkout Page" to "ship to different address" location
        When the Customer check the "Ship to different address" checkbox
        Then the System should display "Ship to different address form" which will display first name,last name,company name,country/region,street address,town/city,state,zip code and order notes inputs

    @positive
    Scenario: Hide Alternative Shipping Address Form
        When the Customer navigates the "Checkout Page" to "ship to different address" location
        When the Customer uncheck the "Ship to different address" checkbox
        Then the System should hide the "Ship to different address form"

    @positive
    @Scenario Outline: System to accept different shipping address with valid information
        Given the Customer has completed the Billing details
        When the Customer check the "Ship to different address" checkbox
        When the Customer enters "<first_name>" in First Name field
        When the Customer enters "<last_name>" in Last Name field
        When the Customer enters "<company_name>" in Company field
        When the Customer enters "<country_region>" int Country/Region field
        When the Customer clicks "PLACE ORDER" Button
        Then the Customer should be redirected on the "Order-Recieved Page" with "Thank You. Your order has been recieved" message and he will view order information with shipping to alternative address information which are First Name:"<first_name>" Last Name:"<last_name>" Company Name:"<company_name>" Country/Region:"<country_region>" Street Address:"<street_address>" Town City:"<town_city>" State:"<state>" Zip Code:"zip_code" and Order Notes:"<order_notes>"


        Examples:
            | first_name | last_name | company_name | country_region    | street_address  | zip_code | state    | order_notes |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |



    @negative
    @Scenario Scenario Outline : System to Reject different shipping address with invalid information
        Given the Customer has completed the Billing details
        When the Customer check the "Ship to different address" checkbox
        When the Customer enters "<first_name>" in First Name field
        When the Customer enters "<last_name>" in Last Name field
        When the Customer enters "<company_name>" in Company field
        When the Customer enters "<country_region>" int Country/Region field
        When the Customer clicks "PLACE ORDER" Button
        Then the Customer should stay on "Checkout Page" with "<error_message>" being displayed
        But The Customer should not be redirected on the "Order-Recieved Page".


        Examples:
            | first_name | last_name | company_name | country_region    | street_address  | zip_code | state    | order_notes |error_message    |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |                 |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |                 |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |                 |
            | John       | Doe       |              | United States(us) | 123 Main Street | 10011    | New York |             |                 |





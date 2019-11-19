# Jungle

Jungle is a mini e-commerce application built with Rails 4.2, optimal for those eager to learn the fundamentals of a Rails app.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Login / Logout Functionality

- When signing up for an account, a validator for passwords to contain at least 3 characters is in place.

- If the login form is submitted with any field left blank, the login page is refreshed.

- An http authentication is also in place for access to anything under the namespace 'admin'.


# Final Product

## All Products

!["All Products"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/admin-all-products.jpg?raw=true)

## My Cart

!["My Cart"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/my-cart.jpg?raw=true)

## Checkout

!["Checkout"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/checkout.jpg?raw=true)

## Order Confirmation

!["Order Confirmation"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/order-confirmation.jpg?raw=true)

## Admin Dashboard

!["Admin Dashboard"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/admin-dashboard.jpg?raw=true)

## Admin: All Products

!["Admin: All Products"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/admin-all-products.jpg?raw=true)

## Admin: New Product

!["Admin: New Product"](https://github.com/JacksonStark/jungle-rails/blob/master/docs/admin-new-product.jpg?raw=true)

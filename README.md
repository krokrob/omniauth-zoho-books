# Omniauth ZohoBooks

This is an OmniAuth strategy for authenticating to [Zoho Books](https://www.zoho.com/books/). To use it, you'll need to sign up for an OAuth2 `client_id` and `client_secret` on the Zoho Books [developer console](https://accounts.zoho.com/developerconsole).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-zoho-books'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-zoho-books

## Usage

### For Rack-based applications
```ruby
use OmniAuth::Builder do
  provider :zoho_books, ENV['ZOHO_BOOKS_CLIENT_ID'], ENV['ZOHO_BOOKS_CLIENT_SECRET'], scope: 'ZohoBooks.fullaccess.all', access_type: 'offline'
end
```

### In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :zoho_books, ENV['ZOHO_BOOKS_CLIENT_ID'], ENV['ZOHO_BOOKS_CLIENT_SECRET'], scope: 'ZohoBooks.fullaccess.all', access_type: 'offline'
end
```

### Using with Devise

```ruby
require 'omniauth-zoho-books'

Devise.setup do |config|
  # some stuff...

  config.omniauth provider :zoho_books, ENV['ZOHO_BOOKS_CLIENT_ID'], ENV['ZOHO_BOOKS_CLIENT_SECRET'], scope: 'ZohoBooks.fullaccess.all', access_type: 'offline'

  # some other stuff...
end
```

### Scopes

Zoho Books API lets you choose from a large different scopes.

<table>
  <thead>
  <tr>
      <th>Scope</th>
      <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td>contacts</td>
      <td>To access contacts related APIs<br> Availabe types: <code>ZohoBooks.contacts.Create, ZohoBooks.contacts.UPDATE, ZohoBooks.contacts.READ, ZohoBooks.contacts.DELETE</code></td>
  </tr>
  <tr>
      <td>settings</td>
      <td>To access items, expense categories, users, taxes, currencies, opening balances related APIs<br> Availabe types: <code>ZohoBooks.settings.Create, ZohoBooks.settings.UPDATE, ZohoBooks.settings.READ, ZohoBooks.settings.DELETE</code></td>
  </tr>
  <tr>
      <td>estimates</td>
      <td>To access estimates related APIs<br> Availabe types: <code>ZohoBooks.estimates.Create, ZohoBooks.estimates.UPDATE, ZohoBooks.estimates.READ, ZohoBooks.estimates.DELETE</code></td>
  </tr>
  <tr>
      <td>invoices</td>
      <td>To access invoices related APIs<br> Availabe types: <code>ZohoBooks.invoices.Create, ZohoBooks.invoices.UPDATE, ZohoBooks.invoices.READ, ZohoBooks.invoices.DELETE</code></td>
  </tr>
  <tr>
      <td>customerpayments</td>
      <td>To access customer payments related APIs<br> Availabe types: <code>ZohoBooks.customerpayments.Create, ZohoBooks.customerpayments.UPDATE, ZohoBooks.customerpayments.READ, ZohoBooks.customerpayments.DELETE</code></td>
  </tr>
  <tr>
      <td>creditnotes</td>
      <td>To access credit notes related APIs<br> Availabe types: <code>ZohoBooks.creditnotes.Create, ZohoBooks.creditnotes.UPDATE, ZohoBooks.creditnotes.READ, ZohoBooks.creditnotes.DELETE</code></td>
  </tr>
  <tr>
      <td>projects</td>
      <td>To access projects related APIs<br> Availabe types: <code>ZohoBooks.projects.Create, ZohoBooks.projects.UPDATE, ZohoBooks.projects.READ, ZohoBooks.projects.DELETE</code></td>
  </tr>
  <tr>
      <td>expenses</td>
      <td>To access expenses related APIs<br> Availabe types: <code>ZohoBooks.expenses.Create, ZohoBooks.expenses.UPDATE, ZohoBooks.expenses.READ, ZohoBooks.expenses.DELETE</code></td>
  </tr>
  <tr>
      <td>salesorder</td>
      <td>To access salesorder related APIs<br> Availabe types: <code>ZohoBooks.salesorders.Create, ZohoBooks.salesorders.UPDATE, ZohoBooks.salesorders.READ, ZohoBooks.salesorders.DELETE</code></td>
  </tr>
  <tr>
      <td>purchaseorder</td>
      <td>To access purchaseorder related APIs<br> Availabe types: <code>ZohoBooks.purchaseorders.Create, ZohoBooks.purchaseorders.UPDATE, ZohoBooks.purchaseorders.READ, ZohoBooks.purchaseorders.DELETE</code></td>
  </tr>
  <tr>
      <td>bills</td>
      <td>To access bills related APIs<br> Availabe types: <code>ZohoBooks.bills.Create, ZohoBooks.bills.UPDATE, ZohoBooks.bills.READ, ZohoBooks.bills.DELETE</code></td>
  </tr>
  <tr>
      <td>debitnotes</td>
      <td>To access debitnote related APIs<br> Availabe types: <code>ZohoBooks.debitnotes.Create, ZohoBooks.debitnotes.UPDATE, ZohoBooks.debitnotes.READ, ZohoBooks.debitnotes.DELETE</code></td>
  </tr>
  <tr>
      <td>vendorpayments</td>
      <td>To access vendorpayment related APIs<br> Availabe types: <code>ZohoBooks.vendorpayments.Create, ZohoBooks.vendorpayments.UPDATE, ZohoBooks.vendorpayments.READ, ZohoBooks.vendorpayments.DELETE</code></td>
  </tr>
  <tr>
      <td>banking</td>
      <td>To access banking related APIs<br> Availabe types: <code>ZohoBooks.banking.Create, ZohoBooks.banking.UPDATE, ZohoBooks.banking.READ, ZohoBooks.banking.DELETE</code></td>
  </tr>
  <tr>
      <td>accountants</td>
      <td>To access accountant related APIs<br> Availabe types: <code>ZohoBooks.accountants.Create, ZohoBooks.accountants.UPDATE, ZohoBooks.accountants.READ, ZohoBooks.accountants.DELETE</code></td>
  </tr>
  </tbody>
</table>

You can combine several scopes:

```ruby
provider :zoho_books, ENV['ZOHO_BOOKS_CLIENT_ID'], ENV['ZOHO_BOOKS_CLIENT_SECRET'], scope: 'ZohoBooks.contacts.Create,ZohoBooks.contacts.READ', access_type: 'offline'
```

Or require all at once with `ZohoBooks.fullaccess.all` scope.

## Auth Hash Example

Here is the Auth Hash returned by Zoho Books:

```ruby
{
  provider: 'zoho_books',
  uid: '10234695',
  info: {
    name: 'Zillum',
    email: 'johnsmith@zillum.com'
  },
  credentials: {
    expires: true,
    token: '1000.41d9f2cfbd1b7a8f9e314b7aff7bc2d1.8fcc9810810a216793f385b9dd6e125f'
  },
  extra: {
    raw_info: {
      "code": 0,
      "message": "success",
      "organizations": [
        {
          "organization_id": "10234695",
          "name": "Zillum",
          "contact_name": "John Smith",
          "email": "johnsmith@zillum.com",
          "is_default_org": false,
          "language_code": "en",
          "fiscal_year_start_month": 0,
          "account_created_date": "2016-02-18",
          "time_zone": "PST",
           "is_org_active": true,
          "currency_id": "460000000000097",
          "currency_code": "USD",
          "currency_symbol": "$",
          "currency_format": "###,##0.00",
          "price_precision": 2
        },
        {...},
        {...}
      ]
    }
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krokrob/omniauth-zoho-books. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::ZohoBooks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/krokrob/omniauth-zoho-books/blob/master/CODE_OF_CONDUCT.md).

![Build status](https://travis-ci.org/leereilly/fortune-finder.svg?branch=master)

The Fortune 1000 is an annual list compiled and published by Fortune magazine that ranks the top 1000 U.S. corporations as ranked by their gross revenue after various adjustments are made. Use this gem to look up Fortune 1000 companies based on a domain name or email address and generate reports / say things like...

> :bar_chart: Over **25%** of the **Fortune 500** are using our product

> :chart_with_upwards_trend: We have customers in  **all** of the **Fortune 100** companies

# Installation

This is a Ruby gem, so you'll need a little Ruby-fu to get it working.

```
gem install fortune-finder
```

Or add this to your `Gemfile`:

```
gem 'fortune-finder', '~> 0.1.1'
```

# Usage

```ruby

record = FortuneFinder::lookup 'exxonmobil.com'
# => <FortuneFinder::Record:0x007fca82a46060>

record.name
# => "Exxon Mobil"

record.rank
# => 1

record.alias
# => false
```

It'll work with email addresses, subdomains and more e.g.

```ruby
FortuneFinder::lookup('www.oracle.co.uk').rank
# => 82

FortuneFinder::lookup('william.gates@microsoft.com').rank
# 37

FortuneFinder::lookup('https://developer.apple.com/devcenter/ios/checklist/').rank
# => 17
```

It'll also work with aliases or subsidiaries, but I'll need *your* help (see [contribution guidelines](/CONTRIBUTING.md) if you're interested).

```ruby
FortuneFinder::lookup('ebayinc.com').rank
# => 228
FortuneFinder::lookup('ebayinc.com').alias
# => false

FortuneFinder::lookup('ebay.com').rank
# => 228
FortuneFinder::lookup('ebay.com').alias
# => true

FortuneFinder::lookup('paypal.com').rank
# => 228
FortuneFinder::lookup('paypal.com').alias
# => true
FortuneFinder::lookup('paypal.com').name
# => eBay
FortuneFinder::lookup('paypal.com').domain
# => ebayinc.com
```

# Limitations

* There may be cases where the company you're looking up up is a subsidiary of a Fortune 500 company that has a different domain name e.g. eBay is a Fortune 500 company identified primarily with `ebayinc.com`, but has many associated domains / subsidiaries like `ebay.com` and `paypal.com`. Using the power of Git, GitHub and TOML you can help identify those relationships. Please read the [contribution guidelines](/CONTRIBUTING.md) if you'd like to help.

**Data source(s):**
* http://money.cnn.com/magazines/fortune/fortune500/2012/full_list/

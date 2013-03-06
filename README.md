fortune-finder
==============

The Fortune 500 is an annual list compiled and published by Fortune magazine that ranks the top 500 U.S. closely held and public corporations as ranked by their gross revenue after adjustments made by Fortune to exclude the impact of excise taxes companies incur. The list includes publicly and privately held companies for which revenues are publicly available. Use this gem to ook up Fortune 500 companies based on a domain name or email address.

# Installation

`gem install fortune-finder`

# Usage

```ruby

FortuneFinder::lookup 'exxonmobil.com'
# => {:rank => 1, :name => 'Exxon Mobil'}

FortuneFinder::lookup 'www.weir.co.uk'
# => {:rank => 1749, :name => 'Weir Group'}

FortuneFinder::lookup 'william.gates@microsoft.com'
# => {:rank => 42, :name => 'Microsoft'}

FortuneFinder::lookup 'https://developer.apple.com/devcenter/ios/checklist/'
# => {:rank => 22, :name => 'Microsoft'}

FortuneFinder::lookup 'UltraInfoMegaTechCorp.com'
# => nil

FortuneFinder::lookup 'POTATO!'
# => nil
```

# Limitations

* There may be cases when the company you're lookup up is a subsidiary of a Fortune 500 company that has a different domain name.

**Data source(s):**
* http://money.cnn.com/magazines/fortune/fortune500/2012/full_list/





# Contributing to Forbes Finder

## Creating aliases / subsidiaries

In this example, there's a file called `ebayinc.com.toml` with the following contents:

```toml
name = "eBay"
domain = "ebayinc.com"
rank = 228
```

That file ensures that `ebayinc.com` will be recognized as a Fortune 500 company. To ensure that `paypal.com` and `ebay.com` are both recognized, we'll need to add two additional files `ebay.com.toml` and `paypal.com.toml` that are symlinks to `ebayinc.com.toml`:

```
cd lib/data/2012
ln -s ebayinc.com.toml ebay.com.toml
git add ebay.com.toml
git commit -m "Add alias for ebay.com"
git push origin master
```

## General Guidelines

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
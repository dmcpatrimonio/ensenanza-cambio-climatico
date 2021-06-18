source "https://rubygems.org"
gem "jekyll", "~> 4.2.0"
gem "minimal-mistakes-jekyll", "~>4.23.0"
# The following plugins are automatically loaded by the theme-gem:
#   gem "jekyll-paginate"
#   gem "jekyll-sitemap"
#   gem "jekyll-gist"
#   gem "jekyll-feed"
#   gem "jekyll-include-cache"
group :jekyll_plugins do
  gem "jekyll-archives"
  gem "jekyll-coffeescript"
  gem "jekyll-data"
  gem "jekyll-pandoc"
  gem "jekyll-relative-links"
  gem "jekyll-scholar"
  gem "jekyll-seo-tag"
  # Sassc is preferred to the legacy ruby-sass
  gem "sassc"
  # Required by Ruby 3
  gem "webrick"
  gem "stringex"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?


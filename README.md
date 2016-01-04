# Jekyll::Writeinpublic [![Build Status](https://travis-ci.org/everypolitician/jekyll-writeinpublic.svg?branch=master)](https://travis-ci.org/everypolitician/jekyll-writeinpublic) [![Gem Version](https://badge.fury.io/rb/jekyll-writeinpublic.svg)](https://badge.fury.io/rb/jekyll-writeinpublic)

Link to WriteInPublic from Jekyll sites.

## Installation

Add this to your application's Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll-writeinpublic'
end
```

And then execute:

    $ bundle

Or install it yourself as and then manually add it to `_config.yml`:

    $ gem install jekyll-writeinpublic

## Usage

First you'll need to configure the subdomain for your WriteInPublic instance in `_config.yml`:

```yaml
writeinpublic:
  subdomain: kenya-politicians
```

Then whenever you want to link to a person's page on WriteInPublic you can use the following liquid tag block:

```liquid
{% writeinpublic_link person.id %}

  Write to {{ person.name }} on WriteInPublic!

{% endwriteinpublic_link %}
```

Which will result in something like this:

```html
<a href="http://kenya-politicians.writeinpublic.com/en/write/who/?person_id=person/123abc">
  Write to Bob on WriteInPublic!
</a>
```

### Adding a class

If you want to add classes to the generated link then you can specify these as part of the `writeinpublic_link` tag.

```liquid
{% writeinpublic_link person.id class: 'writeinpublic writeinpublic-link' %}

  Write to {{ person.name }} on WriteInPublic!

{% endwriteinpublic_link %}
```

Which will result in something like this:

```html
<a href="http://kenya-politicians.writeinpublic.com/en/write/who/?person_id=person/123abc" class="writeinpublic writeinpublic-link">
  Write to Bob on WriteInPublic!
</a>
```

If your WriteInPublic site is still in testing mode you might want to disable this plugin temporarily so the link doesn't show up on the site. You can do this with the `disabled` option:

```yaml
writeinpublic:
  subdomain: kenya-politicians
  disabled: true
```

With this set the plugin won't render anything.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrismytton/jekyll-writeinpublic.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

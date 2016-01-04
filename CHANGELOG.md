# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.3.0] - 2016-01-04

## Added

- You can now specify html attributes as arguments to the `writeinpublic_link` tag, e.g.

```liquid
{% writeinpublic_link person.id class: 'foo bar baz' %}
  Write to {{ person.name }}
{% endwriteinpublic_link %}
```

## [0.2.0] - 2015-12-21

## Added

- There is now a [`disabled` config option](https://github.com/everypolitician/jekyll-writeinpublic#usage) which when set will prevent the plugin from rendering anything.

## 0.1.0 - 2015-12-17

- Initial release

[0.2.0]: https://github.com/everypolitician/jekyll-writeinpublic/compare/v0.1.0...v0.2.0
[0.3.0]: https://github.com/everypolitician/jekyll-writeinpublic/compare/v0.2.0...v0.3.0

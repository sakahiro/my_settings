# MySettings
It generate configs for rails.

## Usage

### Basic Configs

```ruby
$ rails g my_settings:config
```
Then `.ruby-version` will be generated.

### Lints

```ruby
$ rails g my_settings:lint
```
Then `.editorconfig` will be generated.
`--rubocop` and `--scsslint` can be used as option.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'my_settings'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install my_settings
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

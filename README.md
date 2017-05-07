# MySettings
It generate configs for rails.

## Usage

### Basic Config

```ruby
$ rails g my_settings:config
```
Then `.ruby-version` will be generated.
And install gems line below

- better_errors
- dotenv-rails
- bullet

##### option

- pry-byebug
- pry-doc
- pry-rails
- pry-remote


### Lint

```ruby
$ rails g my_settings:lint
```
Then `.editorconfig` will be generated.
`--rubocop` and `--scsslint` can be used as option.

### test

```ruby
$ rails g my_settings:test
```
Then you can choose whether to use rspec or not.
It generate settings link below

- database rewinder
- factory girl rails


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

# Shufu

Shufu is a simple command line generator.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shufu'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shufu

## Usage

```ruby
require "shufu"

schema = {
  git: {
    commit: {
      amend: :flag,
      author: :equal
    }
  }
}

command = Shufu::Command.new(schema)

p command.to_s({ amend: true, author: "cc-kawakami" })

# => "git commit --amend --author=cc-kawakami"
```

### Schema

#### Hash

Hash value means that the key is a command.

```ruby
{
  git: {
    #...
  }
}
```

#### Parameter

`:param` value means that the key is parameter.

```ruby
{
  git: {
    add: {
      path: :param
    }
  }
}
```

#### Flag

`:flag` value means that the key is flag argument like `--key`.
When the input is `true` then the flag argument is output.

```ruby
{
  git: {
    commit: {
      amend: :flag
    }
  }
}
```

#### Equal

`:equal` value means that the key's value is expected to set with `=` like `--key=value`.

```ruby
{
  git: {
    commit: {
      author: :equal
    }
  }
}
```

#### Space

`:space` value means that the key's value is expected to set with space like `--key value`. 

```ruby
{
  git: {
    commit: {
      author: :space
    }
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

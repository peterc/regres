# Regres – A Redis-like Postgres-backed API for Ruby

A prototype Ruby library for presenting a simple data storage interface (initially just key/value), backed by Postgres and inspired by Redis.

## Simple Example

```ruby
db = Regres.new
db.set("mykey", "hello, world")
db.get("mykey")   # => "hello, world"
```

Note that all Regres needs is an accessible Postgres database. By default it uses the `regres_default` table and will create this if it doesn't exist.

The motivation is that I love Redis and its API but there are places where I want the same ease of use backed by a standard, persistent RDBMS, such as when building simple Heroku apps (where a decent sized Redis database is expensive).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'regres'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regres

## Usage

To connect:

    db = Regres.new

Or, more elaborately:

    db = Regres.new("postgres://user:pass@host:5432/dbname")

*Note: If the `DATABASE_URL` environment variable exists, this will be used if no connection URL is specified. Alternatively, it will default to the current user on `localhost`, as the Pg gem does.*

Then issue commands:

    db.set(key, value)
    db.get(key)
    db.del(key)

Those are all of the commands for now.

## To Dos

* ~~Basic key/value storage with strings~~
* `keys` command
* `rename` command
* `exists` command
* Support `inc` and `decr` style manipulation of values
* Support Redis-style expiry times for keys
* Use json columns to support more complex data structures (e.g. hashes)
* Support lists via Postgres arrays(?)
* Support sets via Postgres arrays(?)
* Better support multiple tables
* Could this be a drop-in/substitute for the Redis client library with the right API?

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterc/regres.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


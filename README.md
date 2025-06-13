# Dumpcar

Rake tasks for dumping and restoring the contents of the PostgreSQL database for your Rails application.

- Dump (`rails dumpcar:dump`) and restore your last dump (`rails dumpcar:restore`) with a single command
- Uses your Rails database credentials for your environment

## Installation

Install the gem executing:

```bash
bundle add dumpcar
rails g dumpcar # creates db/dumps folder, adds it to .gitignore and commits
```

## Usage

```bash
rails dumpcar:dump # creates a postgresql dump based on current time like db/dumps/20250601022124.dump
rails dumpcar:restore # restores the last dump made chronologically from the db/dumps directory
```

## Compatibility

Outside of the `rails dumpcar:dump` and `rails dumpcar:restore` commands, don't expect any compatibility guarantees for now.

## Longer term feature goals

- Support other Rails database (MySQL and SQLite)
- Support other Rails environments than the current one
- Ability to clean your db/dumps directory of all dumps before a given time
- Add support for naming a dump (you can manually do this now but not via the rake task)
- Restoring a specific dump via filepath
- Restoring a specific dump by timestamp
- Restoring a specific dump by name
- Restoring a specific dump made before or after a given time
- Extension points for other ways to get a database (Easily get a dump from Heroku's Postgres backups, for example)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You should run `bin/appraisal rspec` to run all of the tests on all of the supported Rails versions. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wwahammy/dumpcar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/wwahammy/dumpcar/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [LGPL-3.0-or-later license](https://github.com/wwahammy/dumpcar/blob/main/LICENSE).

## Code of Conduct

Everyone interacting in the Dumpcar project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/wwahammy/dumpcar/blob/main/CODE_OF_CONDUCT.md).

## Releasing

1. Update the version in the `lib/dumpcar/version.rb`
2. Run the Push Gem workflow

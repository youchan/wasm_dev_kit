# WasmDevKit

This is a [ruby.wasm](https://github.com/ruby/ruby.wasm) development kit.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add wasm_dev_kit
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install wasm_dev_kit
```

## Usage

Start with new project.

```bash
rwdk new [project name]
```

After creating your project, change current directory to project directry.

Write your code in below `src`. for example following code named `hello.rb`

```ruby
puts 'Hello, world'
```

Build your app.

```bash
rwdk build
```

Run your code.
```
rwdk run hello.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/youchan/wasm_dev_kit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


[![hexlet-check](https://github.com/stap780/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/stap780/rails-project-63/actions/workflows/hexlet-check.yml)   
[![CI](https://github.com/stap780/rails-project-63/actions/workflows/ruby.yml/badge.svg)](https://github.com/stap780/rails-project-63/actions/workflows/ci.yml)
# HexletCode

This test gem is for generate forms like SimpleForm gem but very simple.

## Installation

Open Gemfile and add this line:

```ruby
gem 'rails-project-63', github: "stap780/rails-project-63"
```
And then execute:

```
$ bundle install
```

## Usage

Module `HexletCode` has one method `form_for(object, options, &block)`.

You can use that method without block to create empty HTML forms.

```ruby
HexletCode.form_for user, { url: '/users' } do |f|
end

# <form action="/users" method="post"></form>
```
We have only two methods `input` and `submit`. And we can use it with additional data - class, type.

`input` will add label and input inside your form. It has optional parameter `as`, you can send it with `text` symbol and then you will get `textarea` instead of `input`.

And `submit` method will add button to your form.

```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

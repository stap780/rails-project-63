
[![hexlet-check](https://github.com/stap780/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/stap780/rails-project-63/actions/workflows/hexlet-check.yml)   
[![CI](https://github.com/stap780/rails-project-63/actions/workflows/ruby.yml/badge.svg)](https://github.com/stap780/rails-project-63/actions/workflows/ci.yml)

This test gem is for generate forms like SimpleForm gem but very simple.

## How to install
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

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

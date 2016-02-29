# Multilang Field Wrapper

### Install
```ruby
gem 'multilang_field'
```

### Run generator
```console
$ bundle install
$ rails g multilang_field:install
```

`application.js`
```js
//= require jquery
//= require bootstrap-sprockets
```

`application.css.scss`
```scss
 *= require multilang_field


 @import "bootstrap-sprockets";
 @import "bootstrap";
```

Use in view
```erb
  <%= form_for @article do |form| %>
    <%= multilang_wrapper(:title) { |attribute| form.input(attribute) } %>
  <% end %>
```

## TODO
  * TDD
  * Cut out bootstrap



This project rocks and uses MIT-LICENSE.
